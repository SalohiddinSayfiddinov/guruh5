import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/routes/app_pages.dart';
import 'package:guruh5/features/home/presentation/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppPages.vendors, arguments: 'From home');
        },
      ),
      appBar: AppBar(title: Text('Home page')),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeError) {
            return Center(child: Text(state.error));
          } else if (state is HomeSuccess) {
            return ListView.builder(
              padding: EdgeInsets.all(22.0),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .3),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(book.title, style: TextStyle(fontSize: 18.0)),
                      Text(
                        book.price.toString(),
                        style: TextStyle(fontSize: 16.0, color: Colors.blue),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
