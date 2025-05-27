import 'package:login/brand/bajaj.dart';
import 'package:login/brand/bmw.dart';
import 'package:login/brand/heromodel.dart';
import 'package:login/brand/ktm.dart';
import 'package:login/brand/tvs.dart';
import 'package:login/brand/yamaha.dart';
import 'package:login/model1/style.dart';
import 'package:flutter/material.dart';

import '../brand/honda.dart';
import '../brand/royalenfeild.dart';

class Brand extends StatefulWidget {
  const Brand({super.key});

  @override
  State<Brand> createState() => _BrandState();
}

class _BrandState extends State<Brand> {

  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final List<Map<String, String>> brands = [
    {
      'imagePath': royalEnfieldLogo,
      'name': 'ROYAL ENFIELD',
      'route': '/Modelview',//1
    },
    {
      'imagePath': hondaLogo,
      'name': 'HONDA',//2
    },
    // {
    //   'imagePath': suzukiLogo,
    //   'name': 'SUZUKI',//3
    // },
    {
      'imagePath':ktmLogo,
      'name': 'KTM',//4
    },
    {
      'imagePath': heroLogo,
      'name': 'HERO',//5
    },

    {
      'imagePath': bajajLogo,
      'name': 'BAJAJ',//7
    },

    // {
    //   'imagePath': bmwLogo,
    //   'name': 'BMW',//9
    // },
    // {
    //   'imagePath': yamahaLogo,
    //   'name': 'YAMAHA',//10
    // },

  ];

  final List<Color> cardColors = [
    Color(0xFF0C005A),//1
    Color(0xFF9D96CD),//2
    Color(0xFFBBBD75),//3
    Color(0XFFAB978F),//4
    Color(0XFFf4de60),//5
    Color(0XFFAD00FF),//6
    Color(0XFF0FDB89),//7
    Color(0XFF42ADB2),//9
    Color(0XFF234596),//10
    //11
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDCD4BF),
      appBar: AppBar(
        title: Text('Brand Model'), backgroundColor: Color(0xFFDCD4BF),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            brands[_currentPage]['name']!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 400,width: 400,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return BrandCard(
                  imagePath: brands[index]['imagePath']!,
                  cardColor: cardColors[index],
                  onNavigate: () {
                    if (brands[index]['name'] == 'ROYAL ENFIELD') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BikeGallery(), // Navigate to BikeGallery directly
                        ),
                      );
                    } else if (brands[index]['name'] == 'HONDA') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Honda()
                          ),
                      );
                    }else if (brands[index]['name'] == 'BMW') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => bmw()
                        ),
                      );
                    }else if (brands[index]['name'] == 'SUZUKI') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Tvs()
                        ),
                      );
                    }else if (brands[index]['name'] == 'KTM') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ktm()
                        ),
                      );
                    }else if (brands[index]['name'] == 'HERO') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => hero()
                        ),
                      );
                    }else if (brands[index]['name'] == 'YAMAHA') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => yamaha()
                        ),
                      );
                    }else if (brands[index]['name'] == 'BAJAJ') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => bajajj()
                        ),
                      );
                      }else if (brands[index]['route'] != null) {
                      Navigator.pushNamed(context, brands[index]['route']!);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.imagePath,
    required this.cardColor,
    required this.onNavigate,
  });
  final String imagePath;
  final Color cardColor;
  final VoidCallback onNavigate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:200,
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onNavigate,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              backgroundColor: Colors.white, // Button color
            ),
            child: Icon(
              Icons.arrow_forward,
              color: cardColor,
            ),
          ),
        ],
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  final String brandName;

  const DetailScreen({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brandName),
      ),
      body: Center(
        child: Text(
          'Welcome to $brandName details page!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

