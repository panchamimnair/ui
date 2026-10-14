import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/apiint.dart';
import 'package:practice/apiwithFuturebuilder.dart';
import 'package:practice/reg.dart';
import 'package:practice/ui13-10-26.dart';
import 'package:practice/ui14-10-26.dart';
import 'package:practice/view_model/auth_model_view.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // MultiProvider(
    //   providers: [ChangeNotifierProvider(create: (context) => AuthModelView())],
    //   child: 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Flutterblog1(),
      
    );
  }
}
