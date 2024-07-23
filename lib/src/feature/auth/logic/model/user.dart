
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class AuthResponse{
  final String refresh;
  final String access;

  AuthResponse({required this.refresh, required this.access});

  factory AuthResponse.fromJson(Map<String,dynamic> map)=>_$AuthResponseFromJson(map);
  Map<String, dynamic> toJson()=>_$AuthResponseToJson(this);
}