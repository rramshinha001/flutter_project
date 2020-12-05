import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget imageSliderCarousel = Container(
      height: 200,
      child: Carousel(
        images: [
          AssetImage('img/1.jpeg'),
          AssetImage('img/2.jpg'),
          AssetImage('img/3.jpeg'),
          AssetImage('img/4.jpg'),
        ],
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home '),
          elevation: 1.0,
          backgroundColor: Colors.purple,
        ),
        body: ListView(
          children: [
            imageSliderCarousel,
            Container(height: 40.0),
            Container(
              child: Column(
                children: [
                  Text('Info Update', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('img/1.jpeg'),
                          ),                          
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('75 Tahun Kemerdekaan Republik Indonesia', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('img/2.jpg'),
                          ),                          
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Musyawarah Rencana Bersama Membangun Desa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('img/3.jpeg'),
                          ),                          
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Edukasi Protokol Kesehatan Covid-19 ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('img/4.jpg'),
                          ),                          
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Gotong Royong Kebersihan Linkungan Desa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
