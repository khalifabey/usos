import 'package:flutter/material.dart';
import 'package:usos/thankyou.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ChoiceButton(
            choice: 'Choice 1',
            selectedChoice: selectedChoice,
            onSelect: () {
              setState(() {
                selectedChoice = 'Choice 1';
              });
            },
          ),
          ChoiceButton(
            choice: 'Choice 2',
            selectedChoice: selectedChoice,
            onSelect: () {
              setState(() {
                selectedChoice = 'Choice 2';
              });
            },
          ),
          ChoiceButton(
            choice: 'Choice 3',
            selectedChoice: selectedChoice,
            onSelect: () {
              setState(() {
                selectedChoice = 'Choice 3';
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to ThankYouPage after pressing "Next" button
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThankYouPage()),
              );
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String choice;
  final String selectedChoice;
  final VoidCallback onSelect;

  ChoiceButton({
    required this.choice,
    required this.selectedChoice,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelect,
      style: ElevatedButton.styleFrom(
        primary: selectedChoice == choice ? Colors.green : Colors.grey,
      ),
      child: Text(choice),
    );
  }
}
