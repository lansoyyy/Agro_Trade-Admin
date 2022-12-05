import 'package:agro_trade_admin/constant/colors.dart';
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
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/logo.png',
                        height: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      BoldText(
                        label: 'MARKET DO',
                        fontSize: 24,
                        color: blueAccent,
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
                    color: blueAccent,
                  ),
                ),
              ),
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Dashboard',
                  onTap: () {
                    page.jumpToPage(0);
                  },
                  icon: const Icon(Icons.dashboard),
                  tooltipContent: "This is a tooltip for Dashboard item",
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'Accounts',
                  onTap: () {
                    page.jumpToPage(1);
                  },
                  icon: const Icon(Icons.account_box_rounded),
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Orders',
                  onTap: () {
                    page.jumpToPage(2);
                  },
                  icon: const Icon(Icons.local_shipping_rounded),
                ),
                SideMenuItem(
                  priority: 3,
                  title: 'Products',
                  onTap: () {
                    page.jumpToPage(3);
                  },
                  icon: const Icon(Icons.sell_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: const [
                Text(''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
