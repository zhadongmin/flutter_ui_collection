import 'package:flutter/material.dart';
import 'package:flutter_ui_collection/common/components/custom_error.dart';
import 'package:flutter_ui_collection/home_page.dart';
// import 'package:flutter_ui_collection/home_page.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    print('烫烫烫');
    FlutterError.dumpErrorToConsole(details);
    // runApp(ErrorWidgetClass(details));
    runApp(MaterialApp(
      home: ErrorWidgetClass(details),
    ));
  };
  runApp(const MyApp());
}

class ErrorWidgetClass extends StatelessWidget {
  const ErrorWidgetClass(this.errorDetails, {super.key});

  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomErrorWidget(
          errorMessage: errorDetails.exceptionAsString(),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // fontFamily: 'Roboto',
          // fontFamily: 'Dancing_Script',
          // focusColor: Colors.red,
          ),
      home: const HomePage(),
    );
  }
}
