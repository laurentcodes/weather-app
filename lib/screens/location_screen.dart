import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff47bfdf), Color(0xff4a91ff)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 105.0),
                  child: SvgPicture.asset('assets/svg/vector2.svg'),
                ),
                SvgPicture.asset('assets/svg/vector1.svg'),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/back.svg',
                              color: Colors.white,
                            ),
                            const SizedBox(width: 15),
                            const Text('Back', style: headingTextStyle),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 30.0, horizontal: 30.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Here',
                                contentPadding: EdgeInsets.only(
                                    left: 30.0, top: 15.0, bottom: 15.0),
                                // prefixIcon: Icon(Icons.arrow_back),
                                suffixIcon:
                                    Icon(Icons.mic, color: Color(0xff444e72)),
                                hintStyle: buttonTextStyle,
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              style: buttonTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: 220.0, height: 55.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.black),
                                ),
                                child: const Text('Get Weather',
                                    style: buttonTextStyle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
