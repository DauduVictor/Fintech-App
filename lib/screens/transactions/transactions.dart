import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_fin/components/circle_indicator.dart';
import 'package:my_fin/utils/constants.dart';
import 'filter_transactions.dart';

class Transaction extends StatefulWidget {

  static const String id = 'transaction';
  const Transaction({Key? key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {

  /// Variable to hold the bool value of the spinner
  bool _showSpinner = true;

  TextEditingController _search = TextEditingController();

  /// Variable to hold the bool value of the showSearchbar
  bool _showSearchBar = false;

  void _navigate() {
    Timer(const Duration(seconds: 3), () {
      setState(() => _showSpinner = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints){
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      child: _showSearchBar == false ? Row(
                        children: [
                          const Text(
                            'Transactions',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 29,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 300),
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return const FilterTransactions();
                                  },
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: animation.drive(
                                        Tween(
                                          begin: const Offset(0,1),
                                          end: const Offset(0,0),
                                        ),
                                      ),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.tune,
                              color: kBackgroundColor,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() => _showSearchBar = true);
                              print(_showSearchBar);
                            },
                            child: const Icon(
                              IconlyLight.search,
                              color: kBackgroundColor,
                              size: 25,
                            ),
                          ),
                        ],
                      ) :
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:  const Color(0xFFECEDF0),
                              ),
                              child: TextField(
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.search,
                                autofocus: true,
                                controller: _search,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    IconlyLight.search,
                                    color: Colors.black,
                                    size: 17,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(12, 12, 5, 12),
                                ),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() => _showSearchBar = false);
                              print(_showSearchBar);
                            },
                            child: const Text('Cancel', style: kTabBarTextStyle),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Container(
                      width: constraints.maxWidth,
                      height: 43,
                      padding: const EdgeInsets.all(2.3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFF7F9FD),
                      ),
                      child: TabBar(
                        labelPadding: const EdgeInsets.all(1.0),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0F0F0F).withOpacity(0.15),
                              blurRadius: 1.5,
                            ),
                          ],
                        ),
                        tabs: const [
                          Tab(child: Text('All', style: kTabBarTextStyle)),
                          Tab(child: Text('Completed', style: kTabBarTextStyle)),
                          Tab(child: Text('Pending', style: kTabBarTextStyle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView.separated(
                            padding: const EdgeInsets.all(0),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 11,
                            separatorBuilder: (context, int index) {
                              return const Divider(
                                thickness: 1.0,
                                color: Color(0xFFF0F4FD),
                              );
                            },
                            itemBuilder: (context, int index) {
                              return ListTile(
                                horizontalTitleGap: 10,
                                contentPadding: const EdgeInsets.only(left: 1.0, right: 10.0),
                                leading: const CircleAvatar(
                                  backgroundColor: Color(0xFFFAF0ED),
                                  radius: 21,
                                  child: Icon(
                                    Icons.call_made,
                                    color: Color(0xFFEB5757),
                                    size: 23,
                                  ),
                                ),
                                title: const Text(
                                  'Purchased 100 WeMove Technical Work station ad dhd js9is hishd ',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kBackgroundColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                ),
                                subtitle: const Text(
                                  'GETXN_TKN_BUY_954675741',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xFF4F5877),
                                  ),
                                ),
                                trailing: const Text('23 Jun 2021', style: TextStyle(color: Color(0xFF4F5877))),
                                onTap: () {
                                  _showDetailModalSheet(constraints);
                                },
                              );
                            },
                          ),
                          Container(),
                          ListView.separated(
                            padding: const EdgeInsets.all(0),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 11,
                            separatorBuilder: (context, int index) {
                              return const Divider(
                                thickness: 1.0,
                                color: Color(0xFFF0F4FD),
                              );
                            },
                            itemBuilder: (context, int index) {
                              return ListTile(
                                horizontalTitleGap: 10,
                                contentPadding: const EdgeInsets.only(left: 1.0, right: 10.0),
                                leading: const CircleAvatar(
                                  backgroundColor: Color(0xFFF0F4FD),
                                  radius: 21,
                                  child: Icon(
                                    IconlyLight.timeCircle,
                                    color: Color(0xFF4F5877),
                                    size: 23,
                                  ),
                                ),
                                title: const Text(
                                  'Puchased 235 WeMove Technologies and mangoes',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: kBackgroundColor,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                ),
                                subtitle: Row(
                                  children: const [
                                    Text(
                                      '\$55',
                                      style: TextStyle(
                                        color: kBackgroundColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Text('•', style: TextStyle(color: Colors.black, fontSize: 10)),
                                    ),
                                    Text(
                                      'Pending...',
                                      style: TextStyle(
                                        color: Color(0xFFF2994A),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: const Text('Today', style: TextStyle(color: Color(0xFF4F5877))),
                                onTap: () {
                                  _showPendingModalSheet(constraints);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ///widget to show the dialog for all transaction notifications
  Future<void> _showDetailModalSheet (BoxConstraints constraints) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0xFF001140).withOpacity(0.76),
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _showSpinner == true ? const Center(child: CircleProgressIndicator()) :
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///transaction summary
                  const Text(
                    'Transaction Summary',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ///ref
                  const Text(
                    'Ref: GETXN_TKN_ESCROW_199867854',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Color(0xFF8791A7),
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ///transaction summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Purchased 100 token Fluidcoin Token',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: constraints.maxHeight * 0.016,
                        child: Image.asset('assets/images/q0iotj8yxppzxznznijh_qyf7yx 1.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const Divider(
                    thickness: 1.0,
                    color: Color(0xFFF0F4FD),
                  ),
                  const SizedBox(height: 8.5),
                  ///amount and type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Amount',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'N100,000',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Type',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Debit',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.5),
                  const Divider(
                    thickness: 1.0,
                    color: Color(0xFFF0F4FD),
                  ),
                  const SizedBox(height: 8.5),
                  ///date and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Date',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Jan 12, 2020 10:58 AM',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Status',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Completed',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ///close and share button
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
                          'Close',
                          style: TextStyle(
                            fontSize: 19,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        child: const Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 19,
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
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: constraints.maxHeight * 0.023,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 31,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///widget to show the dialog for pending transaction
  Future<void> _showPendingModalSheet (BoxConstraints constraints) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0xFF001140).withOpacity(0.76),
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _showSpinner == true ? const Center(child: CircleProgressIndicator()) :
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///transaction summary
                  const Text(
                    'Transaction Summary',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const SizedBox(height: 15),
                  ///transaction summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Purchased 100 token Fluidcoin Token',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: constraints.maxHeight * 0.016,
                        child: Image.asset('assets/images/q0iotj8yxppzxznznijh_qyf7yx 1.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const Divider(
                    thickness: 1.0,
                    color: Color(0xFFF0F4FD),
                  ),
                  const SizedBox(height: 8.5),
                  ///amount and type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Amount',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'N100,000',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Type',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Debit',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.5),
                  const Divider(
                    thickness: 1.0,
                    color: Color(0xFFF0F4FD),
                  ),
                  const SizedBox(height: 8.5),
                  ///date and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Date',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Jan 12, 2020 10:58 AM',
                            style: TextStyle(
                              color: kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Status',
                            style: TextStyle(
                              color: Color(0xFF8791A7),
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Pending',
                            style: TextStyle(
                              color: Color(0xFFF2994A),
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ///close and share button
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
                          'Close',
                          style: TextStyle(
                            fontSize: 19,
                            color: Color(0xFF4F5877),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showCancelTransactionModalSheet(constraints);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFEE6E6),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        child: const Text(
                          'Cancel Transaction',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFE84343),
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
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: constraints.maxHeight * 0.023,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 31,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///widget to show the dialog for cancel transaction
  Future<void> _showCancelTransactionModalSheet (BoxConstraints constraints) {
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
                  const CircleAvatar(
                    radius: 38,
                    backgroundColor: Color(0xFFFEE6E6),
                    child: Icon(
                      Icons.warning_rounded,
                      color: Color(0xFFE84343),
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Cancel Transactions?',
                    style: TextStyle(
                      color: Color(0xFF001140),
                      fontWeight: FontWeight.w600,
                      fontSize: 23,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 8, 15, 20),
                    child: Text(
                      'By canceling, this trade will be removed from listing and you will have to post again if you change your mind',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF001140),
                        fontWeight: FontWeight.normal,
                        fontSize: 18.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  /// interaction buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        child: const Text(
                          'Don\'t Cancel',
                          style: TextStyle(
                            fontSize: 19,
                            color: Color(0xFF4F5877),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () { },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFEE6E6),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        child: const Text(
                          'Yes, Cancel',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFE84343),
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
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: constraints.maxHeight * 0.023,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 31,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
