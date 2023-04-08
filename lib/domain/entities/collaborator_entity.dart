import 'dart:convert';

CollaboratorEntity collaboratorEntityFromJson(String str) =>
    CollaboratorEntity.fromJson(json.decode(str));

String collaboratorEntityToJson(CollaboratorEntity data) =>
    json.encode(data.toJson());

class CollaboratorEntity {
  CollaboratorEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.email,
    required this.profession,
    required this.phone,
    required this.delay,
  });

  int id;
  String name;
  String imagePath;
  String email;
  String profession;
  String phone;
  int delay;

  factory CollaboratorEntity.fromJson(Map<String, dynamic> json) =>
      CollaboratorEntity(
        id: json["id"],
        name: json["name"],
        imagePath: json["imagePath"],
        email: json["email"],
        profession: json["profession"],
        phone: json["phone"],
        delay: json["delay"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imagePath": imagePath,
        "email": email,
        "profession": profession,
        "phone": phone,
        "delay": delay,
      };
}
