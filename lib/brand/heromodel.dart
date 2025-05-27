import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class hero extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'model': 'HARLEY-DAVIDSON X440', 'image': 'assets/hero/HARLEY-DAVIDSON X440.jpg'},
    {'model': 'HERO PASSION++', 'image': 'assets/hero/passionplus.png'},
    {'model': 'SUPER SPLENDOR XTEC', 'image': 'assets/hero/SUPER SPLENDOR XTEC.jpg'},
    {'model': 'XTREME 250R', 'image': 'assets/hero/XTREME 250R.jpg'},
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
                          builder: (context) => Heromodel(),
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


class Heromodel extends StatefulWidget {
  const Heromodel({super.key});

  @override
  State<Heromodel> createState() => _HeromodelState();
}

class _HeromodelState extends State<Heromodel> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(Uri.parse(
          "https://sketchfab.com/models/d77c9013ed194606ab5545ab8dc1105c/embed?autostart=1")); // Auto-start without play button
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text("Hero Super Splendor Model"),
        backgroundColor: Colors.black, // Stylish AppBar
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
