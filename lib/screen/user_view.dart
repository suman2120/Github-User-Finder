import 'package:api2/models/github_user_model.dart';
import 'package:api2/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final TextEditingController _searchController = TextEditingController();
  String nameofuser = 'suman2120';
  GitHubUser currentUser = GitHubUser();

  getUserData(String userName) async {
    currentUser = await ApiService().getGithubUserData(userName);

    setState(() {});
  }

  @override
  void initState() {
    getUserData(nameofuser);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 32, 48, 62),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 90,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'devfinder',
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'L I G H T',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: SvgPicture.asset(
                              'asset/sun.svg',
                              height: 25,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 53, 89, 119),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(style: TextStyle(color: Colors.white,fontSize: 25),
                        controller: _searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search GitHub username...',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 25),
                            suffixIcon: ElevatedButton(
                                onPressed: () {
                                  getUserData(_searchController.text);
                                  _searchController.clear();
                                },
                                child: Text('Search')),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.blue,
                              size: 35,
                            )),
                      ),
                    ),
                  ),
                ),
                currentUser.username == null
                    ? CircularProgressIndicator()
                    : Container(
                        height: MediaQuery.of(context).size.height / 1.7,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 53, 89, 119),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 30),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(currentUser.avatar!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentUser.username!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          currentUser.id!,
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 194, 202, 208),
                                              fontSize: 25),
                                        ),
                                        Text(
                                          'Joined ${currentUser.joindate!}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 224, 224, 224),
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 30),
                              child: Text(
                                currentUser.bio ?? '',
                                style: TextStyle(fontSize: 25,color: Color.fromARGB(255, 237, 229, 229)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 30),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 1.4,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 8, 45, 74),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Repos',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          currentUser.repos!,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Followers',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          currentUser.followers!,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Following',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          currentUser.following!,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text('${currentUser.location}',
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.link,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                              currentUser.blog ?? 'Not Available',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.twitter,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text('${currentUser.twitter}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.envelope,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text('${currentUser.email}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
