import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guruh5/core/locale/locale_keys.g.dart';
import 'package:guruh5/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TimeOfDay? pickedDate;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(child: Text(LocaleKeys.greeting).tr()),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   spacing: 20.0,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () async {
      //         final result = await showTimePicker(
      //           context: context,
      //           initialTime: TimeOfDay.now(),
      //         );
      //         if (result != null) {
      //           final temp = DateTime(2020, 10, 10, result.hour, result.minute);
      //           pickedDate = result;
      //         }
      //       },
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         context.setLocale(Locale('uz'));
      //         // context.read<ThemeProvider>().toggleTheme();
      //       },
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         context.setLocale(Locale('en'));
      //         // context.read<ThemeProvider>().toggleTheme();
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
