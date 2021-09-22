import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff84c1f0),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your notification',
                  style: notificationHeadTextStyle,
                ),
                GestureDetector(
                  child: SvgPicture.asset('assets/svg/close.svg'),
                  onTap: () => {
                    Navigator.pop(context),
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svg/sunny_day.svg'),
                  const SizedBox(
                    child: Text(
                      'A sunny day in your location, consider  wearing your UV protection.',
                      style: notificationBodyTextStyle,
                    ),
                    width: 250.0,
                  ),
                  SvgPicture.asset('assets/svg/chevron_down.svg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
