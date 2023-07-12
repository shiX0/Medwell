import 'package:flutter/material.dart';
import 'package:medwell/Components/Square.dart';

class UserModel {
  final String name;

  UserModel(this.name);
}

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List meds = [
    'med1',
    'med2',
    'med3',
    'med4',
    'med5',
  ];

  UserModel user = UserModel('PUJA');

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              getGreeting(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              user.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical:40),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 215, 255),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    'Your Plan for Today',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  Center(
                    child: Image.asset('assets/images/Health _Flatline 1.png',
                      width: 10,
                      height: 10,
                      fit: BoxFit.contain,
                    ),
                  ),


                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Daily Review',
            style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 300,
                width: 800,
                child: ListView.builder(
                  itemCount: meds.length,
                  itemBuilder: (context, index) {
                    return Square(
                      child: meds[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}