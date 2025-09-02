// import 'package:flutter/material.dart' hide ImageProvider;
// import 'package:yandex_maps_mapkit_lite/image.dart';
// import 'package:yandex_maps_mapkit_lite/mapkit.dart' hide Image;
// import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
// import 'package:yandex_maps_mapkit_lite/ui_view.dart';
// import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

// class MapWidget extends StatefulWidget {
//   final Point point;
//   final bool shouldShowPin;

//   const MapWidget({super.key, required this.point, this.shouldShowPin = false});

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {
//   MapWindow? _mapWindow;

//   @override
//   void initState() {
//     super.initState();
//     mapkit.onStart();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     mapkit.onStop();
//   }

//   void _onMapCreated(MapWindow mapWindow) {
//     _mapWindow = mapWindow;

//     mapWindow.map.nightModeEnabled = true;
//     // Move the camera
//     mapWindow.map.move(
//       CameraPosition(widget.point, zoom: 16.0, azimuth: 150.0, tilt: 0.0),
//     );
//     if (widget.shouldShowPin) {
//       // Add the placemark immediately
//       mapWindow.map.mapObjects.addPlacemark().setView(
//         ViewProvider(
//           builder:
//               () =>
//                   Image.asset('assets/images/pin.png', height: 100, width: 100),
//         ),
//       );
//       mapWindow.map.mapObjects.addPlacemark()
//         ..geometry = widget.point
//         ..setView(
//           ViewProvider(
//             builder: () {
//               return Image.asset(
//                 'assets/images/pin.png',
//                 height: 100,
//                 width: 100,
//               );
//             },
//           ),
//         );
//     }
//   }

//   final imageProvider = ImageProvider.fromImageProvider(
//     AssetImage('assets/images/pin.png'),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return YandexMap(onMapCreated: _onMapCreated);
//   }
// }
