import 'package:finalcca/model/location_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class HomewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locationModel = Provider.of<LocationModel>(context);
    _launchURL() async {
      var url = 'http://20.83.163.49:8080/gps-tracking-writer/add-tracking?loc=${locationModel.latitude},%20${locationModel.longitude}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text('${locationModel.latitude}, ${locationModel.longitude}'),
        leading: GestureDetector(
          onTap: _launchURL,
          child: Icon(
            Icons.search,
            size: 26.0,
          ),
        ),
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
