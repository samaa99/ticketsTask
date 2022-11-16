import 'package:flutter/material.dart';

import '../constants.dart';

class UserCardListWidget extends StatelessWidget {
  UserCardListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 5),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: Container(
            width: 52,
            height: 52,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/blank-profile-picture.png',
              height: 100,
              width: 100,
            ),
          ),
          title: const Text(
            'Brooklyn Merrylin Simmons Simmons',
            maxLines: 1,
            style: kTitleUserMainListTile,
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'US Senitor | USA - P',
              style: kSubTitleUserMainListTile,
            ),
          ),
        ),
      ),
    );
  }
}
