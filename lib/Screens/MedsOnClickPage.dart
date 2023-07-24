import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/Components/CustomButton.dart';
import 'package:medwell/models/MedsModel.dart';
import 'package:provider/provider.dart';
import 'package:medwell/Screens/EditMedsPage.dart';

import '../Components/Palette.dart';
import '../viewmodels/Meds_viewmodel.dart';
import 'EditMedsPage.dart';
import 'NavPages.dart';

class MedsOnClick extends StatefulWidget {
  final String data;

  const MedsOnClick({Key? key, required this.data}) : super(key: key);

  @override
  _MedsOnClickState createState() => _MedsOnClickState();
}

class _MedsOnClickState extends State<MedsOnClick> {
  List<MedsModel> medsList = [];
  String medicationId = "";

  @override
  void initState() {
    super.initState();
    _fetchData();
    Provider.of<MedsViewModel>(context, listen: false).getOneMeds(widget.data);
  }

  Future<void> _fetchData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('meds') // Replace 'your_collection' with the actual collection name
          .where('medname', isEqualTo: widget.data)
          .get();

      final meds = snapshot.docs.map((doc) => MedsModel.fromFirebaseSnapshot(doc)).toList();

      if(meds.isNotEmpty){
        setState(() {
          medsList = meds;
          medicationId = meds[0].id.toString();
        });
      }
    } catch (error) {
      // Handle the error
      print('Error fetching data: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    var medsViewModel = Provider.of<MedsViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Image.asset("assets/images/back.png"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NavPages()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: medsList.length,
                itemBuilder: (context, index) {
                  final meds = medsList[index];
                  return ListTile(
                    title: Text(
                      meds.medname ?? '',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${meds.medamount != null ? (meds.medamount!.toInt() == meds.medamount ? meds.medamount!.toInt() : meds.medamount!.toStringAsFixed(1)) : ''} ${meds.medtype ?? ''}',
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                            Text(
                              ' • ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${meds.meddays != null ? (meds.meddays!.toInt() == meds.meddays ? meds.meddays!.toInt().toString() : meds.meddays!.toStringAsFixed(1)) : ''} ${meds.daytype ?? ''}',
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          '${meds.timing ?? ''}',
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            // Add your button onTap logic here
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (meds.notitimes ?? [])
                                  .map(
                                    (time) => Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.notifications,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 118),
                                        Text(
                                          '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(330, 60),
                backgroundColor: Pallete.primary,
                elevation: 8,
              ),
              child: Text(
                "Mark As Taken",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline6,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                print(medsList[0].toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditMedsPage(medication: medsList[0]),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(330, 60),
                backgroundColor: Pallete.primary,
                elevation: 8,
              ),
              child: Text(
                "Edit Medication",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headline6,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () async {
                  if (medicationId.isNotEmpty) {
                    Provider.of<MedsViewModel>(context, listen: false).deleteMeds(medicationId);
                    setState(() {
                      medsList.removeWhere((meds) => meds.id.toString() == medicationId);
                      medicationId = "";
                    });
                    Navigator.pop(context);
                  }

                  // medsViewModel.deleteMeds((medsList[0].id).toString());
                  //   Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 60),
                  backgroundColor: Pallete.primary,
                  elevation: 8,
                ),
                child: Text(
                  "Delete Medication",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
