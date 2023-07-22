import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medwell/models/PeriodModel.dart';
import 'package:medwell/services/firebase_service.dart';
import 'package:medwell/viewmodels/Period_viewmodel.dart';
import 'package:provider/provider.dart';

class PeriodDetails extends StatefulWidget {
  const PeriodDetails({super.key});

  @override
  State<PeriodDetails> createState() => _PeriodDetailsState();
}

class _PeriodDetailsState extends State<PeriodDetails> {
  final _auth = FirebaseService.firebaseAuth;
  late PeriodViewModel _periodViewModel;
  @override
  void initState() {
    _periodViewModel = Provider.of<PeriodViewModel>(context, listen: false);
    _periodViewModel.getPeriodData();
    PeriodModel? period=_periodViewModel.periodDetails;
    if (period?.userId != null) {
      Navigator.of(context).pushNamed("/profile");
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_periodViewModel.user!.uid),
        backgroundColor: Colors.red,
      ));
    }
    super.initState();
  }

  DateTime? _selectedDate;
  int? _cycleLength;
  int? _periodLength;
  DateTime? _nextPeriodDate;
  IconData? selectedIcon;
  IconData? selectedIconMood;
  IconData? selectedIconCharacter;
  Color? selectedColor;
  Color? selectedColorMood;
  Color? selectedColorCharacter;

  Widget _buildDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ).then((selectedDate) {
              if (selectedDate != null) {
                setState(() {
                  _selectedDate = selectedDate;
                });
              }
            });
          },
          child: Text(
            _selectedDate != null
                ? "Selected Date: ${_selectedDate.toString().split(' ')[0]}"
                : "Select last Period Pate",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildCycleLengthSelector() {
    return DropdownButtonFormField<int>(
      value: _cycleLength,
      hint: const Text("Select Cycle Length"),
      items: List.generate(30, (index) {
        int cycle = index + 21;
        return DropdownMenuItem<int>(
          value: cycle,
          child: Text("$cycle days"),
        );
      }),
      onChanged: (value) {
        setState(() {
          _cycleLength = value;
        });
      },
    );
  }

  Widget _buildPeriodLengthSelector() {
    return DropdownButtonFormField<int>(
      value: _periodLength,
      hint: const Text("Select Period Length"),
      items: List.generate(8, (index) {
        int period = index + 1;
        return DropdownMenuItem<int>(
          value: period,
          child: Text("$period days"),
        );
      }),
      onChanged: (value) {
        setState(() {
          _periodLength = value;
        });
      },
    );
  }

  Widget _buildTrackButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            _trackPeriod();
          },
          child: const Text(
            "Track Period",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  void _trackPeriod() {
    if (_selectedDate == null ||
        _cycleLength == null ||
        _periodLength == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Loading"),
            content: const Text("Please select all the required inputs."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    _nextPeriodDate = _selectedDate!.add(Duration(days: _cycleLength!));
    // _selectedDate.toString().split(' ')[0]}"
    //add period data
    try {
      PeriodModel periodModel = PeriodModel(
          selectDate: _selectedDate.toString(),
          cycleLength: _cycleLength,
          periodLength: _periodLength,
          currentCycle: "1",
          nextPeriod: _nextPeriodDate.toString(),
          userId: _auth.currentUser?.uid);
      _periodViewModel.addPeriodData(periodModel).then((value) =>
      Navigator.of(context).pushNamed("/profile")
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Period Tracker",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildDateSelector(),
            const SizedBox(height: 32),
            _buildCycleLengthSelector(),
            const SizedBox(height: 32),
            _buildPeriodLengthSelector(),
            const SizedBox(height: 32),
            _buildTrackButton(),
            const SizedBox(height: 32),
            if (_nextPeriodDate != null) ...[
              const Text(
                "Next Period Date:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _nextPeriodDate.toString().split(' ')[0],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
