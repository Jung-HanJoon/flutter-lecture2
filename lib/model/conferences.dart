/// name : "SwiftLeeds"
/// link : "https://swiftleeds.co.uk/"
/// start : "2020-10-07"
/// end : "2020-10-08"
/// location : "🇬🇧 Leeds, UK"
import 'package:flutter_apps_https/extention_functions/extentions.dart';

class Conferences {
  String _name;
  String _link;
  String _start;
  String _end;
  String _location;

  String get name => _name;
  String get link => _link;
  String get start => _start;
  String get end => _end;
  String get location => _location;

  Conferences({
      String name, 
      String link, 
      String start, 
      String end, 
      String location}){
    _name = name;
    _link = link;
    _start = start;
    _end = end;
    _location = location;
}

  Conferences.fromJson(dynamic json) {
    _name = json["name"];
    _link = json["link"];
    _start = json["start"].toString().parseDate();
    _end = json["end"].toString().parseDate();
    _location = json["location"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["link"] = _link;
    map["start"] = _start;
    map["end"] = _end;
    map["location"] = _location;
    return map;
  }

}