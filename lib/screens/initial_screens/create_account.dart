import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_fin/utils/constants.dart';
import 'package:my_fin/utils/size_config.dart';

import 'create_aount_details.dart';

class Register extends StatefulWidget {

  static const String id = 'register';

  final String? countryName;

  const Register({
    Key? key,
    this.countryName
  }) : super(key: key);

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

  void _passwordFormatter() {
    print(_passwordController.text);
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_passwordFormatter);
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController;
  }

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
                  return SizedBox(
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
                                fontWeight: FontWeight.w500,
                                fontSize: 17.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 27),
                          _buildForm(),
                          Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                                child: const Text(
                                  'Uppercase letter',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                                child: const Text(
                                  'Lowercase letter',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                                child: const Text(
                                  'Number',
                                  style: TextStyle(
                                    color: Color(0xFF8791A7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1.5),
                                ),
                                child: const Text(
                                  'Special character',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: constraints.maxWidth,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScopeNode currentFocus = FocusScope.of(context);
                                if(!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                                if(_formKey.currentState!.validate()){
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 300),
                                      pageBuilder: (context, animation, secondaryAnimation) {
                                        return Details(
                                          countryName: widget.countryName,
                                          emailAddress: _eMailController.text,
                                          password: _passwordController.text,
                                        );
                                      },
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
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
                  );
                },
              ),
            ),
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
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              style: kFormTextStyle,
              decoration: kFormInputDecoration.copyWith(
                hintText: 'Enter email address',
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
                return SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    style: kFormTextStyle,
                    decoration: kFormInputDecoration.copyWith(
                      hintText: 'Enter Password',
                      contentPadding: const EdgeInsets.fromLTRB(21, 5, 21, 5),
                      suffix: Container(
                        color: const Color(0xFF1F2023).withOpacity(0.2),
                        child: IconButton(
                          padding: const EdgeInsets.all(1.0),
                          icon: Icon(_obscurePassword ? IconlyBold.show : IconlyBold.hide),
                          color: const Color(0xFF8791A7),
                          iconSize: 24,
                          splashRadius: 4.5,
                          onPressed: () {
                            _setState(() => _obscurePassword = !_obscurePassword);
                          },
                        ),
                      ),
                    ),
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    obscuringCharacter: '*',
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
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
