import 'package:flutter/material.dart';
import 'package:my_fin/utils/constants.dart';

class AccountConfirmation extends StatefulWidget {

  static const String id = 'accountConfirmation';
  const AccountConfirmation({Key? key}) : super(key: key);

  @override
  _AccountConfirmationState createState() => _AccountConfirmationState();
}

class _AccountConfirmationState extends State<AccountConfirmation> {
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
                       Container(height: 90, width: 400, color: Colors.white),
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
                      children: const [
                        KeyPadButton(title: 1),
                        KeyPadButton(title: 2),
                        KeyPadButton(title: 3),
                        KeyPadButton(title: 4),
                        KeyPadButton(title: 5),
                        KeyPadButton(title: 6),
                        KeyPadButton(title: 7),
                        KeyPadButton(title: 8),
                        KeyPadButton(title: 9),
                        KeyPadButton(title: 00),
                        KeyPadButton(title: 0),
                        KeyPadButton(title: 00),
                      ],
                    ),
                  ),
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
  final Widget? child;

  const KeyPadButton({
    Key? key,
    this.title,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {  },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(25.0),
      ),
      child: Text(
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
