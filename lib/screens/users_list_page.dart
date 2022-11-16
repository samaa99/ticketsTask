import 'package:flutter/material.dart';
import 'package:task1/screens/user_details_page.dart';

import '../models/user_model.dart';
import '../widgets/user_card.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<User> users = [];

  // Future<void> _getUsers() async {
  //   users = await getUsers.getAllUsers();
  // }

  @override
  void initState() {
    super.initState();
    // _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      title: const Text(
        'Ticket Delivery',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      titleSpacing: 25,
      centerTitle: false,
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        OutlinedButton(
            onPressed: () {},
            child: Image.asset(
              'assets/images/img.png',
              height: 25,
              width: 20,
            ))
      ],
    );
  }

  Widget _buildUI() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildSearchTF(),
          _buildGuestsListView(),
        ],
      ),
    );
  }

  Widget _buildSearchTF() {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: const [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search guests',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestsListView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GestureDetector(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return UserCardListWidget(
                    // user: users[1],
                    );
              }),
          onTap: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) => const UserDetails());
          },
        ),
      ),
    );
  }
}
