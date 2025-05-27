import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class ktm extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'model': 'KTM RC 200 GP', 'image': 'assets/ktm/KTM RC 200 GP.jpg'},
    {'model': 'KTM 250 ADVENTURE', 'image': 'assets/ktm/KTM 250 ADVENTURE.jpg'},
    {'model': 'KTM 85 SX', 'image': 'assets/ktm/KTM 85 SX.jpg'},
    {'model': 'KTM 350 EXC-F SIX DAYS', 'image': 'assets/ktm/KTM 350 EXC-F SIX DAYS.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bike Gallery')),
      body: ListView.builder(
        itemCount: bikes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    bikes[index]['image']!,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    color: Colors.black.withOpacity(0.6),
                    child: Text(
                      bikes[index]['model']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ktmmodel(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Row(
                      children: [
                        Text("Explore", style: TextStyle(color: Colors.white)),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class Ktmmodel extends StatefulWidget {
  const Ktmmodel({super.key});


  @override
  State<Ktmmodel> createState() => _KtmmodelState();
}

class _KtmmodelState extends State<Ktmmodel> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(Uri.parse(
          "https://sketchfab.com/models/8c78f1ecf5374c35af851f78f170608d/embed?autostart=1")); // KTM Duke Model
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text("KTM Duke Model"), // Updated Title
        backgroundColor: Colors.black, // Stylish AppBar
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
