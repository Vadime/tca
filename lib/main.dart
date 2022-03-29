import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:tca/app.dart';
import 'package:tca/firebase_options.dart';

const double padding = 10;
const double padding2x = 20;
const double radius = 20;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CupertinoApp(
      color: CupertinoColors.systemRed,
      theme: CupertinoThemeData(primaryColor: CupertinoColors.systemRed),
      home: MyApp()));
}

class Helper extends StatelessWidget {
  const Helper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
