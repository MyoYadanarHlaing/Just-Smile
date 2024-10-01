import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke_response_model.g.dart';

@JsonSerializable()
class JokeResponseModel {
  final bool error;
  final int? amount;
  final List<JokeModel>? jokes;
  final bool? internalError;
  final String? message;
  final List<String>? causedBy;
  final String? additionalInfo;

  JokeResponseModel(
      {required this.error,
      required this.amount,
      required this.jokes,
      this.internalError,
      this.message,
      this.causedBy,
      this.additionalInfo});

  factory JokeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JokeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$JokeResponseModelToJson(this);
}

@JsonSerializable()
class JokeModel {
  final String category;
  final String type;
  final String? joke;
  final String? setup;
  final String? delivery;
  final FlagModel flags;
  final bool safe;
  final int id;
  final String lang;

  JokeModel(
      {required this.category,
      required this.type,
      this.joke,
      this.setup,
      this.delivery,
      required this.flags,
      required this.safe,
      required this.id,
      required this.lang});

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);

  Map<String, dynamic> toJson() => _$JokeModelToJson(this);
}

@JsonSerializable()
class FlagModel {
  final bool nsfw;
  final bool religious;
  final bool political;
  final bool racist;
  final bool sexist;
  final bool explicit;

  FlagModel(
      {required this.nsfw,
      required this.religious,
      required this.political,
      required this.racist,
      required this.sexist,
      required this.explicit});

  factory FlagModel.fromJson(Map<String, dynamic> json) =>
      _$FlagModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlagModelToJson(this);
}
