import 'package:finalcca/services/location_service.dart';
import 'package:finalcca/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/location_model.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return StreamProvider<LocationModel>(
      create: (_) => LocationService().getStreamData,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomewView(),
      ),
    );
  }
}