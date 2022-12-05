import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../Widgets/action_button.dart';
import '../Widgets/navbar.dart';
import '../providers/maps_provider.dart';

class mapsPage extends StatefulWidget {
  mapsPage({Key? key}) : super(key: key);

  @override
  State<mapsPage> createState() => _mapsPageState();
}

class _mapsPageState extends State<mapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MapaProvider>(
        builder: (context, Provider, child) => GoogleMap(
          onMapCreated: Provider.onMapCreated,
          markers: Provider.mapMarkers,
          initialCameraPosition: CameraPosition(
            target: LatLng(Provider.getLatitud, Provider.getLongitud),
            zoom: 15.0,
          ),
        ),
      ),
      bottomNavigationBar: Navbar(context, screen: ' '),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
