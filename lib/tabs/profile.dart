import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tca/main.dart';

class UserDatabase {
  static const String collection = "Users",
      firstName = "Vorname",
      lastName = "Nachname",
      abo = "Abo",
      gender = "Geschlecht",
      bornIn = "Geboren in",
      bornOn = "Geboren am",
      plz = "PLZ",
      city = "Stadt",
      adress = "Adresse",
      email = "Email",
      phone = "Telefon",
      costs = "Jährlicher Beitrag",
      costsExtra = "Zusätzlicher Beitrag",
      accountHolder = "Kontoinhaber",
      financialInstituation = "Geldinstitut",
      iban = "IBAN",
      image = "Bild";
}

class ProfileTab extends StatelessWidget {
  final bool edit;
  final Map<String, dynamic> user;
  const ProfileTab(this.user, {this.edit = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const SizedBox(height: padding2x),
      Row(children: [
        const SizedBox(width: padding2x),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            user[UserDatabase.image],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: padding2x),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(padding2x),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .tabLabelTextStyle,
                      ),
                      Text(
                          user[UserDatabase.firstName] +
                              " " +
                              user[UserDatabase.lastName],
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: padding2x),
                      Text(
                        UserDatabase.abo,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .tabLabelTextStyle,
                      ),
                      Text(user[UserDatabase.abo],
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle,
                          overflow: TextOverflow.ellipsis),
                    ]),
              )),
        ),
        const SizedBox(width: padding2x),
      ]),
      Padding(
        padding: const EdgeInsets.all(padding2x),
        child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(padding2x),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      UserDatabase.gender,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(user[UserDatabase.gender],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: padding2x),
                    Text(
                      UserDatabase.bornIn,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(
                        user[UserDatabase.bornIn] +
                            " am " +
                            user[UserDatabase.bornOn],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                  ]),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: padding2x, right: padding2x),
        child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(padding2x),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wohne in",
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(
                        user[UserDatabase.plz].toString() +
                            ", " +
                            user[UserDatabase.city] +
                            ", " +
                            user[UserDatabase.adress],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: padding2x),
                    Text(
                      UserDatabase.email,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(user[UserDatabase.email],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: padding2x),
                    Text(
                      UserDatabase.phone,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(user[UserDatabase.phone].toString(),
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                  ]),
            )),
      ),
      Container(
          margin: const EdgeInsets.only(
              left: padding2x, right: padding2x, top: padding2x),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(padding2x),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Jährlich",
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .tabLabelTextStyle,
                        ),
                        Text(user[UserDatabase.costs].toString() + " \$",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle,
                            overflow: TextOverflow.ellipsis),
                      ]),
                ),
                const SizedBox(width: padding),
                Text("+",
                    style:
                        CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(width: padding),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Zusätzlich",
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .tabLabelTextStyle,
                        ),
                        Text(user[UserDatabase.costsExtra].toString() + " \$",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle,
                            overflow: TextOverflow.ellipsis),
                      ]),
                ),
                const SizedBox(width: padding),
                Text("=",
                    style:
                        CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(width: padding),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Gesamt",
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .tabLabelTextStyle,
                        ),
                        Text(
                            (user[UserDatabase.costs] +
                                        user[UserDatabase.costsExtra])
                                    .toString() +
                                " \$",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle,
                            overflow: TextOverflow.ellipsis),
                      ]),
                ),
              ],
            ),
          )),
      Padding(
        padding: const EdgeInsets.all(padding2x),
        child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(padding2x),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      UserDatabase.accountHolder,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(user[UserDatabase.accountHolder],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: padding2x),
                    Text(
                      UserDatabase.financialInstituation,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(user[UserDatabase.financialInstituation],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: padding2x),
                    Text(
                      UserDatabase.iban,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle,
                    ),
                    Text(user[UserDatabase.iban],
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .navTitleTextStyle,
                        overflow: TextOverflow.ellipsis),
                  ]),
            )),
      )
    ]));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return (edit) ? "Aufnahmeantrag" : "Profile";
  }
}
