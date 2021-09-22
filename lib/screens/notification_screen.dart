import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({this.message = '', this.conditionIcon = ''});

  String message;
  String conditionIcon;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String weatherMessage = '';
  String weatherIcon = '';

  @override
  void initState() {
    super.initState();

    weatherMessage = widget.message;
    weatherIcon = widget.conditionIcon;

    updateUI(weatherMessage, weatherIcon);
  }

  void updateUI(dynamic message, dynamic conditionIcon) {
    setState(() {
      if (message == null) {
        weatherMessage = 'Nothing to Display';
        weatherIcon = '';
      } else {
        weatherMessage = message;
        weatherIcon = conditionIcon;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(weatherIcon, style: notificationIconTextStyle),
                SizedBox(
                  child: Text(
                    weatherMessage,
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
    );
  }
}
