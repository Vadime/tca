import 'package:flutter/cupertino.dart';
import 'package:tca/main.dart';

class NewsDocument {
  final String title;
  final String date;
  final String content;
  final String imageUrl;

  NewsDocument(this.title, this.date, this.content, this.imageUrl);
}

Future<List<NewsDocument>> get() async {
  return [
    NewsDocument(
        "Michel Hopp wurde Landesmeister",
        "01.04.2022",
        "Michel hat krankes Turnier gespielt und gewonnen. Don’t know what Cupertino is? It is nothing but a set of flutter widgets that follow the ios design pattern. These widgets are designed to implement ios features in flutter apps built for the ios platform. In this tutorial, we will learn how to use cupertino textfield in flutter with example. We will also learn how to customize the CupertinoTextField widget using different properties. Don’t know what Cupertino is? It is nothing but a set of flutter widgets that follow the ios design pattern. These widgets are designed to implement ios features in flutter apps built for the ios platform. In this tutorial, we will learn how to use cupertino textfield in flutter with example. We will also learn how to customize the CupertinoTextField widget using different properties.",
        "https://tse4.mm.bing.net/th?id=OIP.96M1UH0HaQ_SCt7zYtP5JQHaE8&pid=Api"),
    NewsDocument(
        "Senioren feiern Sieg",
        "01.04.2022",
        "Michel hat krankes Turnier gespielt und gewonnen. Don’t know what Cupertino is? It is nothing but a set of flutter widgets that follow the ios design pattern. These widgets are designed to implement ios features in flutter apps built for the ios platform. In this tutorial, we will learn how to use cupertino textfield in flutter with example. We will also learn how to customize the CupertinoTextField widget using different properties. Don’t know what Cupertino is? It is nothing but a set of flutter widgets that follow the ios design pattern. These widgets are designed to implement ios features in flutter apps built for the ios platform. In this tutorial, we will learn how to use cupertino textfield in flutter with example. We will also learn how to customize the CupertinoTextField widget using different properties.",
        "https://tse4.mm.bing.net/th?id=OIP.96M1UH0HaQ_SCt7zYtP5JQHaE8&pid=Api")
  ];
}

class NewsTab extends StatelessWidget {
  final AsyncSnapshot<List<NewsDocument>> snapshot;
  const NewsTab(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(((context, index) {
      NewsDocument document = snapshot.data![index];
      return CupertinoButton(
        child: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      bottomLeft: Radius.circular(radius)),
                  child: Image.network(
                    document.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: padding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        document.date,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .tabLabelTextStyle,
                      ),
                      Text(document.title,
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navTitleTextStyle,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(width: padding),
                const Icon(CupertinoIcons.forward),
                const SizedBox(width: padding),
              ],
            )),
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => ContentTab(document.title, document.date,
                      document.content, document.imageUrl)));
        },
      );
    }), childCount: snapshot.data!.length));
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return "News";
  }
}

class ContentTab extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  final String imageUrl;

  const ContentTab(this.title, this.date, this.content, this.imageUrl,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(title)),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(padding2x),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Image.network(
                    imageUrl,
                  )),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: padding2x, left: padding2x, right: padding2x),
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(radius)),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(padding2x),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .tabLabelTextStyle,
                      ),
                      const SizedBox(
                        height: padding,
                      ),
                      Text(content),
                    ],
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
