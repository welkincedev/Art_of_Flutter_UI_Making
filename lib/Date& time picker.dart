import 'package:flutter/material.dart';

class DateTimeSlider extends StatefulWidget {
  @override
  State<DateTimeSlider> createState() => _DateTimeSliderState();
}

class _DateTimeSliderState extends State<DateTimeSlider> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  double volumeValue = 0;
  double brightnessValue = 0;
  double temperatureValue = 18;
  double priceValue = 230;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Select Date", style: TextStyle(fontSize: 12)),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1930),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() => selectedDate = picked);
                }
              },
              child: Text(
                '📅 ${selectedDate.toLocal().toString().split(' ')[0]}',
              ),
            ),
            SizedBox(height: 10),

            Text(
              'Selected Date : ${selectedDate.toLocal().toString().split(
                  ' ')[0]} ',
            ),

            SizedBox(height: 20),

            Text("Select Time", style: TextStyle(fontSize: 12)),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                );
                if (picked != null) {
                  setState(() => selectedTime = picked);
                }
              },
              child: Text(
                '📅 ${selectedTime.format(context)}',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: 10),
            Text('Selected Time : ${selectedTime.format(context)} '),

            SizedBox(height: 20),

            /// Sliders
            Text(
              "Volume Slider",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.volume_mute, color: Colors.red),
                Expanded(
                  child: Slider(
                    value: volumeValue,
                    min: 0,
                    max: 100,
                    onChanged: (value) => setState(() => volumeValue = value),
                  ),
                ),
                Icon(Icons.volume_up, color: Colors.red),
                SizedBox(height: 8),
                Text("${volumeValue.toStringAsFixed(0)}%"),
              ],
            ),

            Text(
              "Brightness Slider",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.brightness_5, color: Colors.green),
                Expanded(
                  child: Slider(
                    value: brightnessValue,
                    min: 0,
                    max: 100,
                    onChanged: (value) =>
                        setState(() => brightnessValue = value),
                  ),
                ),
                Icon(Icons.brightness_7, color: Colors.green),
                SizedBox(height: 8),
                Text("${brightnessValue.toStringAsFixed(0)}%"),
              ],
            ),
            SizedBox(height: 20),
            Text("Temprature Slider"),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: temperatureValue,
                    min: 18,
                    max: 30,
                    divisions: 7,
                    label: "${temperatureValue.toStringAsFixed(1)}^C",
                    onChanged: (value) =>
                        setState(() => temperatureValue = value),
                  ),
                ),
              ],
            ),
            Text("Current Temprature : ${temperatureValue.toStringAsFixed(
                1)}^C"),

            SizedBox(height: 20),

            Text("Price Range"),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: priceValue,
                    min: 0,
                    max: 1000,
                    label: "${priceValue.toStringAsFixed(0)}^C",
                    onChanged: (value) =>
                        setState(() => priceValue = value),
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price :Rs ${priceValue.toStringAsFixed(0)}"),
                  Text("Range :Rs 0 - 1000"),
                ]
            )
          ],
        ),
      ),
    );
  }
}
