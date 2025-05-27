
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Honda extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'model': 'H’ness CB350', 'image': 'assets/honda/H’ness CB350.jpg'},
    {'model': 'CB300F', 'image': 'assets/honda/CB300F.jpg'},
    {'model': 'CB300R', 'image': 'assets/honda/CB300R.jpg'},
    {'model': 'CB350', 'image': 'assets/honda/CB350.jpg'},
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
                          builder: (context) => Honda3DViewer(),
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


class Honda3DViewer extends StatefulWidget {
  const Honda3DViewer({super.key});

  @override
  State<Honda3DViewer> createState() => _Honda3DViewerState();
}

class _Honda3DViewerState extends State<Honda3DViewer> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..loadRequest(Uri.parse(
          "https://sketchfab.com/models/2e7cf7bc195044f4a0f60c04581e2691/embed?autostart=1")); // Auto-start model
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: const Text("Honda Shadow RS 2010 Model"),
        backgroundColor: Colors.black, // Stylish AppBar
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
