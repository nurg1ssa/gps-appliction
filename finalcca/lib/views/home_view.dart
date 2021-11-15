import 'package:finalcca/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
class HomewView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var locationModel = Provider.of<LocationModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text('${locationModel.latitude}, ${locationModel.longitude}')
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(locationModel.latitude,locationModel.latitude),
          zoom: 8.0
        ),
        layers: [
           TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a','b','c']
          )
        ]
      ),
    );
  }
}
