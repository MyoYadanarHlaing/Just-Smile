// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeResponseModel _$JokeResponseModelFromJson(Map<String, dynamic> json) =>
    JokeResponseModel(
      error: json['error'] as bool,
      amount: (json['amount'] as num?)?.toInt(),
      jokes: (json['jokes'] as List<dynamic>?)
          ?.map((e) => JokeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      internalError: json['internalError'] as bool?,
      message: json['message'] as String?,
      causedBy: (json['causedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalInfo: json['additionalInfo'] as String?,
    );

Map<String, dynamic> _$JokeResponseModelToJson(JokeResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'amount': instance.amount,
      'jokes': instance.jokes,
      'internalError': instance.internalError,
      'message': instance.message,
      'causedBy': instance.causedBy,
      'additionalInfo': instance.additionalInfo,
    };

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) => JokeModel(
      category: json['category'] as String,
      type: json['type'] as String,
      joke: json['joke'] as String?,
      setup: json['setup'] as String?,
      delivery: json['delivery'] as String?,
      flags: FlagModel.fromJson(json['flags'] as Map<String, dynamic>),
      safe: json['safe'] as bool,
      id: (json['id'] as num).toInt(),
      lang: json['lang'] as String,
    );

Map<String, dynamic> _$JokeModelToJson(JokeModel instance) => <String, dynamic>{
      'category': instance.category,
      'type': instance.type,
      'joke': instance.joke,
      'setup': instance.setup,
      'delivery': instance.delivery,
      'flags': instance.flags,
      'safe': instance.safe,
      'id': instance.id,
      'lang': instance.lang,
    };

FlagModel _$FlagModelFromJson(Map<String, dynamic> json) => FlagModel(
      nsfw: json['nsfw'] as bool,
      religious: json['religious'] as bool,
      political: json['political'] as bool,
      racist: json['racist'] as bool,
      sexist: json['sexist'] as bool,
      explicit: json['explicit'] as bool,
    );

Map<String, dynamic> _$FlagModelToJson(FlagModel instance) => <String, dynamic>{
      'nsfw': instance.nsfw,
      'religious': instance.religious,
      'political': instance.political,
      'racist': instance.racist,
      'sexist': instance.sexist,
      'explicit': instance.explicit,
    };
