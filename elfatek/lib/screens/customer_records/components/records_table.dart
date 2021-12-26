import 'package:elfatek/database/services/posts_services.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:elfatek/translations/locale_keys.g.dart';

class RecordsTable extends StatefulWidget {
  final List? employees;
  const RecordsTable({Key? key, this.employees}) : super(key: key);

  @override
  _RecordsTableState createState() => _RecordsTableState();
}

class _RecordsTableState extends State<RecordsTable> {
  late CustomerRegistrationDataSource _customerRegistrationDataSource;
  @override
  void initState() {
    super.initState();
    _customerRegistrationDataSource = CustomerRegistrationDataSource(
        customerRegistrationData: widget.employees!);
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      // isScrollbarAlwaysShown: true,
      // horizontalScrollController: horizontalScrollController,
      // shrinkWrapColumns: true,
      // shrinkWrapRows: true,
      // horizontalScrollPhysics: ScrollPhysics(),
      // defaultColumnWidth: 150,
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
      // controller: _controller,
      //columnResizeMode: ColumnResizeMode.onResize,
      source: _customerRegistrationDataSource,
      // columnWidthMode: ColumnWidthMode.fill,
      columns: columnTitles
          .map(
            (e) => GridColumn(
              columnName: e,
              columnWidthMode: ColumnWidthMode.fitByColumnName,
              label: Align(
                alignment: Alignment.center,
                child: Text(e),
              ),
            ),
          )
          .toList(),
    );
  }

  List columnTitles = [
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
  ];
  List list3 = [
    ['ID', 'ID'],
    [LocaleKeys.customer_title.tr(), 'b'],
    [LocaleKeys.customer_name.tr(), 'a'],
    [LocaleKeys.customer_representative.tr(), 'b'],
    [LocaleKeys.address.tr(), 'c'],
    [LocaleKeys.current_main_group.tr(), 'c'],
    [LocaleKeys.current_second_group.tr(), 'e'],
    [LocaleKeys.city.tr(), 'b'],
    [LocaleKeys.district.tr(), 'a'],
    [LocaleKeys.country.tr(), 'b'],
    [LocaleKeys.business_phone_1.tr(), 'c'],
    [LocaleKeys.business_phone_2.tr(), 'c'],
    [LocaleKeys.fax_number.tr(), 'e'],
    [LocaleKeys.gsm_number.tr(), 'b'],
    [LocaleKeys.tax_number.tr(), 'a'],
    [LocaleKeys.tax_administration.tr(), 'b'],
    [LocaleKeys.email_1.tr(), 'c'],
    [LocaleKeys.email_2.tr(), 'c'],
    [LocaleKeys.website_address.tr(), 'e'],
    [LocaleKeys.is_it_active.tr(), 'b'],
    [LocaleKeys.customer_status.tr(), 'a'],
    [LocaleKeys.customer_representative.tr(), 'b'],
    [LocaleKeys.possibility.tr(), 'c'],
    [LocaleKeys.dealer_probability.tr(), 'c'],
    [LocaleKeys.do_not_get_registered.tr(), 'e'],
    [LocaleKeys.current_product_brand.tr(), 'b'],
    [LocaleKeys.current_product_quantity.tr(), 'a'],
    [LocaleKeys.show_reference.tr(), 'b'],
    [LocaleKeys.customer_satisfied.tr(), 'c'],
    [LocaleKeys.If_not_reason.tr(), 'c'],
  ];
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class CustomerRegistrationDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  CustomerRegistrationDataSource({required List customerRegistrationData}) {
    _customerRegistrationData = customerRegistrationData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.customerName),
              DataGridCell<String>(
                  columnName: 'designation', value: e.customerTitle),
              DataGridCell<String>(
                  columnName: 'salary', value: e.customerAuthorizedName),
              DataGridCell<String>(columnName: 'id2', value: e.adress),
              DataGridCell<String>(
                  columnName: 'name2', value: e.currentMainGroup),
              DataGridCell<String>(
                  columnName: 'designation2', value: e.currentSecondGroup),
              DataGridCell<String>(columnName: 'salary2', value: e.city),
              DataGridCell<String>(columnName: 'id3', value: e.district),
              DataGridCell<String>(columnName: 'name3', value: e.country),
              DataGridCell<int>(columnName: 'id4', value: e.businessPhone1),
              DataGridCell<int>(columnName: 'salary3', value: e.businessPhone2),
              DataGridCell<int>(columnName: 'designation3', value: e.faxNumber),
              DataGridCell<int>(columnName: 'name4', value: e.gsmNumber),
              DataGridCell<int>(columnName: 'designation4', value: e.taxNumber),
              DataGridCell<String>(
                  columnName: 'salary4', value: e.taxAdministration),
              DataGridCell<String>(columnName: 'id5', value: e.email1),
              DataGridCell<String>(columnName: 'name5', value: e.email2),
              DataGridCell<String>(
                  columnName: 'designation5', value: e.websiteAddress),
              DataGridCell<String>(
                  columnName: 'salary5', value: e.isActive == 0 ? 'No' : 'Yes'),
              DataGridCell<String>(columnName: 'id3', value: e.customerStatus),
              DataGridCell<String>(
                  columnName: 'name3', value: e.customerRepresentative),
              DataGridCell<int>(
                  columnName: 'id4', value: e.franchisePossibility),
              DataGridCell<int>(
                  columnName: 'salary3', value: e.dealerProbability),
              DataGridCell<String>(
                  columnName: 'designation3',
                  value: e.registrationDate.toString()),
              DataGridCell<String>(
                  columnName: 'name4', value: e.availableProductBrand),
              DataGridCell<int>(
                  columnName: 'designation4', value: e.productQuantity),
              DataGridCell<String>(
                  columnName: 'salary4',
                  value: e.showReference == 0 ? 'No' : 'Yes'),
              DataGridCell<String>(
                  columnName: 'id5',
                  value: e.customerSatisfied == 0 ? 'No' : 'Yes'),
              DataGridCell<String>(columnName: 'name5', value: e.explanation),
            ]))
        .toList();
  }

  List<DataGridRow> _customerRegistrationData = [];

  @override
  List<DataGridRow> get rows => _customerRegistrationData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        // color: Colors.redAccent,
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
