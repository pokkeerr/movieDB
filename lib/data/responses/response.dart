import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

//? this command for get the fromJson && toJson Functions by build_runner package
//! command :-> flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//? and the resalut of this command is will generated json file called "{filname}.g.dart"

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CostumerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotification")
  int? numOfNotification;

  CostumerResponse(this.id, this.name, this.numOfNotification);

  //from json
  factory CostumerResponse.fromJson(Map<String, dynamic> json) =>
      _$CostumerResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$CostumerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "email")
  String? email;

  ContactsResponse(this.email, this.link, this.phone);

  //from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "costumer")
  CostumerResponse? costumer;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.contacts, this.costumer);

  //from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
