import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JobDetailsPage(),
  ));
}

class JobDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            SizedBox(height: 20),
            _buildDetailCards(),
            SizedBox(height: 20),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Job Number: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "2434 ",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Completed", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Supervisor: ", style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Mathew", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCards() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildCustomerDetails()),
            SizedBox(width: 10),
            Expanded(child: _buildVehicleDetails()),
          ],
        ),
        SizedBox(height: 10),
        _buildServiceDetails(),
      ],
    );
  }

  Widget _buildCustomerDetails() {
    return _buildInfoCard("Customer Details", [
      _buildInfoRow("Customer", "CORE METAL EXPANSIO"),
      _buildInfoRow("Email", "coremetalico@"),
      _buildInfoRow("Phone", "XXXX-XXXX"),
      _buildInfoRow("Command", "OIL SERVICE(5000)"),
    ]);
  }

  Widget _buildVehicleDetails() {
    return _buildInfoCard("Vehicle Details", [
      _buildInfoRow("Brand", "MITSUBISHI"),
      _buildInfoRow("Model", "CANTER"),
      _buildInfoRow("Emirate", "Sharjah"),
      _buildInfoRow("Odometer", "778713 KM"),
      _buildStatusChip("Is Insured", "NO", Colors.red),
    ]);
  }

  Widget _buildServiceDetails() {
    return _buildInfoCard("Service Details", [
      _buildInfoRow("Job Card Date", "04-02-2024"),
      _buildInfoRow("Started Date", "04-02-2024"),
      _buildInfoRow("Created By", "Super Admin"),
      _buildInfoRow("Verified By", "Super Admin"),
      _buildInfoRow("Verified Date", "04-02-2024"),
      _buildStatusChip("Status", "Completed", Colors.green),
    ]);
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.black54)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, String status, Color color) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.black54)),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
            child: Text(status, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton("Print", Icons.print, Colors.black),
        _buildActionButton("Edit", Icons.edit, Colors.blue),
        _buildActionButton("View Enquiry", Icons.visibility, Colors.blue),
        _buildActionButton("View Quotation", Icons.description, Colors.blue),
        _buildActionButton("Cancel", Icons.cancel, Colors.red),
        _buildActionButton("View Jobs", Icons.work, Colors.blue),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
    );
  }
}
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: InvoiceScreen(),
//   ));
// }
//
// class InvoiceScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Overview"),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: "Technicians"),
//               Tab(text: "Invoice"),
//               Tab(text: "Gate Pass"),
//               Tab(text: "Attachments"),
//               Tab(text: "Service History"),
//               Tab(text: "Summary"),
//             ],
//             isScrollable: true,
//           ),
//         ),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SectionTitle("Services (Total 36.75 AED)"),
//               ServicesTable(),
//               AddButton("Add Service"),
//               SizedBox(height: 20),
//               SectionTitle("Products (Total 183.75 AED)"),
//               ProductsTable(),
//               AddButton("Add Product"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SectionTitle extends StatelessWidget {
//   final String title;
//   SectionTitle(this.title);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     );
//   }
// }
//
// class ServicesTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: DataTable(
//         columns: [
//           DataColumn(label: Text("Service")),
//           DataColumn(label: Text("Qty")),
//           DataColumn(label: Text("Price")),
//           DataColumn(label: Text("Tax%")),
//           DataColumn(label: Text("Total")),
//           DataColumn(label: Text("Time Taken")),
//           DataColumn(label: Text("Status")),
//         ],
//         rows: [
//           DataRow(cells: [
//             DataCell(Text("Labour Charge")),
//             DataCell(Text("1")),
//             DataCell(Text("35.00 AED")),
//             DataCell(Text("5%")),
//             DataCell(Text("36.75 AED")),
//             DataCell(Text("0 min")),
//             DataCell(Chip(label: Text("Completed"), backgroundColor: Colors.green[100]!)),
//           ]),
//         ],
//       ),
//     );
//   }
// }
//
// class ProductsTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: DataTable(
//         columns: [
//           DataColumn(label: Text("Part Number")),
//           DataColumn(label: Text("Name")),
//           DataColumn(label: Text("Qty")),
//           DataColumn(label: Text("Price")),
//           DataColumn(label: Text("Total")),
//         ],
//         rows: [
//           DataRow(cells: [
//             DataCell(Text("15W40 CI4")),
//             DataCell(Text("Engine Oil Diesel")),
//             DataCell(Text("9")),
//             DataCell(Text("10.00 AED")),
//             DataCell(Text("94.50 AED")),
//           ]),
//         ],
//       ),
//     );
//   }
// }
//
// class AddButton extends StatelessWidget {
//   final String text;
//   AddButton(this.text);
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: ElevatedButton(
//         onPressed: () {},
//         child: Text(text),
//       ),
//     );
//   }
// }
