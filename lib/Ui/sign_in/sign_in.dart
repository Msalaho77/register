import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_assets.dart';
import 'package:login_screen/Ui/utils/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../container/card_container.dart';

class SignIn extends StatelessWidget {
  final SizingInformation sizingInformation;
  SignIn({super.key, required this.sizingInformation});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen =
        sizingInformation.deviceScreenType == DeviceScreenType.mobile;

    final List<Map<String, String>> appBarItems = [
      {"title": "English"},
      {"title": "Contact us"},
      {"title": "News"},
      {"title": "Serves"},
      {"title": "about App"},
      {"title": "Home"},
    ];

    final double logoSize = isSmallScreen ? 60 : 80;
    final double buttonPadding = isSmallScreen ? 10 : 20;
    final double appBarHeight = isSmallScreen ? 56 : 80;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: appBarHeight,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Image.asset(
            AppAssets.logo,
            width: logoSize,
            height: logoSize,
          ),
        ),
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSmallScreen)
                  Expanded(
                    child: PopupMenuButton<String>(
                      onSelected: (String routeName) {},
                      itemBuilder: (BuildContext context) {
                        return appBarItems
                            .map((item) => PopupMenuItem<String>(
                                  value: item['routeName'],
                                  child: Text(item['title']!),
                                ))
                            .toList();
                      },
                    ),
                  ),
                if (!isSmallScreen)
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: appBarItems
                          .map((item) => buildTextAppBar(context, item))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          SizedBox(width: buttonPadding),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(AppColors.transparent),
            ),
            child: Text(
              "Sign In",
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: CardContainer(),
    );
  }

  Widget buildTextAppBar(BuildContext context, Map<String, String> item) {
    return Flexible(
        child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, item['routeName']!);
      },
      child: Text(item['title']!),
    ));
  }
}