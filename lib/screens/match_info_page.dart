import 'package:flutter/material.dart';

import '../constants.dart';

class MatchInfo extends StatefulWidget {
  const MatchInfo({Key? key}) : super(key: key);

  @override
  State<MatchInfo> createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBodyUI(),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Match Info',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
      titleSpacing: 10,
      centerTitle: false,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 27,
        ),
      ),
    );
  }

  Widget _buildBodyUI() {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      color: Colors.black,
      height: _deviceHeight,
      width: _deviceWidth,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMatchDetailsColumn(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _buildTicketsColumn(),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchDetailsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Match Details',
          style: kTitleUserMainListTile,
        ),
        SizedBox(
          height: _deviceHeight * 0.02,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          color: const Color(0xff2D2D2D),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/flag_qat.png',
                height: 32,
                width: 22,
              ),
              SizedBox(
                width: _deviceWidth * 0.015,
              ),
              const Text(
                'QAT',
                style: kTitleUserDetailsListTile,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Vs.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: _deviceWidth * 0.025,
              ),
              const Text(
                'ECU',
                style: kTitleUserDetailsListTile,
              ),
              SizedBox(
                width: _deviceWidth * 0.015,
              ),
              Image.asset(
                'assets/images/flag_qat.png',
                height: 32,
                width: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTicketsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tickets',
          style: kTitleUserMainListTile,
        ),
        SizedBox(
          height: _deviceHeight * 0.02,
        ),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildTicketsDetailsColumn();
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: _deviceHeight * 0.01,
              );
            },
            itemCount: 3)
      ],
    );
  }

  Widget _buildTicketsDetailsColumn() {
    return Column(
      children: [
        Container(
          height: _deviceHeight * 0.12,
          child: Card(
            margin: const EdgeInsets.only(bottom: 2),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            color: const Color(0xff2D2D2D),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Container(
                  width: 34,
                  height: 34,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Image.asset(
                    'assets/images/blank-profile-picture.png',
                    height: 34,
                    width: 34,
                  ),
                ),
                title: const Text(
                  'Marilyn Bridges James',
                  maxLines: 1,
                  style: kTitleUserMainListTile,
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    '#170122708123',
                    style: kSubTitleUserMainListTile,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _deviceHeight * 0.12,
          child: Card(
            margin: const EdgeInsets.only(bottom: 2),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            color: Color(0xff2D2D2D),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10, top: 20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Ticket Type: ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'MATCH Business Seat',
                        style: kDescDialogTS,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _deviceHeight * 0.01,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Seat: ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Block 112 / Row S / Seat 1',
                        style: kDescDialogTS,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
