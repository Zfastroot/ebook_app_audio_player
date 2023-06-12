import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:audio/app_colors.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List popularBooks = [];
  ReadData() {
    DefaultAssetBundle.of(context).loadString("json/popularBooks").then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }

  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.window_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 24,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.add_alert,
                          size: 24,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Popular Books",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -25,
                      right: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.8),

                            itemCount: popularBooks == null?0:popularBooks.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image: AssetImage(popularBooks[i]["img"]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
