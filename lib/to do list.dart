import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class task extends StatefulWidget {
  @override
  State<task> createState() => TaskList();
}

class TaskList extends State<task> {
  List<Map<String, String>> tasks = [];
  var addTaskController = TextEditingController();
  var deadlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      String? savedTask = pref.getString("tasks");
      String? savedDeadline = pref.getString("deadline");

      if (savedTask != null && savedDeadline != null) {
        tasks.add({
          'task': savedTask,
          'deadline': savedDeadline,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO LIST'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.pink,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.list),
                  iconSize: 40.0,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "TODAY's TASK",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Add Task'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: addTaskController,
                                decoration: InputDecoration(
                                  labelText: 'Enter a new task',
                                ),
                              ),
                              SizedBox(height: 8),
                              TextField(
                                controller: deadlineController,
                                decoration: InputDecoration(
                                  labelText: 'Deadline',
                                ),
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                  ).then((pickedDate) {
                                    if (pickedDate != null) {
                                      setState(() {
                                        deadlineController.text =
                                        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                      });
                                    }
                                  });
                                },
                                readOnly: true,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                var pref = await SharedPreferences.getInstance();

                                await pref.setString("tasks", addTaskController.text);
                                await pref.setString("deadline", deadlineController.text);

                                setState(() {
                                  tasks.add({
                                    'task': addTaskController.text,
                                    'deadline': deadlineController.text,
                                  });
                                  addTaskController.clear();
                                  deadlineController.clear();
                                });

                                Navigator.pop(context);
                              },
                              child: Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.add_box_sharp),
                  iconSize: 40.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    elevation: 7,
                    color: Colors.pinkAccent.shade100,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            tasks[index]['task']!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Deadline: ${tasks[index]['deadline']!}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                addTaskController.text = tasks[index]['task']!;
                                deadlineController.text = tasks[index]['deadline']!;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Task'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: addTaskController,
                                            decoration: InputDecoration(
                                              labelText: 'Edit the task',
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          TextField(
                                            controller: deadlineController,
                                            decoration: InputDecoration(labelText: 'Edit Deadline',
                                            ),
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2100),
                                              ).then((pickedDate) {
                                                if (pickedDate != null) {
                                                  setState(() {
                                                    deadlineController.text =
                                                    "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                                  });
                                                }
                                              });
                                            },
                                            readOnly: true,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            var pref = await SharedPreferences.getInstance();
                                            setState(() {
                                              tasks[index]['task'] = addTaskController.text;
                                              tasks[index]['deadline'] = deadlineController.text;

                                              pref.setString("tasks", tasks[index]['task']!);
                                              pref.setString("deadline", tasks[index]['deadline']!);

                                              addTaskController.clear();
                                              deadlineController.clear();
                                            });

                                            Navigator.pop(context);
                                          },
                                          child: Text('Save'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () async {
                                var pref = await SharedPreferences.getInstance();
                                setState(() {
                                  tasks.removeAt(index);
                                });

                                await pref.remove("tasks");
                                await pref.remove("deadline");
                              },
                              icon: Icon(Icons.delete_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
