import 'package:flutter/material.dart';
import 'package:guruh5/mock/pages/post_details_page.dart';
import 'package:guruh5/mock/repositories/mock_repo.dart';

class MockPage extends StatefulWidget {
  const MockPage({super.key});

  @override
  State<MockPage> createState() => _MockPageState();
}

class _MockPageState extends State<MockPage> {
  List<Map<String, dynamic>> posts = [
    {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
    },
    {
      "userId": 1,
      "id": 2,
      "title": "qui est esse",
      "body":
          "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
    },
    {
      "userId": 1,
      "id": 3,
      "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
      "body":
          "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
    },
    {
      "userId": 1,
      "id": 4,
      "title": "eum et est occaecati",
      "body":
          "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
    },
  ];
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
                        post['id'].toString(),
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
