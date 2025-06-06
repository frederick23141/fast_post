// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PedidosTable extends Pedidos with TableInfo<$PedidosTable, Pedido> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PedidosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, fecha];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pedidos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pedido> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pedido map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pedido(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      fecha:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}fecha'],
          )!,
    );
  }

  @override
  $PedidosTable createAlias(String alias) {
    return $PedidosTable(attachedDatabase, alias);
  }
}

class Pedido extends DataClass implements Insertable<Pedido> {
  final int id;
  final DateTime fecha;
  const Pedido({required this.id, required this.fecha});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['fecha'] = Variable<DateTime>(fecha);
    return map;
  }

  PedidosCompanion toCompanion(bool nullToAbsent) {
    return PedidosCompanion(id: Value(id), fecha: Value(fecha));
  }

  factory Pedido.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pedido(
      id: serializer.fromJson<int>(json['id']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fecha': serializer.toJson<DateTime>(fecha),
    };
  }

  Pedido copyWith({int? id, DateTime? fecha}) =>
      Pedido(id: id ?? this.id, fecha: fecha ?? this.fecha);
  Pedido copyWithCompanion(PedidosCompanion data) {
    return Pedido(
      id: data.id.present ? data.id.value : this.id,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pedido(')
          ..write('id: $id, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fecha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pedido && other.id == this.id && other.fecha == this.fecha);
}

class PedidosCompanion extends UpdateCompanion<Pedido> {
  final Value<int> id;
  final Value<DateTime> fecha;
  const PedidosCompanion({
    this.id = const Value.absent(),
    this.fecha = const Value.absent(),
  });
  PedidosCompanion.insert({
    this.id = const Value.absent(),
    required DateTime fecha,
  }) : fecha = Value(fecha);
  static Insertable<Pedido> custom({
    Expression<int>? id,
    Expression<DateTime>? fecha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fecha != null) 'fecha': fecha,
    });
  }

  PedidosCompanion copyWith({Value<int>? id, Value<DateTime>? fecha}) {
    return PedidosCompanion(id: id ?? this.id, fecha: fecha ?? this.fecha);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PedidosCompanion(')
          ..write('id: $id, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }
}

class $ItemsPedidoTable extends ItemsPedido
    with TableInfo<$ItemsPedidoTable, ItemsPedidoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsPedidoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pedidoIdMeta = const VerificationMeta(
    'pedidoId',
  );
  @override
  late final GeneratedColumn<int> pedidoId = GeneratedColumn<int>(
    'pedido_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pedidos (id)',
    ),
  );
  static const VerificationMeta _productoMeta = const VerificationMeta(
    'producto',
  );
  @override
  late final GeneratedColumn<String> producto = GeneratedColumn<String>(
    'producto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tamanoMeta = const VerificationMeta('tamano');
  @override
  late final GeneratedColumn<String> tamano = GeneratedColumn<String>(
    'tamano',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salsasMeta = const VerificationMeta('salsas');
  @override
  late final GeneratedColumn<String> salsas = GeneratedColumn<String>(
    'salsas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adicionesMeta = const VerificationMeta(
    'adiciones',
  );
  @override
  late final GeneratedColumn<String> adiciones = GeneratedColumn<String>(
    'adiciones',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pedidoId,
    producto,
    tamano,
    salsas,
    adiciones,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items_pedido';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemsPedidoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pedido_id')) {
      context.handle(
        _pedidoIdMeta,
        pedidoId.isAcceptableOrUnknown(data['pedido_id']!, _pedidoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pedidoIdMeta);
    }
    if (data.containsKey('producto')) {
      context.handle(
        _productoMeta,
        producto.isAcceptableOrUnknown(data['producto']!, _productoMeta),
      );
    } else if (isInserting) {
      context.missing(_productoMeta);
    }
    if (data.containsKey('tamano')) {
      context.handle(
        _tamanoMeta,
        tamano.isAcceptableOrUnknown(data['tamano']!, _tamanoMeta),
      );
    } else if (isInserting) {
      context.missing(_tamanoMeta);
    }
    if (data.containsKey('salsas')) {
      context.handle(
        _salsasMeta,
        salsas.isAcceptableOrUnknown(data['salsas']!, _salsasMeta),
      );
    } else if (isInserting) {
      context.missing(_salsasMeta);
    }
    if (data.containsKey('adiciones')) {
      context.handle(
        _adicionesMeta,
        adiciones.isAcceptableOrUnknown(data['adiciones']!, _adicionesMeta),
      );
    } else if (isInserting) {
      context.missing(_adicionesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemsPedidoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemsPedidoData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      pedidoId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}pedido_id'],
          )!,
      producto:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}producto'],
          )!,
      tamano:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tamano'],
          )!,
      salsas:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}salsas'],
          )!,
      adiciones:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}adiciones'],
          )!,
    );
  }

  @override
  $ItemsPedidoTable createAlias(String alias) {
    return $ItemsPedidoTable(attachedDatabase, alias);
  }
}

