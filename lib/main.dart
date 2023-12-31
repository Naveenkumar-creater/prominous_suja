import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:suja_shoie_app/feature/presentaion/api_services/user_service.dart';
import 'package:suja_shoie_app/feature/presentaion/pages/home_page/main_screen.dart';
import 'package:suja_shoie_app/feature/presentaion/pages/login_page.dart';

import 'package:suja_shoie_app/feature/presentaion/providers/bottom_tap_provider.dart';
import 'package:suja_shoie_app/feature/presentaion/providers/checklist_status_provider.dart';
import 'package:suja_shoie_app/feature/presentaion/providers/loginprovider.dart';
import 'package:suja_shoie_app/feature/presentaion/providers/theme_providers.dart';
import 'package:suja_shoie_app/feature/presentaion/providers/userprovider.dart';

import 'package:suja_shoie_app/constant/utils/theme_styles.dart';

import 'feature/presentaion/pages/widget/login_page_widget/responsive_login_screen.dart';
import 'feature/presentaion/providers/machine_list_provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(
            create: (_) => LoginProvider(),
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider<MachineList>(
            create: (_) => MachineList(),
          ),
          ChangeNotifierProvider<TabProvider>(
            create: (_) => TabProvider(),
          ),
          ChangeNotifierProvider<UserProvider>(
            create: (_) => UserProvider(),
          ),
          ChangeNotifierProvider<CheckListStatusProvider>(
            create: (_) => CheckListStatusProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: "Suja_Shoei",
              theme: themeData(context, themeProvider.isDarkTheme),
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: LoginPage(),
              ),
            );
          },
        ));
  }
}

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key? key}) : super(key: key);

  @override
  _DefaultScreenScreenState createState() => _DefaultScreenScreenState();
}

class _DefaultScreenScreenState extends State<DefaultScreen> {
  final Login_auth_Screen authService = Login_auth_Screen();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      authService.getUserData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final userToken = user?.token;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return userToken != null && userToken.isNotEmpty
              ? const MainScreen()
              : const LoginScreen();
        },
      ),
    );
  }
}
