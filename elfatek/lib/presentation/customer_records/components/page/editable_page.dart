import 'package:card_settings/models/picker_model.dart';
import '../../../../domain/controller/provider/auth_provider.dart';
import '../../../../domain/controller/provider/customer_revord_provider.dart';
import '../../../../domain/controller/services/api/customer_record_api.dart';
import '../../../../domain/model/customer_registration.dart';
import '../utils.dart';
import '../widget/scrollable_widget.dart';
import '../widget/text_dialog_widget.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../resources/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

class EditablePage extends StatefulWidget {
  final List<CustomerRegistration>? customerRegistrationList;
  bool? isEditMode;
  EditablePage({Key? key, this.customerRegistrationList, this.isEditMode})
      : super(key: key);
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  bool showEditIcon = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    List<String> columns = [
      'ID',
      LocaleKeys.customer_title.tr(),
      LocaleKeys.customer_name.tr(),
      LocaleKeys.customer_representative.tr(),
      LocaleKeys.address.tr(),
      LocaleKeys.current_main_group.tr(),
      LocaleKeys.current_second_group.tr(),
      LocaleKeys.city.tr(),
      LocaleKeys.district.tr(),
      LocaleKeys.country.tr(),
      LocaleKeys.business_phone_1.tr(),
      LocaleKeys.business_phone_2.tr(),
      LocaleKeys.fax_number.tr(),
      LocaleKeys.gsm_number.tr(),
      LocaleKeys.tax_number.tr(),
      LocaleKeys.tax_administration.tr(),
      LocaleKeys.email_1.tr(),
      LocaleKeys.email_2.tr(),
      LocaleKeys.website_address.tr(),
      LocaleKeys.is_it_active.tr(),
      LocaleKeys.customer_status.tr(),
      LocaleKeys.customer_representative.tr(),
      LocaleKeys.possibility.tr(),
      LocaleKeys.dealer_probability.tr(),
      LocaleKeys.do_not_get_registered.tr(),
      LocaleKeys.current_product_brand.tr(),
      LocaleKeys.current_product_quantity.tr(),
      LocaleKeys.show_reference.tr(),
      LocaleKeys.customer_satisfied.tr(),
      LocaleKeys.If_not_reason.tr(),
      'asas',
    ];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(widget.customerRegistrationList!),
      dataTextStyle: Theme.of(context).textTheme.headline1,
      dividerThickness: 2,
      showBottomBorder: true,
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[0];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<CustomerRegistration> users) =>
      users.map((CustomerRegistration customerRegistration) {
        final cells = [
          customerRegistration.id,
          customerRegistration.customerName,
          customerRegistration.customerTitle,
          customerRegistration.customerAuthorizedName,
          customerRegistration.adress,
          customerRegistration.currentMainGroup,
          customerRegistration.currentSecondGroup,
          customerRegistration.city,
          customerRegistration.district,
          customerRegistration.country,
          customerRegistration.businessPhone1,
          customerRegistration.businessPhone2,
          customerRegistration.faxNumber,
          customerRegistration.gsmNumber,
          customerRegistration.taxAdministration,
          customerRegistration.taxNumber,
          customerRegistration.email1,
          customerRegistration.email2,
          customerRegistration.websiteAddress,
          customerRegistration.isActive,
          customerRegistration.customerStatus,
          // customerRegistration.customerRepresentative,
          customerRegistration.franchisePossibility,
          customerRegistration.dealerProbability,
          customerRegistration.registrationDate,
          customerRegistration.availableProductBrand,
          customerRegistration.productQuantity,
          customerRegistration.showReference,
          customerRegistration.customerSatisfied,
          customerRegistration.explanation,
          // customerRegistration.userId,
          customerRegistration.createdAt,
          customerRegistration.updatedAt,
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(
              Text('$cell'),
              showEditIcon:
                  //false,
                  index == 0 || index == 29 || index == 30
                      ? false
                      : widget.isEditMode!,
              onTap: () {
                if (widget.isEditMode! &&
                    (index != 0 && index != 29 && index != 30)) {
                  // print('here ${cell.runtimeType}');
                  print('hello ${cells[index]!}');
                  print('hello ${cells.runtimeType}');
                  editStringValue(cell, index, cells, context);
                }
              },
            );
          }),
        );
      }).toList();

  Future editStringValue(
      editCustomerRegistration, int index, cells, BuildContext context) async {
    final userProvider = Provider.of<AuthProvider>(context, listen: false).user;

    TextEditingController? controller = TextEditingController(
      text: editCustomerRegistration,
    );
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.black,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Edit Table',
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        onFieldSubmitted: (value) async {
                          await CutomerRecords()
                              .updateRecord(
                                  cells,
                                  index,
                                  value,
                                  userProvider.id,
                                  widget.customerRegistrationList!)
                              .then((value) => ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Record has been updated'),
                                  backgroundColor: ColorManager.primary,
                                )));
                        },
                        decoration: const InputDecoration(hintText: 'adddrss'),
                        autofocus: true,
                        controller: controller,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ));
    // final firstName = showAboutDialog(
    //     context: context,
    //     children: [
    //       TextFormField(
    //         controller: controller,
    //       )
    //     ],
    //     applicationIcon: Icon(Icons.ac_unit));
    // showTextDialog(
    //   context,
    //   title: 'Change First Name',
    //   value: editCustomerRegistration.toString(),
    // );
    // if (_formKey.currentState!.validate()) {
    print('here ${controller.text}');
    // }

    // CustomerRecordsAPI().updateCustomerRecord(
    //     data: editCustomerRegistration, id: editCustomerRegistration.id);
    // print(getRows(widget.customerRegistrationList!)[0].cells[index].child);
    // setState(() => users = users.map((user) {
    //       final isEditedUser = user == editUser;

    //       return isEditedUser ? user.copy(firstName: firstName) : user;
    //     }).toList());
  }
}
