import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopcart_delivery/Locale/locales.dart';
import 'package:shopcart_delivery/OrderMapBloc/order_map_bloc.dart';
import 'package:shopcart_delivery/OrderMapBloc/order_map_state.dart';
import 'package:shopcart_delivery/Pages/drawer.dart';
import 'package:shopcart_delivery/Routes/routes.dart';
import 'package:shopcart_delivery/map_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
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

  bool isOffline = true;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: !isOffline
          ? FloatingActionButton(
              foregroundColor: Colors.white,
              child: Icon(
                Icons.format_list_bulleted,
                size: 28,
              ),
              onPressed: () {
                Navigator.pushNamed(context, PageRoutes.newDeliveryPage);
              })
          : SizedBox.shrink(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            title: FadedScaleAnimation(
              Text(
                isOffline
                    ? locale.youReOffline!.toUpperCase()
                    : locale.youReOnline!.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isOffline = !isOffline;
                      });
                    },
                    child: FadedScaleAnimation(
                      AnimatedContainer(
                        duration: Duration(milliseconds: 250),
                        width: 104,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          isOffline
                              ? locale.goOnline!.toUpperCase()
                              : locale.goOffline!.toUpperCase(),
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: theme.scaffoldBackgroundColor),
                        ),
                        decoration: BoxDecoration(
                          color: isOffline
                              ? theme.primaryColor
                              : Color(0xffff452c),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
      drawer: AccountDrawer(),
      body: Stack(
        children: <Widget>[
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
                setState(() {
                  _markers.add(
                    Marker(
                      markerId: MarkerId('mark1'),
                      position: LatLng(37.42796133580664, -122.085749655962),
                      icon: markerss[0],
                    ),
                  );
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
                });
              },
            );
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: isOffline ? 92 : 0,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildRowChild(theme, '64', locale.orders!),
                  buildRowChild(theme, '68 km', locale.ride!),
                  buildRowChild(theme, '\$302.50', locale.earnings!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Column buildRowChild(ThemeData theme, String text1, String text2,
    {CrossAxisAlignment? alignment}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: alignment ?? CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        text1,
        style:
            theme.textTheme.headline6!.copyWith(color: theme.backgroundColor),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        text2,
        style: theme.textTheme.subtitle2,
      ),
    ],
  );
}
