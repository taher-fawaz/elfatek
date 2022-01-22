import '../../../domain/controller/services/api/customer_record_api.dart';
import '../../../domain/model/customer_registration.dart';
import '../../resources/size_config.dart';
import 'package:flutter/material.dart';

class EditRecordItem extends StatelessWidget {
  final int? id;
  final int? productQuantity;
  final String? customerName;
  final String? customerTitle;
  final int? customerSatisfied;
  const EditRecordItem({
    Key? key,
    this.id,
    this.productQuantity,
    this.customerName,
    this.customerTitle,
    this.customerSatisfied,
  }) : super(key: key);
  static final CustomerRecordsAPI customerRecordsAPI = CustomerRecordsAPI();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('$productQuantity'),
                ),
              ),
            ),
            title: Text(customerName!),
            subtitle: Text(customerTitle!),
            trailing: Text(customerSatisfied == 0
                ? 'Customer is Satisfied: No'
                : 'Customer is Satisfied: Yes'),
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                direction == DismissDirection.endToStart
                    ? "Delete Confirmation"
                    : "Edit Confirmation",
                style: Theme.of(context).textTheme.headline3,
              ),
              content: Text(direction == DismissDirection.endToStart
                  ? "Are you sure you want to delete this item?"
                  : "Are you sure you want to edit this item?"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      if (direction == DismissDirection.endToStart)
                        customerRecordsAPI.deleteCustomerRecord(id: id!);

                      Navigator.of(context).pop(true);
                    },
                    child: Text(direction == DismissDirection.endToStart
                        ? "Delete"
                        : "Edit")),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.delete, color: Colors.white),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text('Delete record',
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),

      // Container(
      //   color: Colors.blue,
      //   child: Padding(
      //     padding: const EdgeInsets.all(15),
      //     child: Row(
      //       children: [
      //         const Icon(Icons.mode_edit_outline, color: Colors.white),
      //         SizedBox(
      //           width: getProportionateScreenWidth(10),
      //         ),
      //         Text('Edit record', style: Theme.of(context).textTheme.headline2),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
