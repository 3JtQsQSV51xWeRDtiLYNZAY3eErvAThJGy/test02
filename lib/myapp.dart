// ignore: unused_import
import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List<String> allNames = ['Name 1', 'Name 2', 'Name 3'];
//   List<String> provinceNames = ['Province 1', 'Province 2', 'Province 3'];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void addName() {
//     // Add logic goes here
//   }

//   void deleteName() {
//     // Delete logic goes here
//   }

//   Future<Future> confirmDelete() async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Delete'),
//           content: Text('Are you sure you want to delete this name?'),
//           actions: [
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//             ),
//             TextButton(
//               child: Text('Delete'),
//               onPressed: () {
//                 Navigator.of(context).pop(true);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Personal Information'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'All'),
//             Tab(text: 'By Province'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // All names tab
//           ListView.builder(
//             itemCount: allNames.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text(allNames[index]),
//                 subtitle: Text('Address ${index + 1}'),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () async {
//                     bool delete = (await confirmDelete()) as bool;
//                     if (delete) {
//                       setState(() {
//                         allNames.removeAt(index);
//                       });
//                     }
//                   },
//                 ),
//               );
//             },
//           ),
//           // By province tab
//           ListView.builder(
//             itemCount: provinceNames.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text(provinceNames[index]),
//                 subtitle: Text('Address ${index + 1}'),
//               );
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: addName,
//       ),
//     );
//   }
// }

// class DataCollectionPage extends StatefulWidget {
//   @override
//   _DataCollectionPageState createState() => _DataCollectionPageState();
// }

// class _DataCollectionPageState extends State<DataCollectionPage> {
//   int _currentStep = 0;
//   late TextEditingController personalInfoController;
//   late TextEditingController addressController;
//   late List<Step> steps;

//   @override
//   void initState() {
//     super.initState();
//     personalInfoController = TextEditingController();
//     addressController = TextEditingController();

//     steps = [
//       Step(
//         title: Text('Step 1'),
//         content: Column(
//           children: [
//             Text('Personal Information'),
//             TextField(
//               controller: personalInfoController,
//               decoration: InputDecoration(labelText: 'Personal Info'),
//             ),
//           ],
//         ),
//         isActive: true,
//       ),
//       Step(
//         title: Text('Step 2'),
//         content: Column(
//           children: [
//             Text('Address'),
//             TextField(
//               controller: addressController,
//               decoration: InputDecoration(labelText: 'Address'),
//             ),
//           ],
//         ),
//         isActive: false,
//       ),
//     ];
//   }

//   @override
//   void dispose() {
//     personalInfoController.dispose();
//     addressController.dispose();
//     super.dispose();
//   }

//   void _nextStep() {
//     setState(() {
//       if (_currentStep < steps.length - 1) {
//         _currentStep++;
//       }
//     });
//   }

//   void _previousStep() {
//     setState(() {
//       if (_currentStep > 0) {
//         _currentStep--;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Collection'),
//       ),
//       body: Stepper(
//         currentStep: _currentStep,
//         onStepContinue: _nextStep,
//         onStepCancel: _previousStep,
//         steps: steps,
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TextEditingController personalInfoController;
  late TextEditingController addressController;
  late List<Step> steps;
  late TabController _tabController;
  List<String> allNames = ['Name 1', 'Name 2', 'Name 3'];
  List<String> provinceNames = ['Province 1'];
  TextEditingController nameController = TextEditingController();
  String? currentName;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void addName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Name'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                String newName = nameController.text;
                setState(() {
                  allNames.add(newName);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteName() {
    // Delete logic goes here
  }

  Future<Future> confirmDelete() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this name?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(true);
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
        title: Text('Personal Information'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'By Province'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // All names tab
          ListView.builder(
            itemCount: allNames.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(allNames[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    bool delete = (await confirmDelete()) as bool;
                    if (delete) {
                      setState(() {
                        allNames.removeAt(index);
                      });
                    }
                  },
                ),
              );
            },
          ),
          // By province tab
          // ListView.builder(
          //   itemCount: provinceNames.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title: Text(provinceNames[index]),
          //       subtitle: Text('Address ${index + 1}'),
          //     );
          //   },
          // ),
          // By province tab
          ListView.builder(
            itemCount: provinceNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Stepper(
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep == 0) {
                    // Check if the TextField has a value
                    if (currentName != null && currentName!.isNotEmpty) {
                      setState(() {
                        allNames.add(currentName!);
                      });
                    }
                  }

                  setState(() {
                    if (currentStep < 2) {
                      currentStep++;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currentStep > 0) {
                      currentStep--;
                    }
                  });
                },
                steps: [
                  Step(
                    title: Text('Step 1'),
                    content: Column(
                      children: [
                        Text('Step 1 Content'),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          onChanged: (value) {
                            setState(() {
                              currentName = value;
                            });
                          },
                        ),
                      ],
                    ),
                    isActive: currentStep == 0,
                  ),
                  Step(
                    title: Text('Step 2'),
                    content: Column(
                      children: [
                        Text('Step 2 Content'),
                        // Add your input fields here for Step 2
                      ],
                    ),
                    isActive: currentStep == 1,
                  ),
                  Step(
                    title: Text('Step 3'),
                    content: Column(
                      children: [
                        Text('Step 3 Content'),
                        // Add your input fields here for Step 3
                      ],
                    ),
                    isActive: currentStep == 2,
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addName,
      ),
    );
  }
}
