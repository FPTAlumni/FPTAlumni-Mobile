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
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        right: 7,
        left: 7,
      ),
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
        right: 25.0,
        left: 25.0,
      ),
      color: ColorConstants.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: NetworkImage(eventUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Macklemore & Ryan Lewis',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_alarm,
                              size: 14,
                              color: Colors.grey,
                            ),
                            Text(
                              '30/09/2021 | 10AM',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey,
                            ),
                            Text(
                              'FPT University',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                // fontStyle: FontStyle.italic,
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
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Spacer(),
                TextButton(
                  child: Text('Register'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        ColorConstants.primaryAppColor),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
