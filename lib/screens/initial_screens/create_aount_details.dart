import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_fin/components/circle_indicator.dart';
import 'package:my_fin/utils/constants.dart';
import 'package:my_fin/utils/size_config.dart';

import '../dashboard.dart';

class Details extends StatefulWidget {

  static const String id = 'details';

  final String? countryName;
  final String? emailAddress;
  final String? password;

  const Details({
    Key? key,
    this.countryName,
    this.emailAddress,
    this.password,
  }) : super(key: key);

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

  /// Variable to hold the bool value of the [CircleIndicator()]
  bool _showSpinner = false;

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
          child: AbsorbPointer(
            absorbing: _showSpinner,
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
                                    if(_showSpinner != true){
                                      if (_formKey.currentState!.validate()) {
                                        _signUp();
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF4D84FF),
                                    onSurface: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 18),
                                  ),
                                  child: _showSpinner == false ?
                                    const Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ) : const SizedBox(
                                    height: 35.0,
                                    child: CircleProgressIndicator(),
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
          SizedBox(
            width: double.infinity,
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
          SizedBox(
            width: double.infinity,
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
          SizedBox(
            width: double.infinity,
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
          SizedBox(
            width: double.infinity,
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

  /// Function to call api [Sign Up]
  void _signUp() {
    if(!mounted) return;
    setState(() => _showSpinner = true);
    print(widget.countryName);
    print(widget.emailAddress);
    print(widget.password);
    print(_firstNameController.text);
    print(_lastNameController.text);
    print(_phoneNoController.text);
    print(_dobController.text);
    Timer(const Duration(seconds: 2), (){
      setState(() => _showSpinner = false);
      Navigator.pushNamed(context, Dashboard.id);
    });
  }
}
