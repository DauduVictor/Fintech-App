import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fin/utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../dashboard.dart';

class AccountConfirmation extends StatefulWidget {

  static const String id = 'accountConfirmation';
  const AccountConfirmation({Key? key}) : super(key: key);

  @override
  _AccountConfirmationState createState() => _AccountConfirmationState();
}

class _AccountConfirmationState extends State<AccountConfirmation> {

  /// Form key and controller
  final _formKey = GlobalKey<FormState>();
  TextEditingController _pinController = TextEditingController();

  /// variable to hold pin value
  String _confirmPin = '1234';

  /// variable to hold pin value
  String _pin = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kInitialScreenBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                        'Welcome Back, Victor',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Please enter your PIN to continue.',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF8791A7),
                          fontWeight: FontWeight.w500,
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Pin field
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 15.0),
                         child: Form(
                           key: _formKey,
                           child: PinCodeTextField(
                             appContext: context,
                             length: 4,
                             keyboardType: TextInputType.none,
                             inputFormatters: [
                               FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                             ],
                             textInputAction: TextInputAction.done,
                             animationType: AnimationType.fade,
                             autoFocus: true,
                             obscureText: true,
                             enableActiveFill: true,
                             obscuringCharacter: '*',
                             enablePinAutofill: false,
                             readOnly: false,
                             textStyle: const TextStyle(
                               fontSize: 20,
                               color: Colors.white,
                               fontWeight: FontWeight.w500,
                             ),
                             controller: _pinController,
                             validator: (value) {
                               if (_pin != _confirmPin) return 'Incorrect PIN';
                               return null;
                             },
                             pinTheme: PinTheme(
                                 shape: PinCodeFieldShape.box,
                                 borderWidth: 1,
                                 fieldHeight: 60,
                                 fieldWidth: 60,
                                 activeColor: const Color(0xFF2D2D2F),
                                 inactiveColor: const Color(0xFF2D2D2F),
                                 selectedColor : const Color(0xFF2D2D2F),
                                 activeFillColor: const Color(0xFF14151A),
                                 inactiveFillColor: const Color(0xFF14151A),
                                 selectedFillColor : const Color(0xFF14151A),
                                 borderRadius: const BorderRadius.all(Radius.circular(7))
                             ),
                             onChanged: (value) {
                               if(!mounted)return;
                               setState(() => _pin = value);
                             },
                             onCompleted: (value) {
                               if(_formKey.currentState!.validate()){
                                 Navigator.pushNamed(context, Dashboard.id);
                               }

                             },
                           ),
                         ),
                       ),
                      const SizedBox(height: 15),
                      /// Forgot pin
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Forgot PIN? ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Reset PIN',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Wrap(
                      spacing: constraints.maxWidth * 0.17,
                      runSpacing: 5,
                      children: [
                        KeyPadButton(
                          title: 1,
                          onTap: () { _pinController.text = '1';},
                        ),
                        KeyPadButton(
                          title: 2,
                          onTap: () { _pinController.text = '2';},
                        ),
                        KeyPadButton(
                          title: 3,
                          onTap: () { _pinController.text = '3';},
                        ),
                        KeyPadButton(
                          title: 4,
                          onTap: () { _pinController.text = '4';},
                        ),
                        KeyPadButton(
                          title: 5,
                          onTap: () { _pinController.text = '5';},
                        ),
                        KeyPadButton(
                          title: 6,
                          onTap: () { _pinController.text = '6';},
                        ),
                        KeyPadButton(
                          title: 7,
                          onTap: () { _pinController.text = '7';},
                        ),
                        KeyPadButton(
                          title: 8,
                          onTap: () { _pinController.text = '8';},
                        ),
                        KeyPadButton(
                          title: 9,
                          onTap: () { _pinController.text = '9';},
                        ),
                        KeyPadButton(
                          widget: Icon(
                            Icons.backspace_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          onTap: () {_pinController.clear();},
                        ),
                        KeyPadButton(
                          title: 0,
                          onTap: () { _pinController.text = '0';},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class KeyPadButton extends StatelessWidget {

  final int? title;

  final Widget? widget;

  final void Function()? onTap;

  const KeyPadButton({
    Key? key,
    this.title,
    this.widget,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(25.0),
      ),
      child: widget ?? Text(
        title!.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
