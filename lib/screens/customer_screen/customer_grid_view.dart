import 'package:auto_connect/screens/common_custom_widgets/colors.dart';
import 'package:flutter/material.dart';
import '../../api_service_classes/customer_list_api.dart';
import '../../api_service_classes/customer_list_fetching.dart';

class CustomerGridView extends StatefulWidget {
  const CustomerGridView({super.key});

  @override
  State<CustomerGridView> createState() => _CustomerGridViewState();
}

class _CustomerGridViewState extends State<CustomerGridView> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        key: _customerGridViewKey,
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          // mainAxisSpacing: 10,
          childAspectRatio: 1.8,
        ),
        itemCount: _customers.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _customers.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final customer = _customers[index];
          return
            Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              color: CustomColors.whiteColor,
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Name :  ${customer.name}',
                      style: const TextStyle(
                          fontSize: 13, fontFamily: 'PoppinsMedium'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Customer Type :  ${customer.outsideOrGp}',
                      style: const TextStyle(
                          fontSize: 13, fontFamily: 'PoppinsMedium'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email :  ${customer.email}',
                      style: const TextStyle(
                          fontSize: 12, fontFamily: 'PoppinsMedium'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Phone :  ${customer.phone}',
                      style: const TextStyle(
                          fontSize: 12, fontFamily: 'PoppinsMedium'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: customer.status == 0 // Compare with int now
                              ? CustomColors.greenColor
                              : CustomColors.redColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          customer.statusText, // Use the helper method
                          style: TextStyle(
                            color: CustomColors.whiteColor,
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  final ScrollController _scrollController = ScrollController();
  final CustomerListClass _customerListService = CustomerListClass();
  final List<Customer> _customers = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  final GlobalKey<_CustomerGridViewState> _customerGridViewKey =
  GlobalKey<_CustomerGridViewState>();

  @override
  void initState() {
    super.initState();
    fetchCustomers();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          _hasMore) {
        fetchCustomers();
      }
    });
  }

  fetchCustomers() async {
    if (_isLoading || !_hasMore) return;

    setState(() => _isLoading = true);

    try {
      final List<Map<String, dynamic>> response =
      await _customerListService.fetchCustomerList(3, page: _currentPage);
      // final List<Map<String, dynamic>> response =
      // await _customerListService.fetchCustomerList(3, page: _currentPage);
      print('Raw API Response: $response'); // Debug print

      if (response.isNotEmpty) {
        final List<Customer> newCustomers = response
            .map((json) => Customer.fromJson(json))
            .toList();

        setState(() {
          _customers.addAll(newCustomers);
          _hasMore = response.length >= 20; // Assuming 20 items per page
          _currentPage++;
        });
      } else {
        setState(() => _hasMore = false);
      }
    } catch (e) {
      print('Error fetching customers: $e');
      // Optionally show error to user
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
