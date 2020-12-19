import 'package:flutter/material.dart';
import 'package:uas/model/Club.dart';
import 'package:uas/viewmodel/fetchClub.dart';
import 'package:uas/view/DetailClubLigaIndonesia.dart';
import 'package:uas/view/DetailClubLigaInggris.dart';
import 'package:uas/view/DetailClubLigaSpanyol.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Club Sepakbola Dunia',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Liga Indonesia',
                ),
                Tab(
                  text: 'Liga Inggris',
                ),
                Tab(
                  text: 'Liga Spanyol',
                ),
              ],
            ),
            title: Text('Club Sepakbola Dunia'),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: FutureBuilder<List<Club>>(
                  future: fetchLigaIndonesia(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ClubListLigaIndonesia(club: snapshot.data)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
              Center(
                child: FutureBuilder<List<Club>>(
                  future: fetchLigaInggris(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ClubListLigaInggris(club: snapshot.data)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
              Center(
                child: FutureBuilder<List<Club>>(
                  future: fetchLigaSpanyol(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ClubListLigaSpanyol(club: snapshot.data)
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClubListLigaIndonesia extends StatelessWidget {
  final List<Club> club;

  ClubListLigaIndonesia({Key key, this.club}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: club.length,
      itemBuilder: (context, index) {
        return new GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailClubLigaIndonesia(
                              club: club[index],
                            )));
              },
              child: new Card(
                child: new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        "${club[index].logo}",
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${club[index].nama}',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ),
                          Text('${club[index].liga}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }
}

class ClubListLigaInggris extends StatelessWidget {
  final List<Club> club;

  ClubListLigaInggris({Key key, this.club}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: club.length,
      itemBuilder: (context, index) {
        return new GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailClubLigaInggris(
                              club: club[index],
                            )));
              },
              child: new Card(
                child: new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        "${club[index].logo}",
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${club[index].nama}',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ),
                          Text('${club[index].liga}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }
}

class ClubListLigaSpanyol extends StatelessWidget {
  final List<Club> club;

  ClubListLigaSpanyol({Key key, this.club}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: club.length,
      itemBuilder: (context, index) {
        return new GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailClubLigaSpanyol(
                              club: club[index],
                            )));
              },
              child: new Card(
                child: new Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                        "${club[index].logo}",
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${club[index].nama}',
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ),
                          Text('${club[index].liga}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
      },
    );
  }
}