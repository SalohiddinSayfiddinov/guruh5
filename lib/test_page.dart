import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/test_provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  final List<Widget> _pages = [
    Center(child: Text("Home", style: TextStyle(fontSize: 44.0))),
    Center(child: Text("Profile", style: TextStyle(fontSize: 44.0))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[context.watch<TestProvider>().currentPage],
      bottomNavigationBar: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        context.read<TestProvider>().changePage(value);
      },
      currentIndex: context.watch<TestProvider>().currentPage,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
