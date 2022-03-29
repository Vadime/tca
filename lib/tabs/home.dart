import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tca/main.dart';

class HomeGridItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget navigateTo;

  const HomeGridItem(this.icon, this.iconColor, this.title, this.navigateTo);
}

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  final List<HomeGridItem> items = const [
    HomeGridItem(CupertinoIcons.person_3, CupertinoColors.systemBlue,
        "Verein & Mitgliedschaft", Helper()),
    HomeGridItem(CupertinoIcons.game_controller, CupertinoColors.systemGreen,
        "Spielbetrieb", Helper()),
    HomeGridItem(CupertinoIcons.person_2, CupertinoColors.systemIndigo,
        "Jugend- und Jüngstentennis", Helper()),
    HomeGridItem(CupertinoIcons.question, CupertinoColors.systemOrange, "FAQ's",
        Helper()),
    HomeGridItem(CupertinoIcons.placemark, CupertinoColors.systemPink,
        "Anfahrt & Kontakt", Helper()),
    HomeGridItem(FontAwesomeIcons.section, CupertinoColors.systemTeal,
        "Impressum", Helper()),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0),
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            return CupertinoButton(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(radius)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        items[index].icon,
                        color: items[index].iconColor,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          items[index].title,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ]),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => items[index].navigateTo));
              },
            );
          },
          childCount: items.length,
        ));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return "Home";
  }
}
