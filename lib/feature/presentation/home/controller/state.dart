
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nesine/core/error/failure.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/entities/preview_entity.dart';

part 'state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {

  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.page({required WebViewController webViewController}) = Page;

  const factory HomeState.preview({required List<PreviewEntity> previewList}) = Preview;

  const factory HomeState.internetError() = Internet;

  const factory HomeState.empty() = Empty;

  const factory HomeState.error(Failure failure) = Error;
}