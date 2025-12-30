import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restici_admin/core/app_routes/routes_strings.dart';
import 'package:restici_admin/screens/main_screen.dart';
import 'package:restici_admin/screens/principale/dashboard_screen.dart';

void main() {
  runApp(
    const MyApp()
   /*MultiProvider(
       providers: [
         //ChangeNotifierProvider(create: (_) => AppRouter()),
       ],
     child:
   )*/
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rest'ici Admin",
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: const ,
      initialRoute: RoutesStrings.homeScreen,
      routes: {
        RoutesStrings.homeScreen: (context) => const DashboardScreen(),
      },
    );
  }
}
