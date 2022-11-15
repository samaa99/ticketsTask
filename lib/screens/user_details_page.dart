// import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:task1/models/companion_model.dart';
import 'package:task1/models/match_model.dart';
import '../constants.dart';
import '../models/user_model.dart';
import '../widgets/companions_list_tile.dart';
import 'match_info_page.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late double _deviceHeight;
  late double _deviceWidth;
  TextEditingController _notesTextEditingController = TextEditingController();
  String note = '';
  List<MatchModel> matches = [];
  List<Companion> companions = [];
  User user = User(
    name: 'Brooklyn Merrylin Simmons',
    title: 'US Senitor | USA - P',
    img: '',
  );

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: SolidBottomSheet(
          maxHeight: _deviceHeight * 0.9,
          minHeight: _deviceHeight * 0.7,
          body: _buildBodyUI(),
          headerBar: _buildHeader(),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Image.asset('assets/images/sheet_rec.png');
  }

  Widget _buildBodyUI() {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: _deviceWidth,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfoColumn(),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              _notesTextEditingController.text != ''
                  ? _handedMatchTicketsInfo()
                  : _buildMatchTicketsInfoColumn(),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              Container(
                color: const Color(0xff4C4C4C),
                height: _deviceHeight * 0.002,
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _companionsColumn(),
              Container(
                color: const Color(0xff4C4C4C),
                height: _deviceHeight * 0.002,
              ),
              _matchesInfoColumn(),
              Container(
                color: const Color(0xff4C4C4C),
                height: _deviceHeight * 0.002,
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _destinationInfoColumn(),
              // _handedMatchTicketsInfo(),
              SizedBox(
                height: _deviceHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoColumn() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
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
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          Text(
            user.name,
            style: kTitleUserMainListTile,
          ),
          SizedBox(
            height: _deviceHeight * 0.017,
          ),
          Text(
            user.title,
            style: kTitleUserDetailsPage,
          ),
        ],
      ),
    );
  }

  Widget _buildMatchTicketsInfoColumn() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _deviceHeight * 0.02,
        ),
        const Text(
          'Match Tickets',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xff9A9A9A),
          ),
        ),
        SizedBox(
          height: _deviceHeight * 0.015,
        ),
        const Text(
          'Tickets are still being processed',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: _deviceHeight * 0.025,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return _showDialog();
                });
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                vertical: _deviceHeight * 0.02,
                horizontal: _deviceWidth * 0.25,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff1E1E1E),
            ),
          ),
          child: const Text(
            'Confirm Ticket Delivery',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffFFFFFF)),
          ),
        )
      ],
    );
  }

  Widget _companionsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Companions',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff9A9A9A),
          ),
        ),
        SizedBox(
          height: _deviceHeight * 0.015,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            for (int i = 0; i <= 2; i++) {
              companions.add(Companion(
                  name: 'James Black', relationShip: 'Child', img: ''));
            }
            return CompanionsListTile(
              companion: companions[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: _deviceHeight * 0.02,
            );
          },
        ),
      ],
    );
  }

  Widget _matchesInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _deviceHeight * 0.03,
        ),
        const Text(
          'Match Tickets',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xff9A9A9A),
          ),
        ),
        SizedBox(
          height: _deviceHeight * 0.015,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            for (int i = 0; i <= 3; i++) {
              matches.add(
                MatchModel(
                    firstTeamName: 'QAT',
                    firstTeamImg: '',
                    secondTeamName: 'ECU',
                    secondTeamImg: '',
                    ticketsNum: '5'),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.info_outline,
                    color: Color(0xff9A9A9A),
                    size: 22,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MatchInfo()));
                  },
                ),
                SizedBox(
                  width: _deviceWidth * 0.1,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/flag_qat.png',
                      height: 32,
                      width: 22,
                    ),
                    SizedBox(
                      width: _deviceWidth * 0.015,
                    ),
                    Text(
                      matches[index].firstTeamName,
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
                    Text(
                      matches[index].secondTeamName,
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
                SizedBox(
                  width: _deviceWidth * 0.1,
                ),
                Text(
                  '${matches[index].ticketsNum} Tickets',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: _deviceHeight * 0.02,
            );
          },
        ),
      ],
    );
  }

  Widget _destinationInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Destinations',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff9A9A9A),
          ),
        ),
        SizedBox(
          height: _deviceHeight * 0.025,
        ),
        const Text(
          'Presedential Wing',
          style: kTitleUserDetailsListTile,
        ),
        SizedBox(
          height: _deviceHeight * 0.007,
        ),
        const Text(
          'Marriot Hotel',
          style: kSubTitleUserDetailsListTile,
        ),
        SizedBox(
          height: _deviceHeight * 0.025,
        ),
        const Text(
          'Room Number',
          style: kTitleUserDetailsListTile,
        ),
        SizedBox(
          height: _deviceHeight * 0.007,
        ),
        const Text(
          '52',
          style: kSubTitleUserDetailsListTile,
        ),
      ],
    );
  }

  Widget _showDialog() {
    return Dialog(
      backgroundColor: const Color(0xff2D2D2D),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Are You Sure?',
              style: kQuestionDialogTS,
            ),
            SizedBox(
              height: _deviceHeight * 0.01,
            ),
            const Text(
              'By continuing you confirm and are sure that the guest received all tickets issued for them and their companions.',
              style: kDescDialogTS,
            ),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            Container(
              color: const Color(0xff4C4C4C),
              height: _deviceHeight * 0.002,
            ),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            const Text(
              'Addional Notes',
              style: kTitleUserDetailsListTile,
            ),
            SizedBox(
              height: _deviceHeight * 0.01,
            ),
            TextField(
              controller: _notesTextEditingController,
              onChanged: (value) {
                setState(() {
                  note = value;
                });
              },
              maxLines: 3,
              style: const TextStyle(
                color: Colors.white,
              ),
              cursorColor: const Color(0xff4C4C4C),
              decoration: const InputDecoration(
                // contentPadding:
                //     EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                hintText: 'Start Typing ...',
                hintStyle: kSubTitleUserDetailsListTile,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xff4C4C4C),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xff4C4C4C),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _notesTextEditingController.text = '';
                    });
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.white),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _notesTextEditingController.text = ' ';
                    });
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: Colors.white),
                    backgroundColor: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _handedMatchTicketsInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Match Tickets',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff9A9A9A),
                  ),
                ),
                SizedBox(
                  height: _deviceHeight * 0.01,
                ),
                const Text(
                  'Handed to guests',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Image.asset('assets/images/done_circle.png'),
          ],
        ),
        SizedBox(
          height: _deviceHeight * 0.025,
        ),
        note != ''
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff9A9A9A),
                    ),
                  ),
                  SizedBox(
                    height: _deviceHeight * 0.01,
                  ),
                  Container(
                    width: _deviceWidth,
                    color: const Color(0xff2D2D2D),
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      note,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffEEEEEE),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
