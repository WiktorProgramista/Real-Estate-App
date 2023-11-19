import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({super.key});

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  Color favoriteIconColor = Colors.white;
  var images = [
    'assets/house1.jpg',
    'assets/house2.jpg',
    'assets/house3.jpg',
    'assets/house4.jpg'
  ];
  var text = 'a' * 200;
  CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Row(
                children: [
                  Text('\$820',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  Text('/month'),
                ],
              ),
              Container(
                width: 160,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black),
                child: const Center(
                  child: Text(
                    'Book now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                carouselController: controller,
                items: images
                    .map(
                      (x) => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(x),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [
                                0.5,
                                1.0
                              ],
                                  colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8)
                              ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customButton(Icons.arrow_back, () {
                                    Navigator.pop(context);
                                  }),
                                  customButton(Icons.favorite_outline, () {
                                    setState(() {
                                      favoriteIconColor =
                                          favoriteIconColor == Colors.white
                                              ? Colors.red
                                              : Colors.white;
                                    });
                                  }),
                                ],
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Vacation Home',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Paris, France',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: height * 0.43,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayCurve: Curves.easeInOut,
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  enlargeCenterPage: true,
                )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    const Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 75,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.jumpToPage(index);
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(images[index]),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        roomOption('4 Bedrooms', Icons.bed),
                        roomOption('2 Bathrooms', Icons.bathroom),
                        roomOption('1 Wifi', Icons.wifi),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      height: 1.0,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(text,
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 18))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(IconData icon, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: Icon(icon,
            color: icon == Icons.favorite_outline
                ? favoriteIconColor
                : Colors.white),
      ),
    );
  }

  Widget roomOption(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        Text(
          text,
        )
      ],
    );
  }
}
