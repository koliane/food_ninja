// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sqlite_orm.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class OptionData extends DataClass implements Insertable<OptionData> {
  final String code;
  final String value;
  OptionData({required this.code, required this.value});
  factory OptionData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OptionData(
      code: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}code'])!,
      value: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}value'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['value'] = Variable<String>(value);
    return map;
  }

  OptionCompanion toCompanion(bool nullToAbsent) {
    return OptionCompanion(
      code: Value(code),
      value: Value(value),
    );
  }

  factory OptionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OptionData(
      code: serializer.fromJson<String>(json['code']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'value': serializer.toJson<String>(value),
    };
  }

  OptionData copyWith({String? code, String? value}) => OptionData(
        code: code ?? this.code,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('OptionData(')
          ..write('code: $code, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OptionData &&
          other.code == this.code &&
          other.value == this.value);
}

class OptionCompanion extends UpdateCompanion<OptionData> {
  final Value<String> code;
  final Value<String> value;
  const OptionCompanion({
    this.code = const Value.absent(),
    this.value = const Value.absent(),
  });
  OptionCompanion.insert({
    required String code,
    required String value,
  })  : code = Value(code),
        value = Value(value);
  static Insertable<OptionData> custom({
    Expression<String>? code,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (value != null) 'value': value,
    });
  }

  OptionCompanion copyWith({Value<String>? code, Value<String>? value}) {
    return OptionCompanion(
      code: code ?? this.code,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OptionCompanion(')
          ..write('code: $code, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $OptionTable extends Option with TableInfo<$OptionTable, OptionData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $OptionTable(this._db, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  late final GeneratedColumn<String?> code = GeneratedColumn<String?>(
      'code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String?> value = GeneratedColumn<String?>(
      'value', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [code, value];
  @override
  String get aliasedName => _alias ?? 'options';
  @override
  String get actualTableName => 'options';
  @override
  VerificationContext validateIntegrity(Insertable<OptionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  OptionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OptionData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $OptionTable createAlias(String alias) {
    return $OptionTable(_db, alias);
  }
}

abstract class _$SqliteOrm extends GeneratedDatabase {
  _$SqliteOrm(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $OptionTable option = $OptionTable(this);
  late final OptionDao optionDao = OptionDao(this as SqliteOrm);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [option];
}
