import 'package:flutter/material.dart';
import 'package:medwell/Components/Square.dart';
import 'package:medwell/viewmodels/Meds_viewmodel.dart';
import 'package:provider/provider.dart';

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
  late MedsViewModel _medsViewModel;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _medsViewModel = Provider.of<MedsViewModel>(context, listen: false);
    _medsViewModel.getAllMeds();
  }
  @override

  void initState(){

    WidgetsBinding.instance?.addPostFrameCallback((_) {


    });
    refresh();
    super.initState();

  }
  Future<void> refresh()async{
    _medsViewModel.getAllMeds();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MedsViewModel>(
      builder: (context, medsVM, child) {
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 221, 215, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Plan for Today',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      Container(
                        child: Center(
                          child: Image.asset(
                            'assets/images/Health _Flatline 1.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
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
                      itemCount: medsVM.meds.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Square(child: Text(medsVM.meds[index].toString())),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}