import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Map<String, dynamic>> users = [
    {"name": "John", "gender": "male", "height": 182.5, "weight": 70},
    {"name": "Mike", "gender": "male", "height": 160.0, "weight": 70},
    {"name": "Sarah", "gender": "female", "height": 168.2, "weight": 58},
    {"name": "David", "gender": "male", "height": 175.3, "weight": 80},
    {"name": "Emma", "gender": "female", "height": 162.7, "weight": 55},
    {"name": "Chris", "gender": "male", "height": 185.0, "weight": 90},
    {"name": "Sophia", "gender": "female", "height": 170.5, "weight": 65},
    {"name": "Daniel", "gender": "male", "height": 178.6, "weight": 72},
    {"name": "Olivia", "gender": "female", "height": 165.4, "weight": 60},
    {"name": "James", "gender": "male", "height": 181.9, "weight": 76},
    {"name": "Ava", "gender": "female", "height": 159.3, "weight": 52},
    {"name": "Liam", "gender": "male", "height": 172.8, "weight": 68},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Users", style: TextStyle(fontSize: 24.0)),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(22.0),
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 150,
                    child: Card(
                      child: ListTile(
                        title: Text(users[index]['name']),
                        subtitle: Text(users[index]['gender']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 10.0,
                          children: [
                            Text(users[index]['height'].toString()),
                            Text(users[index]['weight'].toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
