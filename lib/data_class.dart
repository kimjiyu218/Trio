import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_class.freezed.dart';
part 'data_class.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required int bno,
    required String title,
    required String content,
    required String writer,
    required String regdate,
    required String viewcnt,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}