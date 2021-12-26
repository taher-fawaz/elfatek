import 'package:elfatek/controller/api_controller.dart';
import 'package:elfatek/screens/customer_records/components/records_table.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: FutureBuilder<dynamic>(
        future: ApiController().getRequest(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // print(snapshot.data.id);

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
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
