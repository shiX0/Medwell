import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/Palette.dart';
import 'package:medwell/services/firebase_service.dart';
import 'package:medwell/viewmodels/Auth_viewmodel.dart';
import 'package:provider/provider.dart';

import '../Components/ProfileButton.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late AuthViewModel _authViewModel;

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      _authViewModel.checkLogin();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (context, authVM, child) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                  ),
                  actions: [
                    Image.asset(
                      "assets/icons/setting.png",
                    )
                  ],
                ),
                body: SafeArea(
                  child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffd9d9d9),
                              ),
                              margin: EdgeInsets.only(top: 10),
                              height: 90,
                              width: 90,
                            ),
                            Positioned(
                              top: 60,
                              left: 60,
                              child: Container(

                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xff79d3df),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.edit,
                                        size: 20,
                                      ),
                                    ),
                                  )),
                            )
                          ]),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text("${authVM.loggedInUser!.firstName}  ${authVM.loggedInUser!.lastName}"
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(authVM.loggedInUser!.dob.split(' ')[0]),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ProfileButtonWidget(
                            btntitle: authVM.loggedInUser!.email,
                            icon: "assets/icons/Mail.png",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ProfileButtonWidget(
                            btntitle: authVM.loggedInUser!.dob,
                            icon: "assets/icons/date.png",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ProfileButtonWidget(
                            btntitle: 'Change details',
                            icon: "assets/icons/Vector.png",
                            width: 115,
                            suffixIcon: Icons.arrow_forward_ios,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ProfileButtonWidget(
                            btntitle: 'Change password',
                            icon: "assets/icons/password.png",
                            width: 90,
                            suffixIcon: Icons.arrow_forward_ios,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showAlertDialog(context, _authViewModel.logout());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 2,
                                shadowColor: const Color(0xfff8f8f6),
                                primary: const Color(0xfff8f8f6),
                              ),
                              child: Container(
                                  height: 60,
                                  width: 350,
                                  alignment: Alignment.center,
                                  child: Text("Log out",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          height: 1.25,
                                          letterSpacing: -0.16,
                                          color: Color(0xffff4747),
                                        ),
                                      )))),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          );
        }
    );
  }
}
showAlertDialog(BuildContext context,Future<void> avm) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget continueButton = TextButton(
    child: Text("logout"),
    onPressed:  () {avm;
    Navigator.of(context).pushReplacementNamed("/login");},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Log out!"),
    content: Text("Would you like to really log out?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}