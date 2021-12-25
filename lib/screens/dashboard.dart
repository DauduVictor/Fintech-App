import 'package:flutter/material.dart';
import 'package:my_fin/components/current_tokens_dashboard.dart';
import 'package:my_fin/components/nav_icon.dart';
import 'package:my_fin/components/selling_card.dart';
import 'package:my_fin/utils/constants.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Dashboard extends StatefulWidget {

  static const String id = 'dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  /// A variable to hold the total number of pages that will be slided to and from
  final int _numPages = 2;

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
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: _isActive ? const Color(0xFF27AE60) : const Color(0xFFE1E6F0),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  /// Variable to hold the greeting
  String? _greeting;

  /// Function that shows greetings based on the users local time
  void greetingMessage() {

    ///Instance of [DateTime] class
    var now = DateTime.now().hour;

    if (now < 12) {
      setState(() => _greeting = 'Good Morning') ;
    } else if (now < 17) {
      setState(() => _greeting = 'Good Afternoon');
    } else {
      setState(() => _greeting = 'Good Evening');
    }
  }

  /// Variable to hold the bool value of [Password] obscure text in the form field
  bool _obscureAvailableCash = true;

  @override
  void initState() {
    greetingMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    color: kBackgroundColor,
                    height: constraints.maxHeight * 0.245,
                    width: constraints.maxWidth,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Profile picture, greeting and notifications
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 55, 12, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: constraints.maxHeight * 0.028,
                              foregroundImage: const AssetImage("assets/images/IMG_1.jpeg"),
                            ),
                            const SizedBox(width: 8.5),
                            Text(
                              (_greeting != null ? _greeting! : 'Hello') + ', Victor',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              IconlyBold.notification,
                              size: 25,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      /// 1st - dashboardCard
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: SizedBox(
                          height: constraints.maxHeight * 0.2,
                          width: constraints.maxWidth,
                          child: Stack(
                            children: [
                              PageView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padEnds: false,
                                controller: _pageController,
                                onPageChanged: (int page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                children: [
                                  /// Available cash tab
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    elevation: 2.0,
                                    shadowColor: const Color(0xFF2C4989).withOpacity(0.6),
                                    /// 1st - card
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          /// Available cash
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              /// Available cash - cash visibility
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Available Cash',
                                                    style: TextStyle(
                                                      color: Color(0xFF4F5877),
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 9),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _obscureAvailableCash = !_obscureAvailableCash;
                                                      });
                                                    },
                                                    child: Icon(
                                                      _obscureAvailableCash == true ? IconlyBold.show : IconlyBold.hide,
                                                      color: kBackgroundColor,
                                                      size: 21,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              /// Add to wallet button
                                              ElevatedButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                                    ),
                                                    barrierColor: const Color(0xFF001140).withOpacity(0.76),
                                                    enableDrag: false,
                                                    elevation: 1.5,
                                                    context: context,
                                                    builder: (context){
                                                      return _bottomModalSheet(context, constraints);
                                                    },
                                                  );
                                                },
                                                onLongPress: () {
                                                  _showNotificationModalSheet(constraints);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: const Color(0xFF4D84FF),
                                                  onSurface: Colors.white,
                                                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: const [
                                                    Icon(
                                                      Icons.add,
                                                      size: 18,
                                                    ),
                                                    SizedBox(width: 6),
                                                    Text(
                                                      'Add to wallet',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          /// Cash
                                          Text(
                                            _obscureAvailableCash == true ? '\$X,XXX.XX' : '\$250,000.00',
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                              color: Color(0xFF001140),
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  /// View all my tokens tab
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    elevation: 2.0,
                                    shadowColor: const Color(0xFF2C4989).withOpacity(0.6),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(13, 16, 13, 6),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CurrentTokensContainer(
                                                tokenAmount: '130',
                                                imageUrl: 'assets/images/b8q5ly7ray9euqqde1uh 1.png',
                                                constraints: constraints,
                                              ),
                                              CurrentTokensContainer(
                                                tokenAmount: '90',
                                                imageUrl: 'assets/images/q0iotj8yxppzxznznijh_qyf7yx 1.png',
                                                constraints: constraints,
                                              ),
                                              CurrentTokensContainer(
                                                tokenAmount: '190',
                                                imageUrl: 'assets/images/jpi0jq5k1m2jaxm5l1pl_q9xdpe 1.png',
                                                constraints: constraints,
                                              ),
                                            ],
                                          ),
                                          /// View all my tokens button
                                          TextButton(
                                            onPressed: () {  },
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color(0xFFFFFFFF),
                                              onSurface: const Color(0xFF4D84FF),
                                              padding: const EdgeInsets.all(5.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: const [
                                                Text(
                                                  'View all my tokens',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(width: 6),
                                                Icon(
                                                  Icons.arrow_forward_ios_outlined,
                                                  size: 19,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /// Page indicator
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15, right: 20),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: _buildPageIndicator(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      /// 2nd - dashboardCard
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCEDE9),
                            borderRadius: BorderRadius.circular(4.1),
                          ),
                          child: Column(
                            children: [
                              /// Verify your information
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 13, 20, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.warning_rounded,
                                          size: 26,
                                          color: Color(0xFFF2994A),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Verify your information',
                                          style: TextStyle(
                                            color: Color(0xFF693221),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      IconlyBold.shieldDone,
                                      color: Color(0xFF001140),
                                      size: 35,
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 1.0,
                              ),
                              /// Complete verification process and nav button
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 13, 20, 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        'Please complete your verification process in order to start trading', //verification process in order ro start trading',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color(0xFF693221),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 19,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color(0xFF693221),
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      /// 3rd - dashboardCard
                      Container(
                        color: const Color(0xFFF8F9FC),
                        padding: const EdgeInsets.fromLTRB(16, 8, 20, 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Top selling and see all button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// Top selling
                                const Text(
                                  'Top Selling',
                                  style: TextStyle(
                                    color: Color(0xFF001140),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                /// see all
                                TextButton(
                                  onPressed: () {  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onSurface: const Color(0xFF4D84FF),
                                    padding: const EdgeInsets.all(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        'See all',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ReusableSellingCard(
                                    isFall: false,
                                    imageUrl: 'assets/images/b8q5ly7ray9euqqde1uh 1.png',
                                    coinName: 'BREZ',
                                    percentagePrice: '+1.63%',
                                    constraints: constraints,
                                  ),
                                  const SizedBox(width: 12.5),
                                  ReusableSellingCard(
                                    isFall: true,
                                    imageUrl: 'assets/images/q0iotj8yxppzxznznijh_qyf7yx 1.png',
                                    coinName: 'FLCN',
                                    percentagePrice: '-0.40%',
                                    constraints: constraints,
                                  ),
                                  const SizedBox(width: 12.5),
                                  ReusableSellingCard(
                                    isFall: false,
                                    imageUrl: 'assets/images/jpi0jq5k1m2jaxm5l1pl_q9xdpe 1.png',
                                    coinName: 'ONFE',
                                    percentagePrice: '0.47%',
                                    constraints: constraints,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /// New - In
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(
                          'New-In',
                          style: TextStyle(
                            color: Color(0xFF001140),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
                height: 60.5,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.1, color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // touchedIcon = myColor.exercise;
                          // touchedIconSize = myColor.exercise;
                        });
                      },
                      child: const ReusableBottomIcon(
                        name: 'Overview',
                        iconName: Icons.dashboard,
                        iconColor: Color(0xFF4D84FF),
                        textColor: Color(0xFF135BFD)
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // touchedIcon = myColor.settings;
                          // touchedIconSize =  myColor.settings;
                          //Navigator.push(context, PageTransition(type:PageTransitionType.rightToLeftWithFade, child:  AllSettings()));
                        });
                      },
                      child: const ReusableBottomIcon(
                          iconName: Icons.trending_up,
                          name: 'Trade',
                          iconColor: Color(0xFF4F5877),
                          textColor: Color(0xFF4F5877)
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // touchedIcon = myColor.settings;
                          // touchedIconSize =  myColor.settings;
                          //Navigator.push(context, PageTransition(type:PageTransitionType.rightToLeftWithFade, child:  AllSettings()));
                        });
                      },
                      child: const ReusableBottomIcon(
                          iconName: Icons.sync_alt,
                          name: 'Transactions',
                          iconColor: Color(0xFF4F5877),
                          textColor: Color(0xFF4F5877)
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // touchedIcon = myColor.settings;
                          // touchedIconSize =  myColor.settings;
                          //Navigator.push(context, PageTransition(type:PageTransitionType.rightToLeftWithFade, child:  AllSettings()));
                        });
                      },
                      child: const ReusableBottomIcon(
                          iconName: IconlyBold.wallet,
                          name: 'Wallet',
                          iconColor: Color(0xFF4F5877),
                          textColor: Color(0xFF4F5877)
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // touchedIcon = myColor.settings;
                          // touchedIconSize =  myColor.settings;
                          //Navigator.push(context, PageTransition(type:PageTransitionType.rightToLeftWithFade, child:  AllSettings()));
                        });
                      },
                      child: const ReusableBottomIcon(
                          iconName: Icons.menu,
                          name: 'More',
                          iconColor: Color(0xFF4F5877),
                          textColor: Color(0xFF4F5877)
                      ),
                    ),
                  ],
                ),
              );
          }
        )
      ),
    );
  }

  ///widget to show the dialog for notifications
  Future<void> _showNotificationModalSheet (BoxConstraints constraints) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0xFF001140).withOpacity(0.76),
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 21),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFFFFFFF),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: constraints.maxWidth * 0.2,
                    height: constraints.maxWidth * 0.23,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Layer 29.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Turn On notifications',
                    style: TextStyle(
                      color: Color(0xFF001140),
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 8, 15, 20),
                    child: Text(
                      'You will get updates when important events happen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF001140),
                        fontWeight: FontWeight.normal,
                        fontSize: 18.5,
                      ),
                    ),
                  ),
                  /// update button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Not Now',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF4F5877),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () { },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF4D84FF),
                          onSurface: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Text(
                          'Turn On',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: constraints.maxHeight * 0.02,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.cancel_outlined,
                color: Colors.white,
                size: 31,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom modal Widget
Widget _bottomModalSheet(BuildContext context, BoxConstraints constraints) {
  return Container(
    height: constraints.maxHeight / 2.2,
    decoration: const BoxDecoration(
      borderRadius:  BorderRadius.vertical(top: Radius.circular(14.0)),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: constraints.maxWidth * 0.18,
            height: constraints.maxHeight * 0.006,
            decoration: BoxDecoration(
              color: const Color(0xFFD0D5E0),
              borderRadius: BorderRadius.circular(24.0),

            ),
          ),
          CircleAvatar(
            radius: constraints.maxHeight * 0.045,
            backgroundColor: const Color(0xFFFDF2E7),
            child: const Icon(
              Icons.file_download_outlined,
              size: 35,
              color: Color(0xFFF38920),
            ),
          ),
          const Text(
            'New versions are available!',
            style: TextStyle(
              color: Color(0xFF001140),
              fontWeight: FontWeight.w600,
              fontSize: 23,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'There’s a new version of GetEquity available. Update your app on the App Store to get the best experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF001140),
                fontWeight: FontWeight.normal,
                fontSize: 18.5,
              ),
            ),
          ),
          /// update button
          SizedBox(
            width: constraints.maxWidth,
            child: ElevatedButton(
              onPressed: () { },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF4D84FF),
                onSurface: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 18),
              ),
              child: const Text(
                'Update DemoApp',
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
