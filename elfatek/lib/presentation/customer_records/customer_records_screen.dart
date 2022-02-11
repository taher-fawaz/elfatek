import 'package:elfatek/app/api/customer_record_api.dart';
import 'package:elfatek/features/auth/providers/user_provider.dart';
import '../common/components/edit_records_list.dart';
import 'components/page/editable_page.dart';
import '../resources/color_manager.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class CutomerRecordScreen extends StatefulWidget {
  static const String routeName = "/cutomerRecord";

  /// Creates the home page.
  const CutomerRecordScreen({Key? key}) : super(key: key);

  @override
  _CutomerRecordScreenState createState() => _CutomerRecordScreenState();
}

class _CutomerRecordScreenState extends State<CutomerRecordScreen> {
  bool isEditMode = false;
  bool isDeleteMode = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Records'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                setState(() {
                  isDeleteMode = !isDeleteMode;
                  print(isDeleteMode);
                });
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text(
                        isDeleteMode ? 'Delete Mode On' : 'Delete Mode Off'),
                    backgroundColor: ColorManager.primary,
                  ));
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                setState(() {
                  isEditMode = !isEditMode;
                });

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content:
                        Text(isEditMode ? 'Edit Mode On' : 'Edit Mode Off'),
                    backgroundColor: ColorManager.primary,
                  ));
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshData(),
        child: FutureBuilder<dynamic>(
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
                return isDeleteMode
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int i) {
                          return EditRecordItem(
                            id: snapshot.data[i].id,
                            customerName: snapshot.data[i].customerName,
                            customerSatisfied:
                                snapshot.data[i].customerSatisfied,
                            customerTitle: snapshot.data[i].customerTitle,
                            productQuantity: snapshot.data[i].productQuantity,
                          );
                        },
                      )
                    : EditablePage(
                        customerRegistrationList: snapshot.data,
                        isEditMode: isEditMode);
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {});
  }
}
