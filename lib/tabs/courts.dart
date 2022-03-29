import 'package:flutter/cupertino.dart';

class CourtTab extends StatelessWidget {
  const CourtTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      return const Text("Hallo");
    }));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return "Court";
  }
}
