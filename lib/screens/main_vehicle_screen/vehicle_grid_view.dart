import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:auto_connect/screens/common_custom_widgets/vehicle_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api_service_classes/car_brands_api.dart';
import '../../api_service_classes/car_model_api.dart';
import '../../api_service_classes/customer_list_api.dart';
import '../../api_service_classes/vehicle_list_api.dart';
import '../../api_service_classes/vehicle_list_fetching_api.dart';

class VehicleGridview extends StatefulWidget {
  final VoidCallback? onRefresh;
  const VehicleGridview({super.key, this.onRefresh});

  @override
  State<VehicleGridview> createState() => _VehicleGridviewState();
}

class _VehicleGridviewState extends State<VehicleGridview> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          key: _vehicleGridViewKey,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,

          ),
          itemCount: _vehicles.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _vehicles.length) {
              return const Center(child: CircularProgressIndicator());
            }
            final vehicle = _vehicles[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
              child: Card(
                elevation: 4.0,
                color: CustomColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: VehicleCard(
                              prefixText: vehicle.platePrefix,
                              plateSourceText: vehicle.stateName,
                              plateCategoryText: vehicle.plateType,
                              plateNo: vehicle.registerNumber,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Customer ID : ${vehicle.customerName}',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Brand ID : ${vehicle.brandName}',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Model ID : ${vehicle.modelName}',
                        style: TextStyle(
                            color: CustomColors.blackColor,
                            fontFamily: 'PoppinsRegular',
                            fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
              ),
            );

          }),
    );
  }

  /// ***on scroll function*** ///
  final VehicleListClass _vehicleListService = VehicleListClass();
  final CarBrandsClass _carBrandsClass = CarBrandsClass();
  final CarModelClass _carModelClass = CarModelClass();
  final CustomerListClass _customerListClass = CustomerListClass();
  final ScrollController _scrollController = ScrollController();
  final List<Vehicle> _vehicles = [];
  Map<String, dynamic> _brandIdName = {};
  Map<String, dynamic> _modelIdName = {};
  Map<String, String> _customerIdName = {};

  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;

  final GlobalKey<_VehicleGridviewState> _vehicleGridViewKey =
  GlobalKey<_VehicleGridviewState>();


  @override
  void initState() {
    super.initState();
    fetchVehicles();
    _fetchAllCustomers().then((_) {
      Future.wait([
        _fetchBrands(),
        _fetchModels(),
      ]).then((_) => fetchVehicles());
    }
    );

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          _hasMore) {
        fetchVehicles();
      }
    });
  }


  // car brand
  Future<void> _fetchBrands() async {
    try {
      final List<Map<String, dynamic>> brands =
          await _carBrandsClass.carBrandsList();
      if (kDebugMode) {
        print('Fetched brands: $brands');
      }
      setState(() {
        _brandIdName = {for (var brand in brands) brand['id']: brand['name']};
        if (kDebugMode) {
          print('Brand ID-Name map: $_brandIdName');
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching brands: $error');
      }
    }
  }

  // car model
  Future<void> _fetchModels() async {
    try {
      final List<Map<String, dynamic>> models =
          await _carModelClass.carModelList();
      setState(() {
        _modelIdName = {for (var model in models) model['id']: model['name']};
        if (kDebugMode) {
          print('Model ID-Name map: $_modelIdName');
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching models: $error');
      }
    }
  }

  //customer name
  Future<void> _fetchAllCustomers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final int firmId = 3;

      int page = 1;

      while (_hasMore) {
        final List<Map<String, dynamic>> customers =
            await _customerListClass.fetchCustomerList(firmId, page: page);

        if (customers.isEmpty) {
          _hasMore = false;
        } else {
          setState(() {
            _customerIdName.addAll({
              for (var customer in customers)
                customer['id'].toString(): customer['name']
            });
            page++;
          });

          if (kDebugMode) {
            print('Loaded ${customers.length} customers on page $page');
            print('Current customer IDs: ${_customerIdName.keys}');
          }
        }
      }

      if (kDebugMode) {
        print('Total customers loaded: ${_customerIdName.length}');
        print('Sample customer data: ${_customerIdName.entries.take(5)}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching customers: $error');
      }
    }
  }

//   Future<void> fetchVehicles() async {
//     if (_isLoading) return;
//
// setState(() {
//   _isLoading=true;
// });
//     try {
//       final List<Map<String, dynamic>> response =
//           await _vehicleListService.fetchVehicleList(page: _currentPage);
//
//       if (response.isNotEmpty) {
//         // setState(() {
//         //   _isLoading = true;
//         // });
//
//         final List<Vehicle> newVehicle =
//             response.map((json) => Vehicle.fromJson(json)).toList();
//
//         for (var vehicle in newVehicle) {
//           vehicle.brandName = _brandIdName[vehicle.brand] ?? 'Unknown Brand';
//           vehicle.modelName = _modelIdName[vehicle.model] ?? 'Unknown Model';
//           vehicle.customerName =
//               _customerIdName[vehicle.customerId] ?? 'Unknown Customer';
//
//           if (vehicle.customerName == 'Unknown Customer') {
//             if (kDebugMode) {
//               print('Unknown customer for ID: ${vehicle.customerId}');
//               print('Available customer IDs: ${_customerIdName.keys}');
//               print('Vehicle data: ${vehicle.registerNumber}');
//             }
//           }
//         }
//
//         setState(() {
//           _vehicles.addAll(newVehicle);
//           _hasMore = response.isNotEmpty;
//           _currentPage++;
//         });
//       } else {
//         setState(() {
//           _hasMore = false;
//         });
//       }
//     } catch (error) {
//       if (kDebugMode) {
//         print('Error fetching vehicles: $error');
//       }
//       setState(() {
//         _hasMore = false;
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
  Future<void> fetchVehicles() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final List<Map<String, dynamic>> response =
      await _vehicleListService.fetchVehicleList(page: _currentPage);

      // if (response.isNotEmpty) {
      //   setState(() {
      //     _vehicles.addAll(response
      //         .map((json) => Vehicle.fromJson(json))
      //         .toList());
      //     _hasMore = response.isNotEmpty;
      //     _currentPage++;
      //   });
      // } else {
      //   setState(() {
      //     _hasMore = false;
      //   });
      // }
      if(response.isNotEmpty)
        {
          final List<Vehicle> newVehicle = response.map((json)=>Vehicle.fromJson(json)).toList();
          for(var vehicle in newVehicle)
            {
              vehicle.brandName = _brandIdName[vehicle.brand]?? 'Unknown Brand';
            }
          setState(() {
            _vehicles.addAll(newVehicle);
            _hasMore = response.isNotEmpty;
            _currentPage++;
          });
        }else{
        setState(() {
          _hasMore =false;
        });
      }
    }
    catch (error) {
      if (kDebugMode) {
        print('Error fetching vehicles: $error');
      }
      setState(() {
        _hasMore = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  void refreshVehicles() {
    if (mounted) {
      setState(() {
        _vehicles.clear();
        _hasMore = true;
        _currentPage = 1;
      });

      widget.onRefresh?.call();
      _fetchBrands().then((_) => fetchVehicles());
    }
  }

}
