import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_app/utilities/constants.dart';

import '../screens/location_info_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String cityName = '';

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
                  padding: EdgeInsets.only(top: 105.h),
                  child: SvgPicture.asset('assets/svg/vector2.svg'),
                ),
                SvgPicture.asset('assets/svg/vector1.svg'),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 30.h,
                              horizontal: 30.w,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Here',
                                contentPadding: EdgeInsets.only(
                                    left: 30.w, top: 15.h, bottom: 15.h),
                                // prefixIcon: Icon(Icons.arrow_back),
                                suffixIcon: const Icon(Icons.mic,
                                    color: Color(0xff444e72)),
                                hintStyle: buttonTextStyle,
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.w),
                                ),
                              ),
                              style: buttonTextStyle,
                              onChanged: (String value) {
                                cityName = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 230.w, height: 60.h),
                              child: ElevatedButton(
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
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                  ),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.black),
                                ),
                                child: const Text(
                                  'Get Weather',
                                  style: buttonTextStyle,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LocationInfoScreen(
                                        city: cityName,
                                      ),
                                    ),
                                  );
                                },
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
