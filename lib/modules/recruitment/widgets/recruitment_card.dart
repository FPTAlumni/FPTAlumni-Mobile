import 'package:flutter/material.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class RecruitmentCard extends StatelessWidget {
  final String url;

  RecruitmentCard(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.white,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.tipColor),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            width: 90,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Google Product Designer',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Google',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 250,
                  child: Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text(
                            '#Software Architecture',
                            textScaleFactor: 3 / 4,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: Chip(
                          backgroundColor: Colors.blue,
                          label: Text(
                            '#Flutter',
                            textScaleFactor: 5 / 6,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