class ItemsPedidoData extends DataClass implements Insertable<ItemsPedidoData> {
  final int id;
  final int pedidoId;
  final String producto;
  final String tamano;
  final String salsas;
  final String adiciones;
  const ItemsPedidoData({
    required this.id,
    required this.pedidoId,
    required this.producto,
    required this.tamano,
    required this.salsas,
    required this.adiciones,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pedido_id'] = Variable<int>(pedidoId);
    map['producto'] = Variable<String>(producto);
    map['tamano'] = Variable<String>(tamano);
    map['salsas'] = Variable<String>(salsas);
    map['adiciones'] = Variable<String>(adiciones);
    return map;
  }

  ItemsPedidoCompanion toCompanion(bool nullToAbsent) {
    return ItemsPedidoCompanion(
      id: Value(id),
      pedidoId: Value(pedidoId),
      producto: Value(producto),
      tamano: Value(tamano),
      salsas: Value(salsas),
      adiciones: Value(adiciones),
    );
  }

  factory ItemsPedidoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemsPedidoData(
      id: serializer.fromJson<int>(json['id']),
      pedidoId: serializer.fromJson<int>(json['pedidoId']),
      producto: serializer.fromJson<String>(json['producto']),
      tamano: serializer.fromJson<String>(json['tamano']),
      salsas: serializer.fromJson<String>(json['salsas']),
      adiciones: serializer.fromJson<String>(json['adiciones']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pedidoId': serializer.toJson<int>(pedidoId),
      'producto': serializer.toJson<String>(producto),
      'tamano': serializer.toJson<String>(tamano),
      'salsas': serializer.toJson<String>(salsas),
      'adiciones': serializer.toJson<String>(adiciones),
    };
  }

  ItemsPedidoData copyWith({
    int? id,
    int? pedidoId,
    String? producto,
    String? tamano,
    String? salsas,
    String? adiciones,
  }) => ItemsPedidoData(
    id: id ?? this.id,
    pedidoId: pedidoId ?? this.pedidoId,
    producto: producto ?? this.producto,
    tamano: tamano ?? this.tamano,
    salsas: salsas ?? this.salsas,
    adiciones: adiciones ?? this.adiciones,
  );
  ItemsPedidoData copyWithCompanion(ItemsPedidoCompanion data) {
    return ItemsPedidoData(
      id: data.id.present ? data.id.value : this.id,
      pedidoId: data.pedidoId.present ? data.pedidoId.value : this.pedidoId,
      producto: data.producto.present ? data.producto.value : this.producto,
      tamano: data.tamano.present ? data.tamano.value : this.tamano,
      salsas: data.salsas.present ? data.salsas.value : this.salsas,
      adiciones: data.adiciones.present ? data.adiciones.value : this.adiciones,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemsPedidoData(')
          ..write('id: $id, ')
          ..write('pedidoId: $pedidoId, ')
          ..write('producto: $producto, ')
          ..write('tamano: $tamano, ')
          ..write('salsas: $salsas, ')
          ..write('adiciones: $adiciones')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pedidoId, producto, tamano, salsas, adiciones);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemsPedidoData &&
          other.id == this.id &&
          other.pedidoId == this.pedidoId &&
          other.producto == this.producto &&
          other.tamano == this.tamano &&
          other.salsas == this.salsas &&
          other.adiciones == this.adiciones);
}

class ItemsPedidoCompanion extends UpdateCompanion<ItemsPedidoData> {
  final Value<int> id;
  final Value<int> pedidoId;
  final Value<String> producto;
  final Value<String> tamano;
  final Value<String> salsas;
  final Value<String> adiciones;
  const ItemsPedidoCompanion({
    this.id = const Value.absent(),
    this.pedidoId = const Value.absent(),
    this.producto = const Value.absent(),
    this.tamano = const Value.absent(),
    this.salsas = const Value.absent(),
    this.adiciones = const Value.absent(),
  });
  ItemsPedidoCompanion.insert({
    this.id = const Value.absent(),
    required int pedidoId,
    required String producto,
    required String tamano,
    required String salsas,
    required String adiciones,
  }) : pedidoId = Value(pedidoId),
       producto = Value(producto),
       tamano = Value(tamano),
       salsas = Value(salsas),
       adiciones = Value(adiciones);
  static Insertable<ItemsPedidoData> custom({
    Expression<int>? id,
    Expression<int>? pedidoId,
    Expression<String>? producto,
    Expression<String>? tamano,
    Expression<String>? salsas,
    Expression<String>? adiciones,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pedidoId != null) 'pedido_id': pedidoId,
      if (producto != null) 'producto': producto,
      if (tamano != null) 'tamano': tamano,
      if (salsas != null) 'salsas': salsas,
      if (adiciones != null) 'adiciones': adiciones,
    });
  }

