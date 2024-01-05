import 'package:my_portfolio/animations/entrance_fader.dart';
import 'package:my_portfolio/configs/app.dart';
import 'package:my_portfolio/configs/configs.dart';
import 'package:my_portfolio/provider/app_provider.dart';
import 'package:my_portfolio/provider/drawer_provider.dart';
import 'package:my_portfolio/provider/scroll_provider.dart';
import 'package:my_portfolio/responsive/responsive.dart';
import 'package:my_portfolio/utils/navbar_utils.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:my_portfolio/widgets/navbar_actions_button.dart';
import 'package:my_portfolio/widgets/navbar_logo.dart';
import 'package:provider/provider.dart';

import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/widgets/arrow_on_top.dart';

part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const _MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const _Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const _NavBarTablet()
                : const _NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}