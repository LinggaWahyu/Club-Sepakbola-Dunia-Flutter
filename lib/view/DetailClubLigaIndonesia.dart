import 'package:flutter/material.dart';
import 'package:uas/model/Club.dart';

class DetailClubLigaIndonesia extends StatelessWidget {
  final Club club;

  DetailClubLigaIndonesia({Key key, @required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      club.nama,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    club.liga,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.blueAccent,
                          ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('${club.stadion}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget bagianDeskripsi = Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        club.deskripsi,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(club.nama),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              '${club.logo}',
              width: 600,
              height: 310,
            ),
          ),
          bagianJudul,
          bagianDeskripsi,
        ],
      ),
    );
  }
}
