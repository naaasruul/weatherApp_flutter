import 'package:flutter/material.dart';
import 'package:mudahjev3/Widgets/MyAppBar.dart';
import 'package:quickalert/quickalert.dart';
import 'package:mudahjev3/Utils/constant.dart';

class NoteVideo extends StatefulWidget {
  final Map<String, dynamic> content;

  NoteVideo({required this.content});

  @override
  State<NoteVideo> createState() => _NoteVideoState();
}

class _NoteVideoState extends State<NoteVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Placeholder
          Container(
            width: double.infinity,
            height: 400,
            color: Colors.grey[300],
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Quiz Question
          Center(
            child:  Text(
              widget.content['title'],
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),

          // Options
          Column(
            children: [
              RadioListTile<int>(
                title: const Text('Option 1: Introduction'),
                value: 1,
                groupValue: null,
                // Replace with a variable to track the selected value
                onChanged: (value) {
                  // Handle option selection
                },
              ),
              RadioListTile<int>(
                title: const Text('Option 2: Details'),
                value: 2,
                groupValue: null,
                // Replace with a variable to track the selected value
                onChanged: (value) {
                  // Handle option selection
                },
              ),
              RadioListTile<int>(
                title: const Text('Option 3: Summary'),
                value: 3,
                groupValue: null,
                // Replace with a variable to track the selected value
                onChanged: (value) {
                  // Handle option selection
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Submit Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle submission
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Quiz Completed!',
                  autoCloseDuration: const Duration(seconds: 3),
                  showConfirmBtn: true,
                  backgroundColor: Color(kWhiteColor),
                  confirmBtnColor: Color(kMainColor),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC90000),
                // Customize button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
