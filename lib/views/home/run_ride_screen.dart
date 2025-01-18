import 'dart:ui';
import 'package:farego/views/home/cancel_reason_screen.dart';
import 'package:farego/views/home/trip_detail_screen.dart';
import 'package:farego/widget/black_round_button.dart';
import 'package:farego/widget/custom_text_field.dart';
import 'package:farego/widget/gray_liable_colum_box.dart';
import 'package:farego/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:farego/commen/app_colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class RunRideScreen extends StatefulWidget {
  const RunRideScreen({super.key});

  @override
  State<RunRideScreen> createState() => _RunRideScreenState();
}

class _RunRideScreenState extends State<RunRideScreen> with OSMMixinObserver {
  late MapController controller;
  bool isOpen = true;
  int rideStatus = 0;
  bool isComleteRide = false;
  String _getButtonLabel() {
    switch (rideStatus) {
      case 0:
        return "Arrived";
      case 1:
        return "Start";
      case 2:
        return "Complete";

      default:
        return "Unknown";
    }
  }

  void _handleSwipeAction() async {
    switch (rideStatus) {
      case 0:
        // Action for "Arrived"
        rideStatus = 1;
        break;
      case 1:
        rideStatus = 2;
        break;
      case 2:
        rideStatus = 3;
        await showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Toll Amount",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "₹0.0",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      title: "Enter Toll Amount",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    Divider(thickness: 1),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isComleteRide = true;
                            });
                          },
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              isComleteRide = true;
                            });
                          },
                          child: Text("Done"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
        break;
      default:
        break;
    }
  }

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
    if (!isComleteRide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (rideStatus == 1)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
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
                  TimerCountdown(
                    spacerWidth: 0,
                    daysDescription: "",
                    hoursDescription: "",
                    minutesDescription: "",
                    secondsDescription: "",
                    format:
                        CountDownTimerFormat.minutesSeconds, // Changed format
                    enableDescriptions:
                        false, // Disable descriptions since only minutes and seconds are shown
                    timeTextStyle: const TextStyle(
                        fontFeatures: <FontFeature>[
                          FontFeature.tabularFigures(),
                        ],
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                    colonsTextStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    descriptionTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    endTime: DateTime.now().add(Duration(
                        minutes: 4)), // Set your desired countdown time
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Waiting For Rider",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          if (rideStatus == 2)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
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
                  TimerCountdown(
                    spacerWidth: 0,
                    daysDescription: "",
                    hoursDescription: "",
                    minutesDescription: "",
                    secondsDescription: "",
                    format:
                        CountDownTimerFormat.minutesSeconds, // Changed format
                    enableDescriptions:
                        false, // Disable descriptions since only minutes and seconds are shown
                    timeTextStyle: const TextStyle(
                        fontFeatures: <FontFeature>[
                          FontFeature.tabularFigures(),
                        ],
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                    colonsTextStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    descriptionTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    endTime: DateTime.now().add(Duration(
                        minutes: 4)), // Set your desired countdown time
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Waiting for a ride",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          if (rideStatus == 3)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
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
                  TimerCountdown(
                    spacerWidth: 0,
                    daysDescription: "",
                    hoursDescription: "",
                    minutesDescription: "",
                    secondsDescription: "",
                    format:
                        CountDownTimerFormat.minutesSeconds, // Changed format
                    enableDescriptions:
                        false, // Disable descriptions since only minutes and seconds are shown
                    timeTextStyle: const TextStyle(
                        fontFeatures: <FontFeature>[
                          FontFeature.tabularFigures(),
                        ],
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                    colonsTextStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    descriptionTextStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    endTime: DateTime.now().add(Duration(
                        minutes: 4)), // Set your desired countdown time
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Arrived at drop off",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    const SizedBox(height: 30),
                    _buildGrayLiableRow(),
                    const SizedBox(height: 10),
                    if (isOpen)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GrayLiableColumBox(
                            onPressed: () {},
                            icon: Icon(Icons.chat_bubble,
                                color: Colors.green.shade600),
                            title: "Chat",
                            backgroundColor: Colors.green
                                .shade100, // Light green for soft contrast
                          ),
                          GrayLiableColumBox(
                            onPressed: () {},
                            icon: Icon(Icons.chat_outlined,
                                color: Colors.blue.shade700),
                            title: "Message",
                            backgroundColor: Colors.blue.shade100,
                          ),
                          GrayLiableColumBox(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors
                                    .transparent, // Keeps the background transparent
                                context: context,
                                builder: (context) {
                                  return Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      // Blur effect
                                      BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          color: Colors.black.withOpacity(
                                              0.3), // Adds a subtle overlay
                                        ),
                                      ),
                                      // Bottom sheet content
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 15,
                                              offset: Offset(0, -4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 10),
                                            const Text(
                                              "Cancel Rockdean's Trip?",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            BlackRoundButton(
                                              color: Colors.white,
                                              backgroundColor: Colors.red,
                                              title: "Yes, Cancel",
                                              onPressed: () {
                                                context
                                                    .push(CancelReasonScreen());
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                            RoundButton(
                                              title: "No",
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // Close the bottom sheet
                                              },
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon:
                                Icon(Icons.cancel, color: Colors.red.shade600),
                            title: "Cancel",
                            backgroundColor: Colors.red.shade100,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 350, // Adjust the width for the button
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
                                    _getButtonLabel().toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize:
                                          16, // Adjust font size for better visibility
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Handle text overflow
                                  ),
                                  onSwipe: () async {
                                    setState(() {
                                      _handleSwipeAction();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                icon: Image.asset(
                  isOpen
                      ? 'assets/images/arrow-up.png'
                      : 'assets/images/arrow-down.png',
                  width: 20,
                  height: 20,
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
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    Text(
                      "How was your ride?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Vipul Tarur",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade400, width: 1.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingBar.builder(
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
                      ),
                    ),
                    const SizedBox(height: 30),
                    BlackRoundButton(
                      title: 'Rate Ride',
                      onPressed: () {
                        context.push(TripDetailScreen());
                      },
                      backgroundColor: AppColors.accentColor,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
  // _buildTopActionButton();

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
                    "assets/images/my-location.png",
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: const Text(
                      "Rabarivas, Dhundhiyawadi, Palanpur, Gujarat 385001",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          const SizedBox(
            width: 10,
          ),
          Container(
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
              children: [
                Image.asset(
                  "assets/images/distance.png",
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                const Text(
                  "20.3KM",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
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
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/dog.png"),
          ),
          const SizedBox(
            width: 3,
          ),
          Flexible(
            child: Text(
              "Each controller is associated with the stroke color and the",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis, // Adds "..." if text overflows
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          InkWell(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red.shade100,
              child: Icon(
                Icons.call,
                color: Colors.red.shade600,
              ),
            ),
          )
        ],
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
