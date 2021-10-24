import 'package:flutter/material.dart';

class GroupChildCard extends StatelessWidget {
  final imgUrl = 'https://encrypted-tbn0.gstatic'
      '.com/images?q=tbn:ANd9GcTUav0-r_Oe3WxyBiWOptWotLxuwpfq4rUwg_v8kC5rLbtGiKiAELp-oAF6PY5eT3DB_SI&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.red,
      ),
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(
        top: 15.0,
        left: 12.0,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.black12,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 5.0,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Group name long long',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
