import 'package:flutter/material.dart';
import 'package:real_estate_app/home_detail.dart';
import 'package:real_estate_app/login_screen.dart';
import 'package:real_estate_app/map_screen.dart';
import 'package:real_estate_app/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var images = [
    'assets/house1.jpg',
    'assets/house2.jpg',
    'assets/house3.jpg',
    'assets/house4.jpg'
  ];
  int currrentIndex = 0;
  List pages = const [
    HomeScreen(),
    MapScreen(),
    HomeDetail(),
    LoginScreen(),
    RegisterScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileNav(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommended',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.orange.shade900,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 280,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(images[index]))),
                              ),
                              description()
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const Text(
                'New apartments',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                    spreadRadius: 1)
                              ]),
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(images[index]))),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sunny Apartment',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text('Paris, France',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navigationButton(Icons.home, 0, const HomeScreen()),
                  navigationButton(Icons.location_city, 1, const MapScreen()),
                  navigationButton(Icons.shop, 2, const LoginScreen()),
                  navigationButton(Icons.message, 3, const RegisterScreen()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, int index, Widget page) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currrentIndex = index;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(
            icon,
            color: currrentIndex == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}

Widget description() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sunny Apartment',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const Text('Paris, France',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.grey)),
        Row(
          children: [
            Text('\$900',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange.shade900)),
            const Text('/month')
          ],
        ),
      ],
    ),
  );
}

Widget profileNav() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [profileAvatar(), notification()],
  );
}

Widget profileAvatar() {
  return const Row(
    children: [
      CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage('assets/profile.jpg'),
      ),
      SizedBox(
        width: 5.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good morning,',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          Text('Wiktor Oses',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ],
  );
}

Widget notification() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Stack(
      children: [
        const Icon(
          Icons.notifications,
          color: Colors.black,
          size: 30,
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.topRight,
          margin: const EdgeInsets.only(top: 5),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xffc32c37),
                border: Border.all(color: Colors.white, width: 1)),
            child: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  "5",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
