import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/Components/Palette.dart';
import 'package:medwell/viewmodels/Profile_viewmodel.dart';
import 'package:provider/provider.dart';

import '../Components/ProfileButton.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;
  Future<void> fetchProfile() async{
    try{
      final response = await profileViewModel.fetchProfile();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      Navigator.of(context).pushNamed("/login");
    }
  }

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
      fetchProfile();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  child: Text( "a"
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text("20y/o.20 days streaks"),
                ),
                SizedBox(
                  height: 50,
                ),
                ProfileButtonWidget(
                  btntitle: 'puja@mail.com',
                  icon: "assets/icons/Mail.png",
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileButtonWidget(
                  btntitle: '2003-09-03',
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
                    onPressed: () {},
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
    );
  }
}
