import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tca/main.dart';
import 'package:tca/tabs/home.dart';
import 'package:tca/tabs/news.dart';
import 'package:tca/tabs/courts.dart';
import 'package:tca/tabs/profile.dart';

class MyApp extends StatelessWidget {
  const MyApp({this.gast = false, Key? key}) : super(key: key);
  final bool gast;

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      TextEditingController nameCon = TextEditingController();
      return CupertinoPageScaffold(
          child: CustomScrollView(slivers: [
        const CupertinoSliverNavigationBar(largeTitle: Text("Anmelden")),
        SliverPadding(
          padding: const EdgeInsets.all(padding2x),
          sliver: SliverList(
              delegate: SliverChildListDelegate([
            CupertinoTextField(
              textAlign: TextAlign.center,
              placeholder: "Nutzername",
              controller: nameCon,
              suffix: CupertinoButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: nameCon.text + "@tca-backend.com",
                      password: "123456");
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (_) => const MyApp()),
                      (route) => false);
                },
                child: const Text("Fertig"),
              ),
            ),
            const SizedBox(height: padding2x),
            Container(
              padding: const EdgeInsets.all(padding2x),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: CupertinoColors.systemGrey6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Was ist mein Nutzername?",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle),
                  Text(
                      "Du hast beim ausfüllen des Aufnahmeantrags deinen Vor-, Nachnamen und Geburtstag angegeben. Dein Nutzername wird folgenderweise gebildet: (VornameNachnameGeburtsjahr)",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle),
                  const SizedBox(height: padding),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Text("Vorname",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                          Text("Max",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                        ]),
                        Text("+",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle),
                        Column(children: [
                          Text("Nachname",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                          Text("Musterman",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                        ]),
                        Text("+",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle),
                        Column(children: [
                          Text("Geburtsjahr",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                          Text("1987",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                        ]),
                        Text("=",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle),
                        Column(children: [
                          Text("Nutzername",
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .tabLabelTextStyle),
                          Text(
                            "MaxMusterman87",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle,
                          )
                        ]),
                      ])
                ],
              ),
            ),
            const SizedBox(height: padding2x),
            Container(
              padding: const EdgeInsets.all(padding2x),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: CupertinoColors.systemGrey6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Noch kein Mitglied?",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          // navigator zum Formular ausfüllen
                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (_) => const CupertinoPageScaffold(
                          //             child: ProfileTab(edit: true))));
                        },
                        child: const Text("zum Aufnahmeantrag")),
                  ),
                ],
              ),
            ),
          ])),
        ),
      ]));
    }
    return FutureBuilder<List<NewsDocument>>(
        future: get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CupertinoActivityIndicator();
          }

          return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection(UserDatabase.collection)
                  .doc("1lTPncSgzRQAd7RlmyFl3BodWRj2")
                  .get(),
              builder: (_, userSnapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                Map<String, dynamic> user = (userSnapshot.data!.data() != null)
                    ? userSnapshot.data!.data()!
                    : {
                        UserDatabase.firstName: "________",
                        UserDatabase.lastName: "",
                        UserDatabase.abo: "________",
                        UserDatabase.image:
                            "https://www.pngkey.com/png/full/202-2024792_profile-icon-png.png",
                        UserDatabase.gender: "________",
                        UserDatabase.bornIn: "________ ",
                        UserDatabase.bornOn: " ________",
                        UserDatabase.plz: "________ ",
                        UserDatabase.city: " ________ ",
                        UserDatabase.adress: " _________",
                        UserDatabase.email: "________",
                        UserDatabase.phone: "________",
                        UserDatabase.costs: 0,
                        UserDatabase.costsExtra: 0,
                        UserDatabase.accountHolder: "________",
                        UserDatabase.financialInstituation: "________",
                        UserDatabase.iban: "________",
                      };
                final List<Widget> titles = [
                  const HomeTab(),
                  NewsTab(snapshot),
                  const CourtTab(),
                  ProfileTab(user),
                ];
                return CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                      items: (!gast)
                          ? const [
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.home)),
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.news)),
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.calendar)),
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.person)),
                            ]
                          : const [
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.home)),
                              BottomNavigationBarItem(
                                  icon: Icon(CupertinoIcons.news)),
                            ]),
                  tabBuilder: (_, index) {
                    return CupertinoTabView(
                      builder: (_) {
                        return CustomScrollView(slivers: [
                          CupertinoSliverNavigationBar(
                              largeTitle: Text(toString())),
                          SliverPadding(
                              padding: const EdgeInsets.all(padding),
                              sliver: titles[index])
                        ]);
                      },
                    );
                  },
                );
              });
        });
  }
}
