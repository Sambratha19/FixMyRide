import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';



class Tvs extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'model': 'GSX-8R', 'image': 'assets/suzuki/suzukiGSX-8R.jpg'},
    {'model': 'HAYABUSA', 'image': 'assets/suzuki/suzukiHAYABUSA.jpg'},
    {'model': 'KATANA', 'image': 'assets/suzuki/suzukiKATANA.jpg'},
    {'model': 'V-STROM 800DE', 'image': 'assets/suzuki/suzukiV-STROM 800DE.jpg'},
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
                          builder: (context) => suzukimodel(),
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


class suzukimodel extends StatefulWidget {
  const suzukimodel({super.key});

  @override
  State<suzukimodel> createState() => _suzukimodelState();
}

class _suzukimodelState extends State<suzukimodel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(title: Text("Suzuki Model")),
      body: Center(
        child: ModelViewer(
          src: "assets/model/Srad 750.glb",  // Path to your 3D model
          alt: "3D Car Model",
          ar: true,  // Enable AR Mode
          autoRotate: true,  // Auto-rotation enabled
          cameraControls: true,  // Enables rotation & zoom gestures
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
