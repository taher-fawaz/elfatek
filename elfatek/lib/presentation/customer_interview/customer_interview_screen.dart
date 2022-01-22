import 'package:card_settings/card_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/controller/provider/auth_provider.dart';
import '../../domain/controller/services/api/customer_record_api.dart';
import '../../domain/model/customer_interview.dart';
import 'package:provider/provider.dart';
import '../base/model.dart';
import '../common/card_textfield.dart';
import 'components/interview_details.dart';
import 'components/interview_status.dart';
import '../resources/color_manager.dart';
import '../resources/translations/locale_keys.g.dart';

import 'components/body.dart';
import 'package:flutter/material.dart';

class CustomerInterviewScreen extends StatefulWidget {
  static String routeName = "/customer_interview";

  const CustomerInterviewScreen({Key? key}) : super(key: key);

  @override
  State<CustomerInterviewScreen> createState() =>
      _CustomerInterviewScreenState();
}

class _CustomerInterviewScreenState extends State<CustomerInterviewScreen>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _isOfferMadeKey = GlobalKey<FormState>();

  final GlobalKey<FormState> customerNameKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _customerRepresentativeKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _nextInterviewKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _explanationKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _datetimeKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _customerTitleKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _discussionSubjectKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _interviewContentKey = GlobalKey<FormState>();

  final GlobalKey<FormState> interviewStatusKey = GlobalKey<FormState>();

  final FocusNode _addressNode = FocusNode();

  final FocusNode _taxNumberNode = FocusNode();

  final PonyModel _ponyModel = PonyModel();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController explanationController = TextEditingController();

  final TextEditingController customerTitleController = TextEditingController();
  final TextEditingController customerRepresentativeController =
      TextEditingController();
  final TextEditingController discussionSubjectController =
      TextEditingController();
  final TextEditingController interviewContentController =
      TextEditingController();

  final TextEditingController adressController = TextEditingController();
  final DateTime nextInterviewDate = DateTime.now();
  final DateTime interviewDate = DateTime.now();
  TimeOfDay datetime = TimeOfDay(hour: 0, minute: 0);

  int pageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context).user;

    TabController controller =
        TabController(length: 2, vsync: this, initialIndex: pageIndex);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       _formKey.currentState!.save();
          //     },
          //     icon: Icon(Icons.ac_unit)),
          elevation: 0,
          bottom: TabBar(
            enableFeedback: true,
            labelColor: Colors.white,
            indicatorColor: ColorManager.primary,
            labelStyle: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
            onTap: (value) {
              setState(() {
                pageIndex = value;
              });
              print(value);
            },
            controller: controller,
            tabs: const [
              // Icon(Icons.ac_unit_outlined),
              Tab(
                text: "Details",
              ),
              Tab(
                text: 'Status',
              ),
            ],
          ),
          // title: Text('Tabs Demo'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Visibility(
                visible: pageIndex == 0 ? true : false,
                child: Expanded(
                    child: InterviewDetailsSection(
                  customerNameController: customerNameController,
                  customerTitleController: customerTitleController,
                  customerNameKey: customerNameKey,
                  customerTitleKey: _customerTitleKey,
                  dateKey: _dateKey,
                  datetimeKey: _datetimeKey,
                  nextInterviewKey: _nextInterviewKey,
                  datetime: datetime,
                  interviewDate: interviewDate,
                  nextInterviewDate: nextInterviewDate,
                  // taxNumberNode: _taxNumberNode,
                ))),
            Visibility(
                visible: pageIndex == 1 ? true : false,
                child: Expanded(
                    child: InterviewStatusSection(
                  explanationKey: _explanationKey,
                  addressNode: _addressNode,
                  customerRepresentativeKey: _customerRepresentativeKey,
                  discussionSubjectKey: _discussionSubjectKey,
                  interviewContentKey: _interviewContentKey,
                  isOfferMadeKey: _isOfferMadeKey,
                  interviewStatusKey: interviewStatusKey,
                  explanationController: explanationController,
                  customerRepresentativeController:
                      customerRepresentativeController,
                  discussionSubjectController: discussionSubjectController,
                  interviewContentController: interviewContentController,
                  onPressed: () async {
                    // _formKey.currentState!.save();
                    // print(cusTitleController.text);
                    // print(_currentProductBrandController.text);

                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   print('object2 ${_formKey.currentState!}');
                    // }
                    await CustomerRecordsAPI()
                        .createCustomerInterview(CustomerInterview(
                      customerRepresentative:
                          customerRepresentativeController.text,
                      customerName: customerNameController.text,
                      customerTitle: customerTitleController.text,
                      discussionSubject: discussionSubjectController.text,
                      explanation: explanationController.text,
                      interviewContent: interviewContentController.text,
                      interviewStatus: const PickerModel('name').name,
                      isOffered: 1,
                      meetingHour: '${datetime.hour}:${datetime.minute}',
                      userId: userProvider.id,
                      interviewDate: DateTime.now(),
                      interviewNextDate: DateTime.now(),
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                    ))
                        .then((value) {
                      // customerRepresentativeController.clear();
                      // customerNameController.clear();
                      // customerTitleController.clear();
                      // discussionSubjectController.clear();
                      // explanationController.clear();
                      // interviewContentController.clear();
                    });
                  },
                  // taxNumberNode: _taxNumberNode,
                ))),
          ],
        ),
      ),
    );
  }
}
