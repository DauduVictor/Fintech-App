import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_fin/utils/constants.dart';

import 'details.dart';

class Register extends StatefulWidget {

  static const String id = 'register';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  /// key and controller for [Sign_Up]
  final _formKey = GlobalKey<FormState>();
  TextEditingController _eMailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  /// Variable to hold the bool value of [Password] obscure text in the form field
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
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
                          'Enter your email and password',
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
                            'Safe & Secure. We will never share your data',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
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
                                Navigator.pushNamed(context, Details.id);
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
    );
  }

  /// Widget to build user [Sign up]
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Email
          Container(
            width: double.infinity,
            decoration: kFormContainerDecoration,
            child: TextFormField(
              style: kFormTextStyle,
              decoration: kFormInputDecoration.copyWith(
                  labelText: 'Enter email address'
              ),
              controller: _eMailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                if (value.length < 3 && !value.contains('@') && !value.contains('.')) {
                  return 'Invalid email address';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          ///Password
          StatefulBuilder(
              builder: (context, _setState) {
                return Container(
                  height: 74,
                  width: double.infinity,
                  decoration: kFormContainerDecoration,
                  child: TextFormField(
                    style: kFormTextStyle,
                    decoration: kFormInputDecoration.copyWith(
                      labelText: 'Enter Password',
                      contentPadding: const EdgeInsets.fromLTRB(21, 8, 15, 17),
                      suffix: IconButton(
                        icon: Icon(_obscurePassword ? IconlyBold.show : IconlyBold.hide),
                        color: const Color(0xFF8791A7),
                        iconSize: 27,
                        splashRadius: 4.5,
                        onPressed: () {
                          _setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                    ),
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) return '';
                      return null;
                    },
                  ),
                );
              }
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
