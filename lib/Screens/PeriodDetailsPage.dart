import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PeriodDetails extends StatefulWidget {
  const PeriodDetails({super.key});

  @override
  State<PeriodDetails> createState() => _PeriodDetailsState();
}

class _PeriodDetailsState extends State<PeriodDetails> {
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
                : "Select Date",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildCycleLengthSelector() {
    return DropdownButtonFormField<int>(
      value: _cycleLength,
      hint: Text("Select Cycle Length"),
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
      hint: Text("Select Period Length"),
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
          child: Text(
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
            title: Text("Missing Information"),
            content: Text("Please select all the required inputs."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
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

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Period Tracked"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selected Date: ${_selectedDate.toString().split(' ')[0]}"),
              Text("Cycle Length: $_cycleLength days"),
              Text("Period Length: $_periodLength days"),
              Text(
                  "Next Period Date: ${_nextPeriodDate.toString().split(' ')[0]}"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Period Tracker",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
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
              Text(
                "Next Period Date:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _nextPeriodDate.toString().split(' ')[0],
                style: TextStyle(
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
