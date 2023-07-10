import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suja_shoie_app/pages/home_page/main_screen.dart';
import 'package:suja_shoie_app/pages/login_page.dart';
import 'package:suja_shoie_app/pages/spalsh_screen.dart';
import 'package:suja_shoie_app/providers/bottom_tap_provider.dart';
import 'package:suja_shoie_app/providers/theme_providers.dart';
import 'package:suja_shoie_app/utils/qr_code/qrcode_scaner.dart';
import 'package:suja_shoie_app/utils/theme_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TabProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeData(context, themeProvider.isDarkTheme),
            title: 'Flutter Login Web',
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      offset: const Offset(0, 50),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'account',
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: Icon(Icons.person),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Name'),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: null,
            child: Container(
              alignment: Alignment.center,
              child: const Text('My Account'),
            ),
          ),
          PopupMenuItem<String>(
            value: null,
            child: Container(
              alignment: Alignment.center,
              child: const Text('Account'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'signOut',
            child: Container(
              alignment: Alignment.center,
              child: const Text('Sign Out'),
            ),
          ),
          PopupMenuItem<String>(
            enabled: true,
            value: 'account',
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 300,
            ),
          ),
        ];
      },
      onSelected: null,
    );
  }
}
// class DropdownMenuExample extends StatefulWidget {
//   @override
//   _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   int selectedValueIndex = 0;
//   List<int> numberValues = [
//     0,
//     2,
//     5,
//     0
//   ]; // Corresponding number values for each option

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DropdownButton<int>(
//               value: selectedValueIndex,
//               onChanged: (newValueIndex) {
//                 setState(() {
//                   selectedValueIndex = newValueIndex!;
//                 });
//               },
//               items: <DropdownMenuItem<int>>[
//                 DropdownMenuItem<int>(
//                   value: 0,
//                   child: Text('Option 1'),
//                 ),
//                 DropdownMenuItem<int>(
//                   value: 1,
//                   child: Text('Option 2'),
//                 ),
//                 DropdownMenuItem<int>(
//                   value: 2,
//                   child: Text('Option 3'),
//                 ),
//                 DropdownMenuItem<int>(
//                   value: 3,
//                   child: Text('Option 4'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Text('Selected Value: ${numberValues[selectedValueIndex]}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
