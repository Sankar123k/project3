import 'package:class15/wb_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'tasbhi_counter_page.dart';


void main() async{
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasbhiCounterPage(),
      


    );
    
  }
}