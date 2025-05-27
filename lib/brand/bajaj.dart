import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class bajajj extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'model': 'AVENGER 220 STREET', 'image': 'assets/bajaj/AVENGER 220 STREET.jpg'},
    {'model': 'CT125X', 'image':'assets/bajaj/CT125X.jpg'},
    {'model': 'PULSAR N150', 'image':'assets/bajaj/PULSAR N150.jpg'},
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
                          builder: (context) => bajaj(),
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


class bajaj extends StatefulWidget {
  const bajaj({super.key});

  @override
  State<bajaj> createState() => _bajajState();
}

class _bajajState extends State<bajaj> {

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(Uri.parse(
          "https://sketchfab.com/models/99551e910fac4566bb2555700d6d8404/embed?autostart=1")); // Auto-start model
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text("Bajaj Pulsar 150 Model"),
        backgroundColor: Colors.black, // Stylish AppBar
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
