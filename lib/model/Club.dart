class Club {
  final String nama;
  final String liga;
  final String stadion;
  final String logo;
  final String deskripsi;

  Club({this.nama, this.liga, this.stadion, this.logo, this.deskripsi});

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      nama: json['strTeam'] as String,
      liga: json['strLeague'] as String,
      stadion: json['strStadium'] as String,
      logo: json['strTeamBadge'] as String,
      deskripsi: json['strDescriptionEN'] as String,
    );
  }
}
