import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.eventUrl,
  }) : super(key: key);

  final String eventUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 5,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  eventUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Start date: 27/09/2021 8AM',
              style: TextStyle(
                color: ColorConstants.primaryAppColor,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'This is a very very very very long long long long long long '
                'long long long long long long event name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Details',
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    ColorConstants.primaryAppColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    ColorConstants.lightScaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
