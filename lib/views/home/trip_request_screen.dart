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

  final MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 24.173129263388724, longitude: 72.42048827959617),
  );
  // 24.173129263388724, 72.42048827959617 bus
  // 24.172789740242393, 72.42886203673625 shraddha
  @override
  void initState() {
    super.initState();
    controller = MapController(
        initPosition:
            GeoPoint(latitude: 24.172789740242393, longitude: 72.42886203673625));
    controller.addObserver(this);
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
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
      controller: mapController,
      osmOption: OSMOption(
        enableRotationByGesture: true,
        userTrackingOption: UserTrackingOption(
          enableTracking: true,
          unFollowUser: false,
        ),
        zoomOption: ZoomOption(
          initZoom: 8,
          minZoomLevel: 3,
          maxZoomLevel: 19,
          stepZoom: 1.0,
        ),
        userLocationMarker: UserLocationMaker(
          personMarker: MarkerIcon(
            icon: const Icon(
              Icons.location_history_rounded,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: MarkerIcon(
            icon: const Icon(
              Icons.double_arrow,
              size: 48,
            ),
          ),
        ),
        roadConfiguration: RoadOption(
          roadColor: Colors.yellowAccent,
        ),
      ),
    );
  }

  Widget _buildBottomDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  const SizedBox(height: 30), // Space for the header row
                  _buildGrayLiableRow(),
                  const SizedBox(height: 10),
                  _buildPickupPointDetails(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Wrap each SwipeButton with a SizedBox for width constraint
                            SizedBox(
                              width: 170, // Adjust the width for the button
                              child: SwipeButton(
                                activeTrackColor: Colors.black,
                                activeThumbColor: AppColors.accentColor,
                                thumbPadding: EdgeInsets.all(3),
                                thumb: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                ),
                                elevationThumb: 2,
                                elevationTrack: 2,
                                child: Text(
                                  "Cancel".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize:
                                        16, // Adjust font size for better visibility
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Handle text overflow
                                ),
                                onSwipe: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Swiped"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 170, // Define a fixed width
                              child: SwipeButton(
                                activeTrackColor: Colors.black,
                                activeThumbColor: AppColors.accentColor,
                                thumbPadding: EdgeInsets.all(3),
                                thumb: Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                ),
                                elevationThumb: 2,
                                elevationTrack: 2,
                                child: Text(
                                  "Accept".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onSwipe: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Swiped"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: -20,
              left: 0,
              right: 0,
              child: _buildHeaderRow(),
            ),
          ],
        ),
      ],
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
    return Row(
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
              width: 270,
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
    await controller.setMarkerOfStaticPoint(
      id: "pickup",
      markerIcon: MarkerIcon(
        iconWidget: Icon(Icons.location_on, color: Colors.blueAccent),
      ),
    );
    await controller.setMarkerOfStaticPoint(
      id: "dropoff",
      markerIcon: MarkerIcon(
        iconWidget: Image.asset(
          "assets/images/location.png",
          width: 80,
          height: 80,
        ),
      ),
    );
    // 24.173129263388724, 24.173129263388724 bus
    // 24.172789740242393, 72.42886203673625 shraddha
    await controller.setStaticPosition(
        [GeoPoint(latitude: 24.173129263388724, longitude: 24.173129263388724)],
        "pickup");
    await controller.setStaticPosition(
        [GeoPoint(latitude: 24.172789740242393, longitude: 72.42886203673625)],
        "dropoff");

  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if(isReady){
      addMarker();
    }
  }
}
