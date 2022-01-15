import 'package:elfatek/domain/controller/provider/auth_provider.dart';
import 'package:elfatek/domain/controller/services/api/customer_record_api.dart';
import 'package:provider/provider.dart';

import 'components/records_table.dart';
import 'package:flutter/material.dart';

class CutomerRecordScreen extends StatefulWidget {
  static const String routeName = "/cutomerRecord";

  /// Creates the home page.
  const CutomerRecordScreen({Key? key}) : super(key: key);

  @override
  _CutomerRecordScreenState createState() => _CutomerRecordScreenState();
}

class _CutomerRecordScreenState extends State<CutomerRecordScreen> {
  // final ScrollController horizontalScrollController =
  //     ScrollController(initialScrollOffset: 100);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Records'),
      ),
      body: FutureBuilder<dynamic>(
        future: CustomerRecordsAPI()
            .fetchCustomerRecordsData(userId: userProvider.id!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              print(snapshot.data);

              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return RecordsTable(
                employees: snapshot.data,
              );
              // return Center(
              //   child: ListView.builder(
              //     itemCount: snapshot.data.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Text('${snapshot.data[index].city}');
              //     },
              //   ),
              // );
            }
          }
        },
      ),
    );
  }
}
