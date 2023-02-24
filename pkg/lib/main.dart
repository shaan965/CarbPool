import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String username;

  UserProfile({@required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 80,
              child: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  size: 50,
                ),
              ),
            ),
            SizedBox(width: 40),
            Text('Welcome back, $username'),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'View Carbon Stats',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.notifications_active, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'CarbPool User12345 tomorrow in return for his CarnPool',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Recent Trips',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text('User${index + 1}\'s Trip'),
                      subtitle: Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.grey),
                          Icon(Icons.star, size: 16, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MapPage(),
//     );
//   }
// }

// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   GoogleMapController mapController;

//   static final CameraPosition _initialPosition = CameraPosition(
//     target: LatLng(37.7749, -122.4194),
//     zoom: 12,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 120,
//             color: Colors.white,
//             padding: EdgeInsets.all(16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.grey[200],
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'From',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.grey[200],
//                         ),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'To',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: FlatButton(
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.my_location),
//                             SizedBox(width: 8),
//                             Text('Current Location'),
//                           ],
//                         ),
//                         color: Colors.grey[200],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: FlatButton(
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.search),
//                             SizedBox(width: 8),
//                             Text('Search'),
//                           ],
//                         ),
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: (controller) => mapController = controller,
//               initialCameraPosition: _initialPosition,
//               markers: {
//                 Marker(
//                   markerId: MarkerId('marker1'),
//                   position: LatLng(37.7749, -122.4194),
//                   infoWindow: InfoWindow(
//                     title: 'San Francisco',
//                   ),
//                 ),
//               },
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.75,
//             child: RaisedButton(
//               onPressed: () {},
//               child: Text('Cancel'),
//               color: Colors.red,
//               textColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Registration Form',
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Color(0xFF4572E8),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Registration',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Name*',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.person_outline),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Age*',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.calendar_today_outlined),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Address*',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.home_outlined),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number*',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.phone_outlined),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Password*',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.lock_outline),
//                       ),
//                       obscureText: true,
//                     ),
//                     SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Retype Password*',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         prefixIcon: Icon(Icons.lock_outline),
//                       ),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               FractionallySizedBox(
//                 widthFactor: 0.7,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Import License Picture',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.white,
//                     onPrimary: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               FractionallySizedBox(
//                 widthFactor: 0.7,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Color(0xFF4572E8),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 150,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color(0xFF4572E8),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.account_circle,
//                     color: Colors.white,
//                     size: 80,
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Car324',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Brief Description',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 maxLines: 3,
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Checkbox(value: true, onChanged: null),
//                   Text('Approved License'),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Icon(Icons.phone),
//                   SizedBox(width: 10),
//                   Text('555-1234-5678'),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: Text('Send Request to CarbPool'),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   minimumSize: Size(double.infinity, 50),
//                   primary: Color(0xFF4572E8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
