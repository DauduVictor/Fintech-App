import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_fin/utils/constants.dart';

class FilterTransactions extends StatefulWidget {

  static const String id = 'filterTransaction';
  const FilterTransactions({Key? key}) : super(key: key);

  @override
  _FilterTransactionsState createState() => _FilterTransactionsState();
}

class _FilterTransactionsState extends State<FilterTransactions> {

  ///Text Editing Controller for start date and end date
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  /// Variable to hold checkbox value for bought
  bool _boughtCheckboxValue = false;

  /// Variable to hold checkbox value for bought
  bool _soldCheckboxValue = false;

  /// Variable to hold checkbox value for bought
  bool _withdrawalCheckboxValue = false;

  /// Variable to hold checkbox value for bought
  bool _depositsCheckboxValue = false;

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
              height: constraints.maxHeight,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 43),
                    /// Back button and filter transaction text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFFD8EFFF),
                            radius: 21,
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: Color(0xFF1A2139),
                              size: 23,
                            ),
                          ),
                        ),
                        const Text(
                          'Filter Transactions',
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ///Bought
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 1.0, right: 10.0),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFE9FCEB),
                        radius: 21,
                        child: Transform.rotate(
                          angle: 30,
                          child: const Icon(
                            Icons.call_received,
                            color: Color(0xFF27AE60),
                            size: 23,
                          ),
                        ),
                      ),
                      title: const Text(
                        'Bought',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      trailing: Checkbox(
                        value: _boughtCheckboxValue,
                        onChanged: (value) {
                          setState(() {
                            _boughtCheckboxValue = !_boughtCheckboxValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ///Sold
                    ListTile(
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
                        'Sold',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      trailing: Checkbox(
                        value: _soldCheckboxValue,
                        onChanged: (value) {
                          setState(() {
                            _soldCheckboxValue = !_soldCheckboxValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ///Withdrawal
                     ListTile(
                      contentPadding: const EdgeInsets.only(left: 1.0, right: 10.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFF0F4FD),
                        radius: 21,
                        child: Icon(
                          Icons.arrow_downward_sharp,
                          color: kBackgroundColor,
                          size: 23,
                        ),
                      ),
                      title: const Text(
                        'Withdrawal',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      trailing: Checkbox(
                        value: _withdrawalCheckboxValue,
                        onChanged: (value) {
                          setState(() {
                            _withdrawalCheckboxValue = !_withdrawalCheckboxValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ///Deposits
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 1.0, right: 10.0),
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFEDF2FE),
                        radius: 21,
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF4D84FF),
                          size: 23,
                        ),
                      ),
                      title: const Text(
                        'Deposits',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kBackgroundColor,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      trailing: Checkbox(
                        value: _depositsCheckboxValue,
                        onChanged: (value) {
                          setState(() {
                            _depositsCheckboxValue = !_depositsCheckboxValue;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Divider(
                      thickness: 1.0,
                      color: Color(0xFFF0F4FD),
                    ),
                    const SizedBox(height: 28),
                    ///By Date
                    const Text(
                      'By Date',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 28),
                    ///Start Date
                    SizedBox(
                      width: constraints.maxWidth,
                      child: TextFormField(
                        style: kFormTextStyle,
                        decoration: kFormInputDecoration.copyWith(
                          hintText: 'Start Date',
                          hintStyle: const TextStyle(color: Color(0xFFA3A8B3),fontWeight: FontWeight.w500, fontSize: 16),
                          fillColor: Colors.white,
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF4F5877),
                            size: 24,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF2D2D2F), width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF2D2D2F), width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        controller: _startDateController,
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
                            setState(() => _startDateController.text = DateFormat('d / MMM / yyyy').format(picked).toString());
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
                    const SizedBox(height: 25),
                    ///End Date
                    SizedBox(
                      width: constraints.maxWidth,
                      child: TextFormField(
                        style: kFormTextStyle,
                        decoration: kFormInputDecoration.copyWith(
                          hintText: 'End Date',
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(color: Color(0xFFA3A8B3),fontWeight: FontWeight.w500, fontSize: 16),
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF4F5877),
                            size: 24,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF2D2D2F), width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF2D2D2F), width: 1.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        controller: _endDateController,
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
                            setState(() => _endDateController.text = DateFormat('d / MMM / yyyy').format(picked).toString());
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
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () { },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF4D84FF),
                          onSurface: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        child: const Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 19,
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
    );
  }
}
