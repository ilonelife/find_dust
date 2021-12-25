class AirResult {
  AirResult({
    required this.status,
    required this.data,
  });

  late final String status;
  late final Data data;

  factory AirResult.fromJson(Map<String, dynamic> json) {
    return AirResult(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });

  late final String city;
  late final String state;
  late final String country;
  late final Location location;
  late final Current current;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['state'] = state;
    _data['country'] = country;
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  final String? type;
  final List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates: List.castFrom<dynamic, double>(
        json['coordinates'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

class Current {
  Current({
    required this.weather,
    required this.pollution,
  });

  final Weather weather;
  final Pollution pollution;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      weather: Weather.fromJson(json['weather']),
      pollution: Pollution.fromJson(json['pollution']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['weather'] = weather.toJson();
    _data['pollution'] = pollution.toJson();
    return _data;
  }
}

class Weather {
  Weather({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });

  final String? ts;
  final int? tp;
  final int? pr;
  final int? hu;
  final double? ws;
  final int? wd;
  final String? ic;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        ts: json['ts'],
        tp: json['tp'],
        pr: json['pr'],
        hu: json['hu'],
        ws: json['ws'],
        wd: json['wd'],
        ic: json['ic']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ts'] = ts;
    _data['tp'] = tp;
    _data['pr'] = pr;
    _data['hu'] = hu;
    _data['ws'] = ws;
    _data['wd'] = wd;
    _data['ic'] = ic;
    return _data;
  }
}

class Pollution {
  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });

  final String? ts;
  final int? aqius;
  final String? mainus;
  final int? aqicn;
  final String? maincn;

  factory Pollution.fromJson(Map<String, dynamic> json) {
    return Pollution(
        ts: json['ts'],
        aqius: json['aqius'],
        mainus: json['mainus'],
        aqicn: json['aqicn'],
        maincn: json['maincn']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ts'] = ts;
    _data['aqius'] = aqius;
    _data['mainus'] = mainus;
    _data['aqicn'] = aqicn;
    _data['maincn'] = maincn;
    return _data;
  }
}
