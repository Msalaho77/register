import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_assets.dart';
import 'package:login_screen/Ui/utils/app_colors.dart';
import '../container/card_container.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  static const routeName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;
    final List<Map<String, String>> appBarItems = [
      {"title": "English"},
      {"title": "Contact us"},
      {"title": "News"},
      {"title": "Serves"},
      {"title": "about App"},
      {"title": "Home"},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Image.asset(
            AppAssets.logo,
            width: 40,
            height: 40,
          ),
        ),
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSmallScreen)
                  PopupMenuButton<String>(
                    onSelected: (String routeName) {},
                    itemBuilder: (BuildContext context) {
                      return appBarItems
                          .map((item) => PopupMenuItem<String>(
                          value: item['routeName'], child: Text(item['title']!)))
                          .toList();
                    },
                  ),
                if (!isSmallScreen)
                  ...appBarItems.map((item) => buildTextAppBar(context, item)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Login",
              style: TextStyle(color: AppColors.white),
            ),
          ),
          const SizedBox(width: 20,),
          ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor:
              WidgetStateProperty.all<Color>(AppColors.transparent),
            ),
            child: const Text(
              "Sign In",
              style: TextStyle(color: AppColors.primary),
            ),
          ),

        ],
      ),
      body:const CardContainer(),

    );
  }

  Widget buildTextAppBar(BuildContext context, Map<String, String> item) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, item['routeName']!);
        },
        child: Text(item['title']!));
  }
}