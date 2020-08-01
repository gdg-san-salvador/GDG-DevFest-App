import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_devfest/config/config_bloc.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  static const String routeName = "/map";
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _controller;
  bool isMapCreated = false;

  static final LatLng mxLocation = LatLng(23.6260333, -102.5375005);
  static final LatLng gtLocation = LatLng(15.7778664, -90.2299096);
  static final LatLng svLocation = LatLng(13.8029939, -88.9053364);
  static final LatLng crLocation = LatLng(9.6301892, -84.2541844);
  static final LatLng boLocation = LatLng(-16.2837065, -63.5493965);
  static final LatLng peLocation = LatLng(-9.1951786, -74.9904165);
  static final LatLng arLocation = LatLng(-38.4192641, -63.5989206);
  static final LatLng clLocation = LatLng(-36.739055, -71.0574941);

  @override
  void initState() {
    super.initState();
  }

  final CameraPosition _kLatam = CameraPosition(
    target: peLocation,
    zoom: 1,
  );

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("Mexico"),
          position: mxLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("Guatemala"),
          position: gtLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("El Salvador"),
          position: svLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("Costa Rica"),
          position: crLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("Peru"),
          position: peLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("Bolivia"),
          position: boLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("Argentina"),
          position: arLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      Marker(
          markerId: MarkerId("Chile"),
          position: clLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          ))
    ].toSet();
  }

  changeMapMode() {
    if (ConfigBloc().darkModeOn) {
      getJsonFile("assets/nightmode.json").then(setMapStyle);
    } else {
      getJsonFile("assets/daymode.json").then(setMapStyle);
    }
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
    }
    return DevScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _createMarker(),
              initialCameraPosition: _kLatam,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                isMapCreated = true;
                changeMapMode();
                setState(() {});
              },
            ),
            IgnorePointer(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "DevFest 2020\n",
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        children: [
                          TextSpan(
                              text: "¡Latinoamérica Unida!",
                              style: Theme.of(context).textTheme.headline5,
                              children: []),
                        ]),
                  )),
            )
          ],
        ),
      ),
      title: "Mapa",
    );
  }
}
