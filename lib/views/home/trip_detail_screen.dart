import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class TripDetailScreen extends StatefulWidget {
  @override
  _TripDetailScreenState createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  final MapController controller = MapController();

  Widget _buildMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: OSMFlutter(
        controller: controller,
        osmOption: OSMOption(
          enableRotationByGesture: true,
          zoomOption: ZoomOption(
            initZoom: 14,
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
            print("Map is ready");
          }
        },
        onLocationChanged: (myLocation) {
          print("User location: $myLocation");
        },
        onGeoPointClicked: (myLocation) {
          print("GeoPoint clicked location: $myLocation");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Ride Summary'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Top Section: Pickup and Destination
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.my_location, color: Colors.blueAccent),
                    title: Text(
                      'Pickup Point',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('456 Elm Street, Springfield'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_pin, color: Colors.redAccent),
                    title: Text(
                      'Where to?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Office – 739 Main Street, Springfield'),
                  ),
                ],
              ),
            ),
          ),
          // Map Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 200,
              child: _buildMap(),
            ),
          ),
          SizedBox(height: 16.0),
          // Driver Details Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Driver Info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/driver.jpg'), // Replace with actual asset
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Budi Susanto',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Text('Toyota Avanza, Black\nB 1233 YH'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Divider(),
                  // Ride Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Rating'),
                          SizedBox(height: 8.0),
                          Row(
                            children: List.generate(
                              5,
                                  (index) => Icon(Icons.star, color: Colors.amber),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Payment Method'),
                          SizedBox(height: 8.0),
                          Text('e-Wallet'),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Travel Duration'),
                          SizedBox(height: 8.0),
                          Text('30 Minutes'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // Fare Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ride Fare: \$14.00',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Discount: --'),
                      Text(
                        'Total Fare: \$4.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  // Feedback
                  Text(
                    'Feedback',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Driver was friendly, and the ride was smooth.',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
