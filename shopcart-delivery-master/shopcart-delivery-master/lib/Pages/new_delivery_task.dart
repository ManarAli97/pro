import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopcart_delivery/Components/custom_button.dart';
import 'package:shopcart_delivery/Locale/locales.dart';
import 'package:shopcart_delivery/OrderMapBloc/order_map_bloc.dart';
import 'package:shopcart_delivery/OrderMapBloc/order_map_state.dart';
import 'package:shopcart_delivery/Routes/routes.dart';

import '../map_utils.dart';

class NewDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: NewDeliveryBody(),
    );
  }
}

class NewDeliveryBody extends StatefulWidget {
  @override
  _NewDeliveryBodyState createState() => _NewDeliveryBodyState();
}

class _NewDeliveryBodyState extends State<NewDeliveryBody> {
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

  bool acceptDelivery = false;
  bool markAsPicked = false;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(locale.newDeliveryTask!),
          automaticallyImplyLeading: false,
          actions: [
            acceptDelivery
                ? buildCircularButton(
                    context, Icons.shopping_basket, locale.orderInfo!)
                : SizedBox.shrink(),
          ],
        ),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            BlocBuilder<OrderMapBloc, OrderMapState>(builder: (context, state) {
              print('polyyyy' + state.polylines.toString());
              return GoogleMap(
                zoomControlsEnabled: false,
                polylines: state.polylines,
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
                        icon: markerss[1],
                      ),
                    );
                    _markers.add(
                      Marker(
                        markerId: MarkerId('mark2'),
                        position: LatLng(37.42496133180663, -122.081743655960),
                        icon: markerss[1],
                      ),
                    );
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
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Text(
                        locale.distance!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15),
                      ),
                      subtitle: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: '16.5 km ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.green)),
                          TextSpan(
                              text: '(20 min)',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.w300)),
                        ]),
                      ),
                      trailing: acceptDelivery
                          ? buildCircularButton(
                              context, Icons.navigation, locale.direction!)
                          : null,
                    ),
                    Divider(
                      height: 5,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Operum England House',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        '1024, Hemiltone Street, Union Market, USA',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12),
                      ),
                      trailing: acceptDelivery
                          ? Icon(
                              Icons.call,
                              color: Colors.black,
                              size: 18,
                            )
                          : null,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.navigation,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Sam Smith',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        'D-32 Deniel Street, Central Residency, USA',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.popAndPushNamed(
                              context, PageRoutes.orderAcceptedPage);
                        },
                        label: locale.acceptDelivery),
                  ],
                ),
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

Container buildCircularButton(
    BuildContext context, IconData icon, String text) {
  return Container(
//    duration: Duration (seconds: 2),
    width: 120,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).dividerColor,
      border: Border.all(width: 0.2),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.black,
        ),
        Spacer(),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Spacer(),
      ],
    ),
  );
}
