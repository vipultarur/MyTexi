import 'package:farego/views/home/run_ride_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:farego/commen/app_colors.dart';
import 'package:farego/widget/gray_liable_box.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class TripRequestScreen extends StatefulWidget {
  const TripRequestScreen({super.key});

  @override
  State<TripRequestScreen> createState() => _TripRequestScreenState();
}

class _TripRequestScreenState extends State<TripRequestScreen>
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
      body: Stack(
        children: [
          _buildMap(), // Map at the bottom
          _buildTopActionButton(), // Top button over the map
          _buildBottomDetails(), // Bottom details container
        ],
      ),
    );
  }

  Widget _buildMap() {
    return OSMFlutter(
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
          print("map is redy");
        }
      },
      onLocationChanged: (myLocation) {
        print("user location:$myLocation");
      },
      onGeoPointClicked: (myLocation) {
        print("GeoPointclicked location: $myLocation");
      },
    );
  }

  Widget _buildBottomDetails() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, // Dynamic horizontal padding
                    vertical: screenHeight * 0.015, // Dynamic vertical padding
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: screenHeight * 0.03), // Space for header row
                      _buildGrayLiableRow(),
                      SizedBox(height: screenHeight * 0.02),
                      _buildPickupPointDetails(),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Responsive SwipeButton 1
                                SizedBox(
                                  width: screenWidth * 0.4, // Adjust to 40% width
                                  child: SwipeButton(
                                    activeTrackColor: Colors.black,
                                    activeThumbColor: AppColors.accentColor,
                                    thumbPadding: EdgeInsets.all(
                                      screenWidth * 0.01,
                                    ), // Responsive thumb padding
                                    thumb: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      size: screenWidth * 0.05, // Responsive icon
                                    ),
                                    elevationThumb: 2,
                                    elevationTrack: 2,
                                    child: Text(
                                      "Cancel".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: screenWidth * 0.04, // Font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onSwipe: () {
                                      context.pop();
                                    },
                                  ),
                                ),
                                // Responsive SwipeButton 2
                                SizedBox(
                                  width: screenWidth * 0.4,
                                  child: SwipeButton(
                                    activeTrackColor: Colors.black,
                                    activeThumbColor: AppColors.accentColor,
                                    thumbPadding: EdgeInsets.all(
                                      screenWidth * 0.01,
                                    ), // Responsive thumb padding
                                    thumb: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      size: screenWidth * 0.05, // Responsive icon
                                    ),
                                    elevationThumb: 2,
                                    elevationTrack: 2,
                                    child: Text(
                                      "Accept".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.04, // Font size
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onSwipe: () {
                                      context.push(const RunRideScreen());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -screenHeight * 0.03, // Responsive positioning
                  left: 0,
                  right: 0,
                  child: _buildHeaderRow(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }


  Widget _buildTopActionButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Align(
          alignment: Alignment.topCenter,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/cancel.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "No Thanks",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.access_time, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "20Min",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrayLiableRow() {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        GrayLiableBox(
          icon: Icons.attach_money,
          title: "\$20.5",
          iconColor: Colors.grey,
          backgroundColor: Colors.black12,
        ),
        GrayLiableBox(
          icon: Icons.location_on,
          title: "20KM",
          iconColor: Colors.grey,
          backgroundColor: Colors.black12,
        ),
        GrayLiableBox(
          icon: Icons.star,
          title: "3.5",
          iconColor: Colors.grey,
          backgroundColor: Colors.black12,
        ),
      ],
    );
  }

  Widget _buildPickupPointDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.mapLineColor1,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.mapLineColor2,
                width: 2,
              ),
            ),
            child:
            Row(
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
              width: context.width*0.6,
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

  void addMarker() async {
    GeoPoint pickupPoint = GeoPoint(latitude: 24.1730, longitude: 72.4200);
    GeoPoint dropoffPoint = GeoPoint(latitude: 24.1738, longitude: 72.4205);

    await controller.setStaticPosition([pickupPoint], "pickup");
    await controller.setStaticPosition([dropoffPoint], "dropoff");

    await controller.setMarkerOfStaticPoint(
      id: "pickup",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset("assets/images/carlocation.png",width: 50,height: 50,),
      ),
    );

    await controller.setMarkerOfStaticPoint(
      id: "dropoff",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset("assets/images/manlocation.png",width: 50,height: 50,),
      ),
    );

    await loadMapRoad(pickupPoint, dropoffPoint);
  }

  Future<void> loadMapRoad(GeoPoint start, GeoPoint end) async {
    await controller.drawRoad(start, end,
        roadType: RoadType.car,
        roadOption:
            const RoadOption(roadColor: AppColors.accentColor, roadBorderWidth: 10,roadWidth: 10,roadBorderColor: AppColors.accentColor));
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      addMarker();
    }
  }
}
