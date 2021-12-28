import 'package:flutter/material.dart';
import 'package:my_fin/components/next_button.dart';
import 'package:my_fin/components/skip_button.dart';
import 'package:my_fin/screens/initial_screens/create_account.dart';
import 'package:my_fin/utils/constants.dart';

import 'login.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = "welcomePageOne";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  /// A variable to hold the total number of pages that will be slided to and from
  final int _numPages = 4;

  /// Controller to help in the page built
  final PageController _pageController = PageController(initialPage: 0);

  /// A variable to hold the index of the current page with a default of 0
  int _currentPage = 0;

  /// List of the indicator Widget that gets built
  List<Widget> _buildPageIndicator () {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++){
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  /// Widget to identify the current page if true with help of [AnimatedContainer]
  Widget _indicator(bool _isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 900),
      curve: Curves.decelerate,
      margin: const EdgeInsets.only(bottom: 3.0),
      height: 7,
      width: _isActive ? 7.0 : 7.0,
      decoration: BoxDecoration(
        color: _isActive ? const Color(0xFF27AE60) : const Color(0xFF153CA8).withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                padEnds: false,
                scrollDirection: Axis.vertical,
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/tabbacimg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 60, 18, 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Skip button
                          SkipButton(pageController: _pageController),
                          /// image, heading, sub heading
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.7,
                                height: constraints.maxHeight * 0.22,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/inittabimg1.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'We level the field by giving you access to tokenized commodity',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(
                                  'What this means is that you can buy stocks in your favorite companies easily',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          /// Page indicator, next button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: _buildPageIndicator(),
                              ),
                              NextButton(pageController: _pageController),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/tabbacimg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 60, 18, 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Skip button
                          SkipButton(pageController: _pageController),
                          /// image, heading, sub heading
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.7,
                                height: constraints.maxHeight * 0.22,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/inittabimg2.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'You’re taking a hunch to trust us, so we promise to protect your account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(
                                  'Your capital is as secured as a bank vault, even better, you only have access to it',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          /// Page indicator, next button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: _buildPageIndicator(),
                              ),
                              NextButton(pageController: _pageController),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/tabbacimg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 60, 18, 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Skip button
                          SkipButton(pageController: _pageController),
                          /// image, heading, sub heading
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.7,
                                height: constraints.maxHeight * 0.22,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/inittabimg3.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Liquidate instantly or keep building your portfolio is totally up to you',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(
                                  'A secure and easy medium through which you can trade your tokens',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          /// Page indicator, next button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: _buildPageIndicator(),
                              ),
                              NextButton(pageController: _pageController),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/tabbacimg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 60, 18, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// to hold the space of the skip botton in order to take ad of spacebetween
                          const SizedBox(height: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: constraints.maxWidth * 0.7,
                                height: constraints.maxHeight * 0.22,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/inittabimg4.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Liquidate instantly or keep building your portfolio is totally up to you',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text(
                                  'A secure and easy medium through which you can trade your tokens',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          /// create account , log in button
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: constraints.maxWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                      ),
                                      barrierColor: const Color(0xFF27282B).withOpacity(0.76),
                                      enableDrag: false,
                                      elevation: 1.5,
                                      context: context,
                                      builder: (context){
                                        return _bottomModalSheet(context, constraints);
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF4D84FF),
                                    onSurface: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 21),
                                  ),
                                  child: const Text(
                                    'Create A New Account',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: constraints.maxWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, Login.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 21),
                                  ),
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4D84FF),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  /// Bottom modal Widget [Update App]
  Widget _bottomModalSheet(BuildContext context, BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight / 2.2,
      decoration: const BoxDecoration(
        borderRadius:  BorderRadius.vertical(top: Radius.circular(14.0)),
        color: Color(0xFF27282B),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: constraints.maxWidth * 0.13,
              height: constraints.maxHeight * 0.004,
              decoration: BoxDecoration(
                color: const Color(0xFFD0D5E0),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            const Text(
              'Let\'s Set up Your Account',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
            const Text(
              'What country do you live in?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF8791A7),
                fontWeight: FontWeight.normal,
                fontSize: 18.5,
              ),
            ),
            /// update button
            SizedBox(
              width: constraints.maxWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Register.id);
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
  }
}
