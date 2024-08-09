// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_processes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BusinessProcessesEvent {
  String get idCompany => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idCompany, String id) fetchBusProcesses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idCompany, String id)? fetchBusProcesses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idCompany, String id)? fetchBusProcesses,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBusprocesses value) fetchBusProcesses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBusprocesses value)? fetchBusProcesses,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBusprocesses value)? fetchBusProcesses,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessProcessesEventCopyWith<BusinessProcessesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessProcessesEventCopyWith<$Res> {
  factory $BusinessProcessesEventCopyWith(BusinessProcessesEvent value,
          $Res Function(BusinessProcessesEvent) then) =
      _$BusinessProcessesEventCopyWithImpl<$Res, BusinessProcessesEvent>;
  @useResult
  $Res call({String idCompany, String id});
}

/// @nodoc
class _$BusinessProcessesEventCopyWithImpl<$Res,
        $Val extends BusinessProcessesEvent>
    implements $BusinessProcessesEventCopyWith<$Res> {
  _$BusinessProcessesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCompany = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      idCompany: null == idCompany
          ? _value.idCompany
          : idCompany // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchBusprocessesImplCopyWith<$Res>
    implements $BusinessProcessesEventCopyWith<$Res> {
  factory _$$FetchBusprocessesImplCopyWith(_$FetchBusprocessesImpl value,
          $Res Function(_$FetchBusprocessesImpl) then) =
      __$$FetchBusprocessesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCompany, String id});
}

/// @nodoc
class __$$FetchBusprocessesImplCopyWithImpl<$Res>
    extends _$BusinessProcessesEventCopyWithImpl<$Res, _$FetchBusprocessesImpl>
    implements _$$FetchBusprocessesImplCopyWith<$Res> {
  __$$FetchBusprocessesImplCopyWithImpl(_$FetchBusprocessesImpl _value,
      $Res Function(_$FetchBusprocessesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCompany = null,
    Object? id = null,
  }) {
    return _then(_$FetchBusprocessesImpl(
      idCompany: null == idCompany
          ? _value.idCompany
          : idCompany // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchBusprocessesImpl implements FetchBusprocesses {
  const _$FetchBusprocessesImpl({required this.idCompany, required this.id});

  @override
  final String idCompany;
  @override
  final String id;

  @override
  String toString() {
    return 'BusinessProcessesEvent.fetchBusProcesses(idCompany: $idCompany, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBusprocessesImpl &&
            (identical(other.idCompany, idCompany) ||
                other.idCompany == idCompany) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idCompany, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchBusprocessesImplCopyWith<_$FetchBusprocessesImpl> get copyWith =>
      __$$FetchBusprocessesImplCopyWithImpl<_$FetchBusprocessesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idCompany, String id) fetchBusProcesses,
  }) {
    return fetchBusProcesses(idCompany, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idCompany, String id)? fetchBusProcesses,
  }) {
    return fetchBusProcesses?.call(idCompany, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idCompany, String id)? fetchBusProcesses,
    required TResult orElse(),
  }) {
    if (fetchBusProcesses != null) {
      return fetchBusProcesses(idCompany, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchBusprocesses value) fetchBusProcesses,
  }) {
    return fetchBusProcesses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchBusprocesses value)? fetchBusProcesses,
  }) {
    return fetchBusProcesses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchBusprocesses value)? fetchBusProcesses,
    required TResult orElse(),
  }) {
    if (fetchBusProcesses != null) {
      return fetchBusProcesses(this);
    }
    return orElse();
  }
}

abstract class FetchBusprocesses implements BusinessProcessesEvent {
  const factory FetchBusprocesses(
      {required final String idCompany,
      required final String id}) = _$FetchBusprocessesImpl;

  @override
  String get idCompany;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$FetchBusprocessesImplCopyWith<_$FetchBusprocessesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BusinessProcessesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailBusinessProcess detailBusinessProcess)
        success,
    required TResult Function(CatchException error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult? Function(CatchException error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult Function(CatchException error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessProcessesStateCopyWith<$Res> {
  factory $BusinessProcessesStateCopyWith(BusinessProcessesState value,
          $Res Function(BusinessProcessesState) then) =
      _$BusinessProcessesStateCopyWithImpl<$Res, BusinessProcessesState>;
}

/// @nodoc
class _$BusinessProcessesStateCopyWithImpl<$Res,
        $Val extends BusinessProcessesState>
    implements $BusinessProcessesStateCopyWith<$Res> {
  _$BusinessProcessesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BusinessProcessesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BusinessProcessesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailBusinessProcess detailBusinessProcess)
        success,
    required TResult Function(CatchException error) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult? Function(CatchException error)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult Function(CatchException error)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements BusinessProcessesState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DetailBusinessProcess detailBusinessProcess});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BusinessProcessesStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailBusinessProcess = null,
  }) {
    return _then(_$SuccessImpl(
      detailBusinessProcess: null == detailBusinessProcess
          ? _value.detailBusinessProcess
          : detailBusinessProcess // ignore: cast_nullable_to_non_nullable
              as DetailBusinessProcess,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl({required this.detailBusinessProcess});

  @override
  final DetailBusinessProcess detailBusinessProcess;

  @override
  String toString() {
    return 'BusinessProcessesState.success(detailBusinessProcess: $detailBusinessProcess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.detailBusinessProcess, detailBusinessProcess) ||
                other.detailBusinessProcess == detailBusinessProcess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detailBusinessProcess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailBusinessProcess detailBusinessProcess)
        success,
    required TResult Function(CatchException error) failed,
  }) {
    return success(detailBusinessProcess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult? Function(CatchException error)? failed,
  }) {
    return success?.call(detailBusinessProcess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult Function(CatchException error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(detailBusinessProcess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements BusinessProcessesState {
  const factory Success(
          {required final DetailBusinessProcess detailBusinessProcess}) =
      _$SuccessImpl;

  DetailBusinessProcess get detailBusinessProcess;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CatchException error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BusinessProcessesStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CatchException,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final CatchException error;

  @override
  String toString() {
    return 'BusinessProcessesState.failed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DetailBusinessProcess detailBusinessProcess)
        success,
    required TResult Function(CatchException error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult? Function(CatchException error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DetailBusinessProcess detailBusinessProcess)? success,
    TResult Function(CatchException error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Error value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Error implements BusinessProcessesState {
  const factory Error({required final CatchException error}) = _$ErrorImpl;

  CatchException get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
