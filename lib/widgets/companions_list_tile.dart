import 'package:flutter/material.dart';
import 'package:task1/models/companion_model.dart';

import '../constants.dart';

class CompanionsListTile extends StatelessWidget {
  Companion companion;
  CompanionsListTile({
    required this.companion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 47,
          height: 47,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/blank-profile-picture.png',
            height: 47,
            width: 47,
          ),
        ),
        const SizedBox(
          width: 26,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companion.name,
              style: kTitleUserDetailsListTile,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                companion.relationShip,
                style: kSubTitleUserDetailsListTile,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
