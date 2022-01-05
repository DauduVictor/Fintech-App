import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:my_fin/components/circle_indicator.dart';
import 'package:my_fin/utils/constants.dart';

class Transaction extends StatefulWidget {

  static const String id = 'transaction';
  const Transaction({Key? key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {

  /// Variable to hold the bool value of the spinner
  bool _showSpinner = true;

  void _navigate() {
    Timer(const Duration(seconds: 3), () {
      setState(() => _showSpinner = false);
    });
  }

  @override
  void initState() {
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
          builder: (context, constraints){
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Row(
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
                          onTap: () {},
                          child: const Icon(
                            Icons.tune,
                            color: kBackgroundColor,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            IconlyLight.search,
                            color: kBackgroundColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Container(
                      width: constraints.maxWidth,
                      padding: const EdgeInsets.all(2.3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFF7F9FD),
                      ),
                      child: TabBar(
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
                    const SizedBox(height: 12),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            child: ListTile(
                              horizontalTitleGap: 10,
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFFAF0ED),
                                radius: 25,
                                child: Icon(
                                  Icons.call_made,
                                  color: Color(0xFFEB5757),
                                  size: 27,
                                ),
                              ),
                              title: const Text(
                                'Purchased 100 WeMove Technical Work station ad dhd js9is hishd ',
                                style: TextStyle(
                                  color: kBackgroundColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                              subtitle: const Text(
                                'GETXN_TKN_BUY_954675741',
                                style: TextStyle(
                                  color: Color(0xFF4F5877),
                                ),
                              ),
                              trailing: const Text('23 Jun 2021', style: TextStyle(color: Color(0xFF4F5877))),
                              onTap: () {
                                _showDetailModalSheet(constraints);
                              },
                            ),
                          ),
                          Container(),
                          Container(),
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

  ///widget to show the dialog for notifications
  Future<void> _showDetailModalSheet (BoxConstraints constraints) {
    if(mounted) _navigate();
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0xFF001140).withOpacity(0.76),
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _showSpinner == true ? const Center(child: CircleProgressIndicator()) : Container(
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
}
