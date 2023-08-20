import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallServices extends StatefulWidget {
  const CallServices({Key? key}) : super(key: key);

  @override
  State<CallServices> createState() => _CallServicesState();
}

class _CallServicesState extends State<CallServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Call Center',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/png/right.png'),
                          height: 60,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Save Children',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Nigerian Agency',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {
                          launch("tel:+234 7042973460");
                          print('clicked me');

                        },
                        icon: Icon(Icons.call),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Image(
                          image: AssetImage('assets/png/human.png'),
                          height: 60,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The national human rights commission of children',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Nigerian Agency',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.call),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Image(

                          image: AssetImage('assets/png/info.png'),
                          height: 60,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Save Children',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Nigerian Agency',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {
                          launch("tel:+234 7042973460");
                          print('clicked me');

                        },
                        icon: Icon(Icons.call),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Image(

                          image: AssetImage('assets/png/info.png'),
                          height: 60,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Save Children',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Nigerian Agency',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {
                          launch("tel:+234 7042973460");
                          print('clicked me');

                        },
                        icon: Icon(Icons.call),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                     children: [
                       const Image(

                         image: AssetImage('assets/png/info.png'),
                         height: 60,
                       ),
                       const SizedBox(
                         width: 5,
                       ),
                       const Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Save Children',
                             style: TextStyle(fontWeight: FontWeight.w500),
                           ),
                           Text(
                             'Nigerian Agency',
                             style: TextStyle(color: Colors.grey),
                           ),
                         ],
                       ),
                     ],
                   ),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: const Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {
                          launch("tel://+234 7042973460");
                          print('clicked me');

                        },
                        icon: Icon(Icons.call),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
