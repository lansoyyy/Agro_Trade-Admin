import 'package:agro_trade_admin/constant/colors.dart';
import 'package:agro_trade_admin/screens/auth/landing_page.dart';
import 'package:agro_trade_admin/screens/tabs/accounts_tab.dart';
import 'package:agro_trade_admin/screens/tabs/items_tab.dart';
import 'package:agro_trade_admin/screens/tabs/prices_tab.dart';
import 'package:agro_trade_admin/screens/tabs/trade_tab.dart';
import 'package:agro_trade_admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: primary,
            child: SideMenu(
              controller: page,
              style: SideMenuStyle(
                  unselectedTitleTextStyle:
                      const TextStyle(color: Colors.white),

                  // showTooltip: false,
                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: blueAccent,
                  selectedColor: Colors.black38,
                  selectedTitleTextStyle:
                      GoogleFonts.openSans(color: Colors.white),
                  selectedIconColor: Colors.white,
                  unselectedIconColor: Colors.white
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  // ),
                  // backgroundColor: Colors.blueGrey[700]
                  ),
              title: Container(
                decoration: const BoxDecoration(
                    color: greyAccent,
                    border: Border(
                        bottom: BorderSide(width: 1, color: greyAccent))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
              footer: Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: greyAccent,
                    border: Border(
                        bottom: BorderSide(width: 1, color: greyAccent))),
                child: Center(
                  child: NormalText(
                    label: 'All right reserved.',
                    fontSize: 12,
                    color: primary,
                  ),
                ),
              ),
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Accounts',
                  onTap: () {
                    page.jumpToPage(0);
                  },
                  icon: const Icon(Icons.account_box_rounded),
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'Trades',
                  onTap: () {
                    page.jumpToPage(1);
                  },
                  icon: const Icon(Icons.volunteer_activism_outlined),
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Posted Items',
                  onTap: () {
                    page.jumpToPage(2);
                  },
                  icon: const Icon(Icons.sell_rounded),
                ),
                SideMenuItem(
                  priority: 3,
                  title: 'Prices',
                  onTap: () {
                    page.jumpToPage(3);
                  },
                  icon: const Icon(Icons.price_change_rounded),
                ),
                SideMenuItem(
                  priority: 5,
                  title: 'Logout',
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: const [
                AccountsTab(),
                TradeTab(),
                ItemsTab(),
                PricesTab()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
