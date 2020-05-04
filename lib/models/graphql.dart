import 'dart:convert';

import 'package:http/http.dart' as http;

class GraphQLData {
  Future<http.Response> query(String query) async {
    String body = jsonEncode(<String, String>{'query': query});
    var s = await http.post('http://34.87.47.86/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    return s;
  }
}

class Eventlist {
    Data data;

    Eventlist({
        this.data,
    });

    factory Eventlist.fromJson(String str) => Eventlist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Eventlist.fromMap(Map<String, dynamic> json) => Eventlist(
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}
class Data {
    List<Event> events;

    Data({
        this.events,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        events: List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "events": List<dynamic>.from(events.map((x) => x.toMap())),
    };
}

class Event {
    String id;
    String name;
    String desc;
    String body;
    String picture;
    String startDate;
    String endDate;

    Event({
        this.id,
        this.name,
        this.desc,
        this.body,
        this.picture,
        this.startDate,
        this.endDate,
    });

    factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Event.fromMap(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        body: json["body"],
        picture: json["picture"],
        startDate: json["start_date"],
        endDate: json["end_date"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "body": body,
        "picture": picture,
        "start_date": startDate,
        "end_date": endDate,
    };
}
