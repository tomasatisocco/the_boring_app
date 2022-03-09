import 'package:the_boring_app/features/random_activity/domain/entities/random_activity.dart';

class RandomActivityModel extends RandomActivity{
  const RandomActivityModel({
    required String activity,
    required String type,
    required int participants,
    required double price,
    required String link,
    String? key,
    required double accessibility,
  }) : super(
    activity: activity,
    type: type,
    participants: participants,
    price: price,
    link: link,
    key: key,
    accesibility: accessibility,
  );

  factory RandomActivityModel.formJson(Map<String, dynamic> json){
    return RandomActivityModel(
      activity: json["activity"],
      type: json["type"],
      participants: json["participants"],
      price: (json["price"] as num).toDouble(),
      link: json["link"],
      key: json["key"],
      accessibility: (json["accessibility"] as num).toDouble()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "activity": activity,
      "type": type,
      "participants": participants,
      "price": price,
      "link": link,
      "key": key,
      "accesibility": accesibility,
    };
  }
}