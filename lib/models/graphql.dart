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
EventList eventListFromJson(String str) => EventList.fromMap(json.decode(str));

String eventListToJson(EventList data) => json.encode(data.toMap());

class EventList {
    Data data;

    EventList({
        this.data,
    });

    factory EventList.fromMap(Map<String, dynamic> json) => EventList(
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class Data {
    List<EventData> events;

    Data({
        this.events,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        events: List<EventData>.from(json["events"].map((x) => EventData.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "events": List<dynamic>.from(events.map((x) => x.toMap())),
    };
}

class EventData {
    String id;
    String name;
    String desc;
    String body;
    String picture;
    String startDate;
    String endDate;

    EventData({
        this.id,
        this.name,
        this.desc,
        this.body,
        this.picture,
        this.startDate,
        this.endDate,
    });

    factory EventData.fromMap(Map<String, dynamic> json) => EventData(
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

Future<List<EventData>> getInfo() async {
  final GraphQLData test = new GraphQLData();
  var q = "query{events{id name desc body picture start_date end_date}}";
  var getData = await test.query(q);
  final eventList = eventListFromJson(getData.body);
  return eventList.data.events;
}