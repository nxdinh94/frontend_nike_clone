// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyLogin _$BodyLoginFromJson(Map<String, dynamic> json) => BodyLogin(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$BodyLoginToJson(BodyLogin instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

BodyLogout _$BodyLogoutFromJson(Map<String, dynamic> json) => BodyLogout(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$BodyLogoutToJson(BodyLogout instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

BodyRegister _$BodyRegisterFromJson(Map<String, dynamic> json) => BodyRegister(
      json['email'] as String,
      json['name'] as String,
      json['password'] as String,
      json['dob'] as String,
      json['country'] as String,
    );

Map<String, dynamic> _$BodyRegisterToJson(BodyRegister instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'dob': instance.dob,
      'country': instance.country,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _AuthServices implements AuthServices {
  _AuthServices(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'http://192.168.2.8:3222/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<TokenModel>> login(BodyLogin bodyLogin) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(bodyLogin.toJson());
    final _options = _setStreamType<HttpResponse<TokenModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late TokenModel _value;
    try {
      _value = TokenModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<LogoutModel>> logout(BodyLogout bodyLogout) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(bodyLogout.toJson());
    final _options = _setStreamType<HttpResponse<LogoutModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/users/logout',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late LogoutModel _value;
    try {
      _value = LogoutModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<RegisterModel>> register(
      BodyRegister bodyRegister) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(bodyRegister.toJson());
    final _options = _setStreamType<HttpResponse<RegisterModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'users/register',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RegisterModel _value;
    try {
      _value = RegisterModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