  ItemsPedidoCompanion copyWith({
    Value<int>? id,
    Value<int>? pedidoId,
    Value<String>? producto,
    Value<String>? tamano,
    Value<String>? salsas,
    Value<String>? adiciones,
  }) {
    return ItemsPedidoCompanion(
      id: id ?? this.id,
      pedidoId: pedidoId ?? this.pedidoId,
      producto: producto ?? this.producto,
      tamano: tamano ?? this.tamano,
      salsas: salsas ?? this.salsas,
      adiciones: adiciones ?? this.adiciones,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pedidoId.present) {
      map['pedido_id'] = Variable<int>(pedidoId.value);
    }
    if (producto.present) {
      map['producto'] = Variable<String>(producto.value);
    }
    if (tamano.present) {
      map['tamano'] = Variable<String>(tamano.value);
    }
    if (salsas.present) {
      map['salsas'] = Variable<String>(salsas.value);
    }
    if (adiciones.present) {
      map['adiciones'] = Variable<String>(adiciones.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsPedidoCompanion(')
          ..write('id: $id, ')
          ..write('pedidoId: $pedidoId, ')
          ..write('producto: $producto, ')
          ..write('tamano: $tamano, ')
          ..write('salsas: $salsas, ')
          ..write('adiciones: $adiciones')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PedidosTable pedidos = $PedidosTable(this);
  late final $ItemsPedidoTable itemsPedido = $ItemsPedidoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pedidos, itemsPedido];
}

typedef $$PedidosTableCreateCompanionBuilder =
    PedidosCompanion Function({Value<int> id, required DateTime fecha});
typedef $$PedidosTableUpdateCompanionBuilder =
    PedidosCompanion Function({Value<int> id, Value<DateTime> fecha});

final class $$PedidosTableReferences
    extends BaseReferences<_$AppDatabase, $PedidosTable, Pedido> {
  $$PedidosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ItemsPedidoTable, List<ItemsPedidoData>>
  _itemsPedidoRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.itemsPedido,
    aliasName: $_aliasNameGenerator(db.pedidos.id, db.itemsPedido.pedidoId),
  );

  $$ItemsPedidoTableProcessedTableManager get itemsPedidoRefs {
    final manager = $$ItemsPedidoTableTableManager(
      $_db,
      $_db.itemsPedido,
    ).filter((f) => f.pedidoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemsPedidoRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PedidosTableFilterComposer
    extends Composer<_$AppDatabase, $PedidosTable> {
  $$PedidosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> itemsPedidoRefs(
    Expression<bool> Function($$ItemsPedidoTableFilterComposer f) f,
  ) {
    final $$ItemsPedidoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itemsPedido,
      getReferencedColumn: (t) => t.pedidoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsPedidoTableFilterComposer(
            $db: $db,
            $table: $db.itemsPedido,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PedidosTableOrderingComposer
    extends Composer<_$AppDatabase, $PedidosTable> {
  $$PedidosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PedidosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PedidosTable> {
  $$PedidosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  Expression<T> itemsPedidoRefs<T extends Object>(
    Expression<T> Function($$ItemsPedidoTableAnnotationComposer a) f,
  ) {
    final $$ItemsPedidoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.itemsPedido,
      getReferencedColumn: (t) => t.pedidoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ItemsPedidoTableAnnotationComposer(
            $db: $db,
            $table: $db.itemsPedido,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PedidosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PedidosTable,
          Pedido,
          $$PedidosTableFilterComposer,
          $$PedidosTableOrderingComposer,
          $$PedidosTableAnnotationComposer,
          $$PedidosTableCreateCompanionBuilder,
          $$PedidosTableUpdateCompanionBuilder,
          (Pedido, $$PedidosTableReferences),
          Pedido,
          PrefetchHooks Function({bool itemsPedidoRefs})
        > {
  $$PedidosTableTableManager(_$AppDatabase db, $PedidosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PedidosTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PedidosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PedidosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => PedidosCompanion(id: id, fecha: fecha),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime fecha,
              }) => PedidosCompanion.insert(id: id, fecha: fecha),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PedidosTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({itemsPedidoRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (itemsPedidoRefs) db.itemsPedido],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (itemsPedidoRefs)
                    await $_getPrefetchedData<
                      Pedido,
                      $PedidosTable,
                      ItemsPedidoData
                    >(
                      currentTable: table,
                      referencedTable: $$PedidosTableReferences
                          ._itemsPedidoRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PedidosTableReferences(
                                db,
                                table,
                                p0,
                              ).itemsPedidoRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.pedidoId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PedidosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PedidosTable,
      Pedido,
      $$PedidosTableFilterComposer,
      $$PedidosTableOrderingComposer,
      $$PedidosTableAnnotationComposer,
      $$PedidosTableCreateCompanionBuilder,
      $$PedidosTableUpdateCompanionBuilder,
      (Pedido, $$PedidosTableReferences),
      Pedido,
      PrefetchHooks Function({bool itemsPedidoRefs})
    >;
typedef $$ItemsPedidoTableCreateCompanionBuilder =
    ItemsPedidoCompanion Function({
      Value<int> id,
      required int pedidoId,
      required String producto,
      required String tamano,
      required String salsas,
      required String adiciones,
    });
typedef $$ItemsPedidoTableUpdateCompanionBuilder =
    ItemsPedidoCompanion Function({
      Value<int> id,
      Value<int> pedidoId,
      Value<String> producto,
      Value<String> tamano,
      Value<String> salsas,
      Value<String> adiciones,
    });

final class $$ItemsPedidoTableReferences
    extends BaseReferences<_$AppDatabase, $ItemsPedidoTable, ItemsPedidoData> {
  $$ItemsPedidoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PedidosTable _pedidoIdTable(_$AppDatabase db) =>
      db.pedidos.createAlias(
        $_aliasNameGenerator(db.itemsPedido.pedidoId, db.pedidos.id),
      );

  $$PedidosTableProcessedTableManager get pedidoId {
    final $_column = $_itemColumn<int>('pedido_id')!;

    final manager = $$PedidosTableTableManager(
      $_db,
      $_db.pedidos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pedidoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ItemsPedidoTableFilterComposer
    extends Composer<_$AppDatabase, $ItemsPedidoTable> {
  $$ItemsPedidoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get producto => $composableBuilder(
    column: $table.producto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tamano => $composableBuilder(
    column: $table.tamano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get salsas => $composableBuilder(
    column: $table.salsas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adiciones => $composableBuilder(
    column: $table.adiciones,
    builder: (column) => ColumnFilters(column),
  );

  $$PedidosTableFilterComposer get pedidoId {
    final $$PedidosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedidoId,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableFilterComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsPedidoTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsPedidoTable> {
  $$ItemsPedidoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get producto => $composableBuilder(
    column: $table.producto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tamano => $composableBuilder(
    column: $table.tamano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get salsas => $composableBuilder(
    column: $table.salsas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adiciones => $composableBuilder(
    column: $table.adiciones,
    builder: (column) => ColumnOrderings(column),
  );

  $$PedidosTableOrderingComposer get pedidoId {
    final $$PedidosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedidoId,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableOrderingComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsPedidoTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsPedidoTable> {
  $$ItemsPedidoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get producto =>
      $composableBuilder(column: $table.producto, builder: (column) => column);

  GeneratedColumn<String> get tamano =>
      $composableBuilder(column: $table.tamano, builder: (column) => column);

  GeneratedColumn<String> get salsas =>
      $composableBuilder(column: $table.salsas, builder: (column) => column);

  GeneratedColumn<String> get adiciones =>
      $composableBuilder(column: $table.adiciones, builder: (column) => column);

  $$PedidosTableAnnotationComposer get pedidoId {
    final $$PedidosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pedidoId,
      referencedTable: $db.pedidos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PedidosTableAnnotationComposer(
            $db: $db,
            $table: $db.pedidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ItemsPedidoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsPedidoTable,
          ItemsPedidoData,
          $$ItemsPedidoTableFilterComposer,
          $$ItemsPedidoTableOrderingComposer,
          $$ItemsPedidoTableAnnotationComposer,
          $$ItemsPedidoTableCreateCompanionBuilder,
          $$ItemsPedidoTableUpdateCompanionBuilder,
          (ItemsPedidoData, $$ItemsPedidoTableReferences),
          ItemsPedidoData,
          PrefetchHooks Function({bool pedidoId})
        > {
  $$ItemsPedidoTableTableManager(_$AppDatabase db, $ItemsPedidoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ItemsPedidoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ItemsPedidoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$ItemsPedidoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pedidoId = const Value.absent(),
                Value<String> producto = const Value.absent(),
                Value<String> tamano = const Value.absent(),
                Value<String> salsas = const Value.absent(),
                Value<String> adiciones = const Value.absent(),
              }) => ItemsPedidoCompanion(
                id: id,
                pedidoId: pedidoId,
                producto: producto,
                tamano: tamano,
                salsas: salsas,
                adiciones: adiciones,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pedidoId,
                required String producto,
                required String tamano,
                required String salsas,
                required String adiciones,
              }) => ItemsPedidoCompanion.insert(
                id: id,
                pedidoId: pedidoId,
                producto: producto,
                tamano: tamano,
                salsas: salsas,
                adiciones: adiciones,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ItemsPedidoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({pedidoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (pedidoId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.pedidoId,
                            referencedTable: $$ItemsPedidoTableReferences
                                ._pedidoIdTable(db),
                            referencedColumn:
                                $$ItemsPedidoTableReferences
                                    ._pedidoIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ItemsPedidoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsPedidoTable,
      ItemsPedidoData,
      $$ItemsPedidoTableFilterComposer,
      $$ItemsPedidoTableOrderingComposer,
      $$ItemsPedidoTableAnnotationComposer,
      $$ItemsPedidoTableCreateCompanionBuilder,
      $$ItemsPedidoTableUpdateCompanionBuilder,
      (ItemsPedidoData, $$ItemsPedidoTableReferences),
      ItemsPedidoData,
      PrefetchHooks Function({bool pedidoId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PedidosTableTableManager get pedidos =>
      $$PedidosTableTableManager(_db, _db.pedidos);
  $$ItemsPedidoTableTableManager get itemsPedido =>
      $$ItemsPedidoTableTableManager(_db, _db.itemsPedido);
}
