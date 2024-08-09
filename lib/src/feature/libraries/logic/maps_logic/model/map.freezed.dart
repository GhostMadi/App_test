// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailMap _$DetailMapFromJson(Map<String, dynamic> json) {
  return _Detailmap.fromJson(json);
}

/// @nodoc
mixin _$DetailMap {
  int? get id => throw _privateConstructorUsedError;
  Map<String, dynamic>? get shape_gis => throw _privateConstructorUsedError;
  int? get culture => throw _privateConstructorUsedError;
  String? get fact_area => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailMapCopyWith<DetailMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMapCopyWith<$Res> {
  factory $DetailMapCopyWith(DetailMap value, $Res Function(DetailMap) then) =
      _$DetailMapCopyWithImpl<$Res, DetailMap>;
  @useResult
  $Res call(
      {int? id,
      Map<String, dynamic>? shape_gis,
      int? culture,
      String? fact_area});
}

/// @nodoc
class _$DetailMapCopyWithImpl<$Res, $Val extends DetailMap>
    implements $DetailMapCopyWith<$Res> {
  _$DetailMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shape_gis = freezed,
    Object? culture = freezed,
    Object? fact_area = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      shape_gis: freezed == shape_gis
          ? _value.shape_gis
          : shape_gis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      culture: freezed == culture
          ? _value.culture
          : culture // ignore: cast_nullable_to_non_nullable
              as int?,
      fact_area: freezed == fact_area
          ? _value.fact_area
          : fact_area // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailmapImplCopyWith<$Res>
    implements $DetailMapCopyWith<$Res> {
  factory _$$DetailmapImplCopyWith(
          _$DetailmapImpl value, $Res Function(_$DetailmapImpl) then) =
      __$$DetailmapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      Map<String, dynamic>? shape_gis,
      int? culture,
      String? fact_area});
}

/// @nodoc
class __$$DetailmapImplCopyWithImpl<$Res>
    extends _$DetailMapCopyWithImpl<$Res, _$DetailmapImpl>
    implements _$$DetailmapImplCopyWith<$Res> {
  __$$DetailmapImplCopyWithImpl(
      _$DetailmapImpl _value, $Res Function(_$DetailmapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shape_gis = freezed,
    Object? culture = freezed,
    Object? fact_area = freezed,
  }) {
    return _then(_$DetailmapImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      shape_gis: freezed == shape_gis
          ? _value._shape_gis
          : shape_gis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      culture: freezed == culture
          ? _value.culture
          : culture // ignore: cast_nullable_to_non_nullable
              as int?,
      fact_area: freezed == fact_area
          ? _value.fact_area
          : fact_area // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailmapImpl implements _Detailmap {
  _$DetailmapImpl(
      {this.id,
      final Map<String, dynamic>? shape_gis,
      this.culture,
      this.fact_area})
      : _shape_gis = shape_gis;

  factory _$DetailmapImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailmapImplFromJson(json);

  @override
  final int? id;
  final Map<String, dynamic>? _shape_gis;
  @override
  Map<String, dynamic>? get shape_gis {
    final value = _shape_gis;
    if (value == null) return null;
    if (_shape_gis is EqualUnmodifiableMapView) return _shape_gis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? culture;
  @override
  final String? fact_area;

  @override
  String toString() {
    return 'DetailMap(id: $id, shape_gis: $shape_gis, culture: $culture, fact_area: $fact_area)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailmapImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._shape_gis, _shape_gis) &&
            (identical(other.culture, culture) || other.culture == culture) &&
            (identical(other.fact_area, fact_area) ||
                other.fact_area == fact_area));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_shape_gis), culture, fact_area);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailmapImplCopyWith<_$DetailmapImpl> get copyWith =>
      __$$DetailmapImplCopyWithImpl<_$DetailmapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailmapImplToJson(
      this,
    );
  }
}

abstract class _Detailmap implements DetailMap {
  factory _Detailmap(
      {final int? id,
      final Map<String, dynamic>? shape_gis,
      final int? culture,
      final String? fact_area}) = _$DetailmapImpl;

  factory _Detailmap.fromJson(Map<String, dynamic> json) =
      _$DetailmapImpl.fromJson;

  @override
  int? get id;
  @override
  Map<String, dynamic>? get shape_gis;
  @override
  int? get culture;
  @override
  String? get fact_area;
  @override
  @JsonKey(ignore: true)
  _$$DetailmapImplCopyWith<_$DetailmapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
