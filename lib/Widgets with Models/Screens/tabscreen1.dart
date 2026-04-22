import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TabScn1()));

class TabScn1 extends StatefulWidget {
  const TabScn1({super.key});

  @override
  State<TabScn1> createState() => _TabScn1State();
}

class _TabScn1State extends State<TabScn1> {
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dialogs")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ElevatedButton.icon(
            onPressed: () => _showSimpleAlert(context),
            icon: const Icon(Icons.info),
            label: const Text('Simple Alert'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => _showConfirmationAlert(context),
            icon: const Icon(Icons.warning),
            label: const Text('Confirm Alert'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => _showChoiceAlert(context),
            icon: const Icon(Icons.list),
            label: const Text('Choice Alert'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => _showInputAlert(context),
            icon: const Icon(Icons.edit),
            label: const Text('Input Alert'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => _showAwesomeDialog(context),
            label: Text("Alert Form Dependency"),
          ),
          SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => _showSimpleSnackBar(context),
            icon: const Icon(Icons.notifications),
            label: const Text('Simple SnackBar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () => _showSnackBarWithAction(context),
            icon: const Icon(Icons.notifications_active_sharp),
            label: const Text("SnackBar with Action"),

          ),

          const SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () => _showBuildBottomSheet(context),
            icon: const Icon(Icons.open_in_new),
            label: const Text('Modal Bottom Sheet'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              _showExitDialog(context);
            },
            child: const Text('exit'),
          ),
          const SizedBox(height: 12),
          Text(
            _selectedOption.isEmpty
                ? "No selection yet"
                : "Selected: $_selectedOption",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _showSimpleAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Row(
              children: const [
                Icon(Icons.timelapse),
                SizedBox(width: 8),
                Text('Simple Alert'),
              ],
            ),
            content: const Text(
              'This is a simple alert dialog with just OK button.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  void _showConfirmationAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Confirm Action'),
            content: const Text('Are you sure you want to proceed?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                      const SnackBar(content: Text('Action Confirmed')));
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }

  void _showChoiceAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Choose Option'),
            content: const Text('Select one option:'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedOption = 'Option 1 selected';
                  });
                  Navigator.pop(context);
                },
                child: const Text('Option 1'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedOption = 'Option 2 selected';
                  });
                  Navigator.pop(context);
                },
                child: const Text('Option 2'),
              ),
            ],
          ),
    );
  }

  void _showInputAlert(BuildContext context) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Enter Your Name'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Type your name here',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      _selectedOption = controller.text;
                    });
                  }
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
    );
  }

  void _showAwesomeDialog(BuildContext context) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Dialog Title',
        desc: 'Dialog description here.............',
        btnCancelOnPress: () {},
    btnOkOnPress: () {},
    ).show();
  }

  void _showSimpleSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This is a simple SnackBar message'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showSnackBarWithAction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item deleted'),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.grey[800],
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.yellow,
          onPressed: () {
            setState(() {
              _selectedOption = 'Undo action performed';
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item restored!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
  void _showBuildBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Share This App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareOption("Facebook","🙎"),
                _buildShareOption("Instagram","ℹ️"),
                _buildShareOption("Twitter","🐤"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(String label, String icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = 'Shared via $label';
        });
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('exit?'),
          content: const Text('do you really want to exit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // For "no", just close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('no'),
            ),
            TextButton(
              onPressed: () {
                // For "yes", exit the whole app
                SystemNavigator.pop();
              },
              child: const Text('yes'),
            ),
          ],
        );
      },
    );
  }


  }
