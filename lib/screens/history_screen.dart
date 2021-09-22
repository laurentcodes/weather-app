import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
        body: Stack(children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 105.0),
              child: SvgPicture.asset('assets/svg/vector2.svg'),
            ),
            SvgPicture.asset('assets/svg/vector1.svg'),
          ]),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
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
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SvgPicture.asset(
                          'assets/svg/settings.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, left: 30.0),
                        child: Text(
                          'Today',
                          style: historyHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text('29°C', style: bodyTextStyle),
                                Text('☀️', style: bodyTextIconStyle),
                                Text('15:00', style: bodyTextStyle),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('29°C', style: bodyTextStyle),
                                Text('☁️', style: bodyTextIconStyle),
                                Text('16:00', style: bodyTextStyle),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('29°C', style: bodyTextStyle),
                                Text('☀️', style: bodyTextIconStyle),
                                Text('17:00', style: bodyTextStyle),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('29°C', style: bodyTextStyle),
                                Text('🌧', style: bodyTextIconStyle),
                                Text('18:00', style: bodyTextStyle),
                              ],
                            ),
                            Column(
                              children: const [
                                Text('29°C', style: bodyTextStyle),
                                Text('☀️', style: bodyTextIconStyle),
                                Text('19:00', style: bodyTextStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, left: 30.0),
                        child: Text(
                          'History - Last 5 Days',
                          style: historyHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 13', style: bodyTextStyle),
                                  Text('🌩', style: bodyTextIconStyle),
                                  Text('21°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 14', style: bodyTextStyle),
                                  Text('🌧', style: bodyTextIconStyle),
                                  Text('22°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 15', style: bodyTextStyle),
                                  Text('☀️', style: bodyTextIconStyle),
                                  Text('34°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 16', style: bodyTextStyle),
                                  Text('☁️', style: bodyTextIconStyle),
                                  Text('27°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('Sep, 17', style: bodyTextStyle),
                                Text('🌫', style: bodyTextIconStyle),
                                Text('32°', style: bodyTextStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
