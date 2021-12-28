import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_fin/components/circle_indicator.dart';
import 'package:my_fin/utils/constants.dart';
import 'package:my_fin/utils/size_config.dart';
import '../dashboard.dart';

class Login extends StatefulWidget {

  static const String id = 'login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  /// key and controller for [Sign_Up]
  final _formKey = GlobalKey<FormState>();
  TextEditingController _eMailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  /// Variable to hold the bool value of the [CircleIndicator()]
  bool _showSpinner = false;

  /// Variable to hold the bool value of [Password] obscure text in the form field
  bool _obscurePassword = true;

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
                              'Welcome Back',
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
                                'Please log in to your account',
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
                            Center(
                              child: OutlinedButton(
                                onPressed: () {  },
                                child: const Text(
                                  'I forgot my password',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,

                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: constraints.maxWidth,
                              child: ElevatedButton(
                                onPressed: () {
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if(!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                                  if(_showSpinner != false){
                                    if(_formKey.currentState!.validate()) {
                                      _signIn();
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
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ) : const CircleProgressIndicator(),
                              ),
                            ),
                            const SizedBox(height: 21),
                            SizedBox(
                              width: constraints.maxWidth,
                              child: OutlinedButton(
                                onPressed: () {
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if(!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 18),
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
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
      ),
    );
  }

  /// Widget to build user[Login]
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
                return Container(
                  width: double.infinity,
                  decoration: kFormContainerDecoration,
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
                      if (value!.isEmpty) return 'This field is required';
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

  /// Function to call api [Sign In]
  void _signIn() {
    if(!mounted) return;
    setState(() => _showSpinner = true);
    Timer(const Duration(seconds: 3), (){
      setState(() => _showSpinner = false);
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration:
          const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Dashboard();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }
}


