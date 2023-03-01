import '../../../domain/entities/preview_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesine/core/error/failure.dart';
part 'state.freezed.dart';

@freezed
abstract class CardState with _$CardState {

  const factory CardState.initial() = Initial;

  const factory CardState.loading() = Loading;

  const factory CardState.preview({required PreviewEntity preview}) = Preview;

  const factory CardState.empty() = Empty;

  const factory CardState.error(Failure failure) = Error;
}