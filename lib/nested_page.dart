import 'package:flutter/material.dart';

class NestedPage extends StatelessWidget {
  const NestedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: 
          (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                title: Text("AppBar"),
                bottom: TabBar(tabs: [
                  Tab(text: "Home"), 
                  Tab(text: "Profile")]),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      width: 400,
                      color: Colors.black,
                    ),
                  ),
                  SliverList.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        color: Colors.red,
                        margin: EdgeInsets.all(20.0),
                      );
                    },
                  ),
                ],
              ),
              Center(child: Text('Profile')),
            ],
          ),
        ),
      ),
    );
  }
}
