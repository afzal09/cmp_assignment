import 'dart:ui';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:cmp_assignment/screens/widgets/quoatation_denerated/slideup_content.dart';

import 'package:cmp_assignment/screens/home_screen.dart';
//import 'package:cmp_assignment/screens/quoatation_generated.dart';
void main() async{
  final logger = Logger('main');
  PlatformDispatcher.instance.onError = (error,stack){
      logger.warning('Caught error by PlatformDispatcher: $error');
      logger.warning('Stack trace: $stack');
      return true; 
  };
   runApp(
    ChangeNotifierProvider(
      create: (_) => SlotProvider(),
      child: const MainApp(),
    ),
   );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
