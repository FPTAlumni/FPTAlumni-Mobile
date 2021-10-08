import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni_alumni/models/event.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: ColorConstants.white,
      ),
      padding: const EdgeInsets.only(
        top: 8,
      ),
      margin: const EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
        right: 25.0,
        left: 25.0,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(
                    right: 8,
                    left: 8,
                  ),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      image: NetworkImage(event.banner),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventName,
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
                              '${DateFormat('dd/MM/yyyy | HH:mm aaa').format(event.startDate)}',
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
                              event.location,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: ColorConstants.primaryAppColor,
            ),
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            alignment: Alignment.center,
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
