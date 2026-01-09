import 'package:car_rental/features/common/intro/view/intro_page.dart';
import 'package:car_rental/features/details/controller/car_detailes_controller.dart';
import 'package:car_rental/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeController(),),
      ChangeNotifierProvider(create: (context) => CarDetailesController(),),
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      home: const CarOnboardingPage(),
    );
  }
}
