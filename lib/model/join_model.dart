
import 'package:freezed_annotation/freezed_annotation.dart';


part 'join_model.g.dart';
part 'join_model.freezed.dart';


@freezed
class JoinModel with _$JoinModel {
  const factory JoinModel({
    required String id,
    required String pw,
    required String email,
    required String name,
  }) = _JoinModel;

  factory JoinModel.fromJson(Map<String, dynamic> json) => _$JoinModelFromJson(json);
}
