import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_fin/utils/constants.dart';
import 'package:my_fin/utils/size_config.dart';

import '../dashboard.dart';

class Details extends StatefulWidget {

  static const String id = 'details';
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  /// key and controller for details [Sign_Up]
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kInitialScreenBackgroundColor,
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if(!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              height: SizeConfig.screenHeight,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: SizedBox(
                      height: constraints.maxHeight,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 43),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                padding: const EdgeInsets.all(9.0),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF27282B),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_sharp,
                                  size: 15,
                                  color: Color(0xFF8791A7),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            const Text(
                              'Tell us more about you',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                                fontSize: 23,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: Text(
                                'Please use your name as it appears in your ID.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xFF8791A7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17.5,
                                ),
                              ),
                            ),
                            const SizedBox(height: 27),
                            _buildForm(),
                            const Spacer(),
                            SizedBox(
                              width: constraints.maxWidth,
                              child: ElevatedButton(
                                onPressed: () {
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if(!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                                  if(_formKey.currentState!.validate()){
                                    Navigator.pushNamed(context, Dashboard.id);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF4D84FF),
                                  onSurface: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 18),
                                ),
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Widget to collect other user's detail[Sign up]
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///First Name
          Container(
            width: double.infinity,
            decoration: kFormContainerDecoration,
            child: TextFormField(
              style: kFormTextStyle,
              decoration: kFormInputDecoration.copyWith(
                hintText: 'First Name',
              ),
              controller: _firstNameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          /// Last Name
          Container(
            width: double.infinity,
            decoration: kFormContainerDecoration,
            child: TextFormField(
              style: kFormTextStyle,
              decoration: kFormInputDecoration.copyWith(
                hintText: 'Last Name',
              ),
              controller: _lastNameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          /// Phone number
          Container(
            width: double.infinity,
            decoration: kFormContainerDecoration,
            child: TextFormField(
              style: kFormTextStyle,
              decoration: kFormInputDecoration.copyWith(
                hintText: 'Phone Number',
              ),
              controller: _phoneNoController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          /// Date of birth
          Container(
            width: double.infinity,
            decoration: kFormContainerDecoration,
            child: TextFormField(
              style: kFormTextStyle,
              decoration: kFormInputDecoration.copyWith(
                hintText: 'Date of birth',
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: Color(0xFF8791A7),
                  size: 24,
                ),
              ),
              controller: _dobController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: () async {
                DateTime now = DateTime.now();
                DateTime? picked = await showDatePicker(
                  context: context,
                  lastDate: now,
                  firstDate: DateTime(1990),
                  initialDate: DateTime(1990),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: const ColorScheme.light().copyWith(
                          primary: kInitialScreenBackgroundColor,
                        ),
                      ),
                      child: child!,
                    );
                  }
                );
                if (picked != null && picked != now) {
                  if(!mounted) return;
                  setState(() => _dobController.text = DateFormat('d / MMM / yyyy').format(picked).toString());
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
