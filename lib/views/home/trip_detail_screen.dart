import 'package:farego/views/home/cancel_reason_screen.dart';
import 'package:farego/widget/gray_liable_colum_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:farego/commen/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TripDetailScreen extends StatefulWidget {
  const TripDetailScreen({super.key});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen>
    with OSMMixinObserver {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initPosition: GeoPoint(latitude: 24.1730, longitude: 72.4200),
    );
    controller.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trip Details",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  "Help",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: Colors.green,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: _buildPickupPointDetails()),
            const SizedBox(
              height: 5,
            ),
            _buildMap(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  _buildHeaderRow(),
                  Text(
                    "Payment made successfully by Cash",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                Icon(Icons.access_time, color: Colors.black),
                                Text(
                                  "128",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                              Text(
                                "Time",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 16),
                              ),
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(children: [
                                Image.asset(
                                  "assets/images/distance.png",
                                  width: 20,
                                ),
                                Text(
                                  "128",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                              Text(
                                "Distance",
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 16),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date & Time', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              Text('14 Feb’19 at 9:42am', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Service Type', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              Text('Sedan', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Trip Type', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              Text('Normal', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Service Type', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              Text('Sedan', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Divider(height: 32, thickness: 1),
                          _buildGrayLiableRow(),
                          const SizedBox(height: 5,),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: Row(
                children: [
                  Text("RECEIPT",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Trip fares', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text('₹40.45', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('YellowTaxi free ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text('₹40.45', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+Tex', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text('₹40.45', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+Tolls', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text('₹40.45', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text('₹40.45', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+Total Added', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        Text('₹40.45', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Divider(height: 32, thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Payment', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green)),
                        Text('₹40.45', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green)),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

          ],

        ),
      ),
    );
  }

  Widget _buildGrayLiableRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/dog.png"),
          ),
          const SizedBox(
            width: 3,
          ),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(
            width: 3,
          ),
        ],
      ),
    );
  }
  Widget _buildMap() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                enableRotationByGesture: true,
                zoomOption: ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                staticPoints: [],
                roadConfiguration: RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
                showDefaultInfoWindow: false,
              ),
              onMapIsReady: (isReady) {
                if (isReady) {
                  print("map is ready");
                }
              },
              onLocationChanged: (myLocation) {
                print("user location:$myLocation");
              },
              onGeoPointClicked: (myLocation) {
                print("GeoPoint clicked location: $myLocation");
              },
            ),
            // Circle Overlay
          ],
        ),
      ),
    );
  }

  Widget _buildPickupText() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose pick up point",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.mapLineColor3,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: context.width * 0.6,
              height: 2,
              color: AppColors.mapLineColor2,
            ),
            const SizedBox(height: 18),
            Text(
              "Choose drop off point",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconCircle(Color color, {IconData? icon}) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon ?? Icons.circle,
            color: AppColors.mapLineColor3, size: 15),
      ),
    );
  }

  Widget _buildPickupPointDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.mapLineColor1,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.mapLineColor2,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    _buildIconCircle(AppColors.mapLineColor2),
                    Dash(
                      direction: Axis.vertical,
                      length: 35,
                      dashLength: 6,
                      dashGap: 10,
                      dashColor: Colors.grey.shade500,
                    ),
                    _buildIconCircle(Colors.black, icon: Icons.location_on),
                  ],
                ),
                const SizedBox(width: 10),
                _buildPickupText(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.currency_rupee, color: AppColors.accentColor),
            SizedBox(width: 1),
            Text(
              "120.0",
              style: TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w800,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addMarker() async {
    GeoPoint pickupPoint = GeoPoint(latitude: 24.1730, longitude: 72.4200);
    GeoPoint dropoffPoint = GeoPoint(latitude: 24.1738, longitude: 72.4205);

    await controller.setStaticPosition([pickupPoint], "pickup");
    await controller.setStaticPosition([dropoffPoint], "dropoff");

    await controller.setMarkerOfStaticPoint(
      id: "pickup",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/images/carlocation.png",
          width: 50,
          height: 50,
        ),
      ),
    );

    await controller.setMarkerOfStaticPoint(
      id: "dropoff",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/images/manlocation.png",
          width: 50,
          height: 50,
        ),
      ),
    );

    await loadMapRoad(pickupPoint, dropoffPoint);
  }

  Future<void> loadMapRoad(GeoPoint start, GeoPoint end) async {
    await controller.drawRoad(start, end,
        roadType: RoadType.car,
        roadOption: const RoadOption(
            roadColor: AppColors.accentColor,
            roadBorderWidth: 10,
            roadWidth: 10,
            roadBorderColor: AppColors.accentColor));
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
