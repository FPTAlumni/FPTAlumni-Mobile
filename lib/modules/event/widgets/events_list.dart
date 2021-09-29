import 'package:flutter/material.dart';
import 'package:uni_alumni/modules/event/widgets/event_card.dart';

class EventsList extends StatelessWidget {
  final String eventUrl =
      'https://media.13newsnow.com/assets/WVEC/images/34af2191-3ac8-4b97-8631'
      '-bbeb6425d04e/34af2191-3ac8-4b97-8631-bbeb6425d04e_1140x641.jpeg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          EventCard(eventUrl: eventUrl),
          EventCard(eventUrl: eventUrl),
        ],
      ),
    );
  }
}
