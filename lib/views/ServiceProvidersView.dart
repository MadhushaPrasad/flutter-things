import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/UserServices.dart';

class ServiceProvidersViewApp extends StatelessWidget {
  const ServiceProvidersViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Service Provider List';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00CCFF),
                  Color(0xFF3366FF),
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
          ),
        ),
        body: const ServiceProviderTable(),
      ),
    );
  }
}

class ServiceProviderTable extends StatefulWidget {
  const ServiceProviderTable({super.key});

  @override
  State<ServiceProviderTable> createState() => _ServiceProviderTableState();
}

class _ServiceProviderTableState extends State<ServiceProviderTable> {
  late DataTableSource _data;

  @override
  void initState() {
    super.initState();
    _data = ServiceProviderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('sp_id')),
              DataColumn(label: Text('phone_number')),
              DataColumn(label: Text('first_name')),
              DataColumn(label: Text('last_name')),
              DataColumn(label: Text('gender')),
              DataColumn(label: Text('rating')),
              DataColumn(label: Text('status')),
            ],
            source: _data,
          )
        ],
      ),
    );
  }
}

class ServiceProviderData extends DataTableSource {
  List<dynamic> responsedData = [];
  List<Map<String, dynamic>> serviceProviders = [];

  ServiceProviderData() {
    getAllServiceProviderDetails();
  }

  getAllServiceProviderDetails() {
    UserServices userServices = UserServices();
    userServices
        .getAllServiceProviders("service_provider",
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6Ijg0NjJlM2I2LTMwN2ItNGRhYS1hZWM0LTgxZGQ2ZmQ1ZmQxMSIsImF1dGhvcml6ZWQiOnRydWUsImV4cCI6MTY4NzM1MDEwNCwidXNlcl9ncm91cCI6InN1cGVyX2FkbWluIiwidXNlcl9pZCI6IjYxZWUyZDM2LTYxZjEtNDI5OC1hY2FhLTJhNzE0ZjJiNjM2YSJ9.vtRi_m1Iz0neLtLeUlJ8qfkmvyS9QK5ixoK9tS_KeRQ")
        .then((Response response) {
      // print(json.decode(response.body));

      responsedData = json.decode(response.body);
      for (var item in responsedData) {
        serviceProviders.add(item);
      }
    });
  }

  @override
  DataRow? getRow(int index) {
    // print(serviceProviders);
    print(serviceProviders[0]['phone_number']);
    return null;
    // return DataRow(cells: [
    //   DataCell(Text(serviceProviders[0]['sp_id'].toString())),
    // ]);
    // return DataRow(cells: [
    //   DataCell(Text(serviceProviders[0]['sp_id'].toString())),
    //   DataCell(Text(serviceProviders[0]['phone_number'].toString())),
    //   DataCell(Text(serviceProviders[0]['first_name'].toString())),
    //   DataCell(Text(serviceProviders[0]['last_name'].toString())),
    //   DataCell(Text(serviceProviders[0]['gender'].toString())),
    //   DataCell(Text(serviceProviders[0]['rating'].toString())),
    //   DataCell(Text(serviceProviders[0]['status'].toString())),
    // ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => serviceProviders.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
