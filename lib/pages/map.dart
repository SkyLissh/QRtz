import "dart:async";

import "package:flutter/material.dart";
import "package:feather_icons_svg/feather_icons_svg.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_maps_flutter/google_maps_flutter.dart";

import "package:qr_scanner/constants/constants.dart";
import "package:qr_scanner/models/models.dart";
import "package:qr_scanner/widgets/widgets.dart";

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _controller = Completer<GoogleMapController>();
  var _position = _kInitial.target;

  static const CameraPosition _kInitial = CameraPosition(
    target: LatLng(40.730610, -73.935242),
    zoom: 14.4746,
  );

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _position = position.target;
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);

    if (context.isDark) {
      final darkStyle = await DefaultAssetBundle.of(context)
          .loadString("assets/google_maps_dark.json");

      controller.setMapStyle(darkStyle);
    }
  }

  void _generate() async {
    final stringPosition = "geo:${_position.latitude},${_position.longitude}";
    final generated = QRCode.fromData(stringPosition);
    Navigator.pushReplacementNamed(context, "generated", arguments: generated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        leading: const ReturnButton(),
        actions: [
          IconButton(
            icon: const FeatherIcon(FeatherIcons.search),
            onPressed: () {},
            splashRadius: 24,
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kInitial,
            onCameraMove: _onCameraMove,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
          ),
          const Center(
            child: Icon(Icons.location_on_rounded, size: 38, color: Colors.red),
          )
        ],
      ),
      floatingActionButton: FloatingButton(
        icon: SvgPicture.asset(
          "assets/images/logo.svg",
          height: 24,
          width: 24,
        ),
        label: const Text("Generate"),
        onTap: _generate,
      ),
    );
  }
}
