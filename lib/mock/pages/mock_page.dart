import 'package:flutter/material.dart';
import 'package:guruh5/features/home/data/models/post_model.dart';
import 'package:guruh5/mock/pages/post_details_page.dart';
import 'package:guruh5/mock/repositories/mock_repo.dart';

class MockPage extends StatefulWidget {
  const MockPage({super.key});

  @override
  State<MockPage> createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: MockRepository().getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.all(22.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final post = data[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PostDetailsPage(post: data[index]);
                            },
                          ),
                        );
                      },
                      title: Text(
                        post.id.toString(),
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error'));
            } else {
              return Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      ),
    );
  }
}
