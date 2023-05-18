  import 'package:flutter/material.dart';
	import 'home.dart';
  import 'premium.dart';
	
  void main() => runApp(MyApp());
	
  
	
  class MyApp extends StatelessWidget {
	
    @override
	
    Widget build(BuildContext context) {
	
      return MaterialApp(
	
        title: 'ChatGPT Token Calc',
	      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(context) => RadialGradientApp(),
          '/first':(context) => premiumPage(),
        },
        
	      theme: ThemeData(
          primaryColor: Color.fromRGBO(255, 255, 255, 0.1),
        ),
      );
	
    }
	
  }
	
  
	
 

