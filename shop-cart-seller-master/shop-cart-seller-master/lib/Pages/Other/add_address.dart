import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopcart_seller/Components/custom_button.dart';
import 'package:shopcart_seller/Locale/locales.dart';
import 'package:shopcart_seller/OrderMapBloc/order_map_bloc.dart';
import 'package:shopcart_seller/OrderMapBloc/order_map_state.dart';
import 'package:shopcart_seller/map_utils.dart';

class AddAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: AddAddressBody(),
    );
  }
}

class AddAddressBody extends StatefulWidget {
  @override
  _AddAddressBodyState createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.addAddress!),
        actions: [
          MaterialButton(
              onPressed: () {},
              child: Text(
                locale.continueText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
              print('polyyyy' + state.polylines.toString());
              return GoogleMap(
                zoomControlsEnabled: false,
                // polylines: state.polylines,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) async {
                  _mapController.complete(controller);
                  mapStyleController = controller;
                  mapStyleController!.setMapStyle(mapStyle);
                  //   setState(() {
                  //     _markers.add(
                  //       Marker(
                  //         markerId: MarkerId('mark1'),
                  //         position: LatLng(37.42796133580664, -122.085749655962),
                  //         icon: markerss.first,
                  //       ),
                  //     );
                  //     _markers.add(
                  //       Marker(
                  //         markerId: MarkerId('mark2'),
                  //         position: LatLng(37.42496133180663, -122.081743655960),
                  //         icon: markerss[0],
                  //       ),
                  //     );
                  //     _markers.add(
                  //       Marker(
                  //         markerId: MarkerId('mark3'),
                  //         position: LatLng(37.42196183580660, -122.089743655967),
                  //         icon: markerss[0],
                  //       ),
                  //     );
                  //   });
                },
              );
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 22),
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            '1124, Patestine Street, Jackson Tower,\nNear City Garden, New York, USA'),
                      ],
                    ),
                  ),
                  CustomButton(
                    onTap: () {},
                    label: locale.saveAddress,
                  )
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
