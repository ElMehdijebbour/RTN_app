import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story/pages/qrview.page.dart';
import 'package:story/theme/appcolors.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: LightThemeColors.passiveIconColor,
      bottomNavigationBar:FFNavigationBar(
        theme: FFNavigationBarTheme(
          unselectedItemTextStyle: const TextStyle(
            fontSize: 12.0,
          ),
          selectedItemTextStyle: const TextStyle(
            fontSize: 13.0
          ),
          unselectedItemIconColor: Colors.white,
          unselectedItemLabelColor: Colors.white,
          barBackgroundColor: LightThemeColors.passiveIconColor,
          selectedItemBorderColor: LightThemeColors.passiveIconColor,
          selectedItemBackgroundColor: LightThemeColors.passiveIconColor,
          selectedItemIconColor: LightThemeColors.activeIconColor,
          selectedItemLabelColor: LightThemeColors.activeIconColor,
        ),
        selectedIndex: selectedIndex,

        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.qrcode,
            label: 'Scan',
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.addressCard,
            label: 'Account',
          ),

        ],
      ),
      body:  SafeArea(
        child: IndexedStack(
            index: selectedIndex,
            children: [
              QRScanPage(),
              Container(
                child: Center(
                    child: Text("Coming soon!")
                ),
              ),

            ]),
      ),
    );
  }
}


