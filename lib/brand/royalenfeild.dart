import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BikeGallery extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'model': 'Scram 440', 'image': 'assets/ef/motorcycle-listing.jpg'},
    {'model': 'Goan Classic 350', 'image': 'assets/ef/goan-classic-350-motorcycle-new.jpg'},
    {'model': 'Bear 650', 'image': 'assets/ef/bear-650-motorcycles.jpg'},
    {'model': 'Shotgun 650', 'image': 'assets/ef/shotgun-650-motorcycle-listing.jpg'},
    {'model': 'Guerrilla 450', 'image': 'assets/ef/guerrilla_450_motorcycle.jpg'},
    // Add more bike models and images as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Gallery'),
      ),
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
                    color: Colors.black.withOpacity(0.6), // Semi-transparent black background
                    child: Text(
                      bikes[index]['model']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40, // Increased font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to bike details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> ModelViewScreen()),
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


class ModelViewScreen extends StatefulWidget {
  const ModelViewScreen({super.key});

  @override
  State<ModelViewScreen> createState() => _ModelViewScreenState();
}

class _ModelViewScreenState extends State<ModelViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(Uri.parse(
          "https://sketchfab.com/models/c501b415fe494cfca1bf03be420249cb/embed?autostart=1"));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text("Royal Enfield Model"),
        backgroundColor: Colors.black, // Stylish AppBar
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

