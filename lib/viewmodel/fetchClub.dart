import 'package:flutter/foundation.dart';
import 'package:uas/model/Club.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Club>> fetchLigaInggris(http.Client client) async {
  final response = await client.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League');
  return compute(parseClub, response.body);
}

Future<List<Club>> fetchLigaSpanyol(http.Client client) async {
  final response = await client.get('https://thesportsdb.com/api/v1/json/1/search_all_teams.php?l=Spanish%20La%20Liga');
  return compute(parseClub, response.body);
}

Future<List<Club>> fetchLigaIndonesia(http.Client client) async {
  final response = await client.get('https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=Indonesian%20Super%20League');
  return compute(parseClub, response.body);
}

List<Club> parseClub(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['teams'].cast<Map<String, dynamic>>();
  return parsed.map<Club>((json) => Club.fromJson(json)).toList();
}
