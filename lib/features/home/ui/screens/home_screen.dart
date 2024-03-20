import 'package:expense_tracker/core/helpers/spacing.dart';
import 'package:expense_tracker/core/theming/colors.dart';
import 'package:expense_tracker/core/theming/fonts.dart';
import 'package:expense_tracker/features/home/ui/widgets/balance_widget.dart';
import 'package:expense_tracker/features/home/ui/widgets/home.dart';
import 'package:expense_tracker/features/home/ui/widgets/percents_widget.dart';
import 'package:expense_tracker/features/transactions/transactions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../widgets/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    Home(),
    TransactionsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0,0.7],
            // stops: [0.0,0.5],
            colors: [AppColors.orangeColor,Colors.black87]
          )
        ),
        child: screens[currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.orangeColor,
            unselectedItemColor: Colors.grey[600],
            currentIndex: currentIndex,
            onTap: (value){
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,size: 30,),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_outlined,size: 30,),
                  label: 'Transactions'
              )
            ],
          ),
        ),
      ),
    );
  }
}
