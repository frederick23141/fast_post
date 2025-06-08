import 'package:drift/drift.dart' as drift;
import 'package:fast_post/core/database/app_database.dart';
import 'package:path/path.dart';

class ItemPedidoEntity {
  final int? id;
  final int pedidoId;
  final String producto;
  final String tamano;
  final List<String> salsas;
  final List<String> adiciones;

  ItemPedidoEntity({
    this.id,
    required this.pedidoId,
    required this.producto,
    required this.tamano,
    required this.salsas,
    required this.adiciones,
  });

  ItemPedidoEntity copyWith({
    int? id,
    int? pedidoId,
    String? producto,
    String? tamano,
    List<String>? salsas,
    List<String>? adiciones,
  }) {
    return ItemPedidoEntity(
      id: id ?? this.id,
      pedidoId: pedidoId ?? this.pedidoId,
      producto: producto ?? this.producto,
      tamano: tamano ?? this.tamano,
      salsas: salsas ?? this.salsas,
      adiciones: adiciones ?? this.adiciones,
    );
  }

  ItemsPedidoCompanion toCompanion() {
    return ItemsPedidoCompanion(
      producto: drift.Value(producto),
      tamano: drift.Value(tamano),
      salsas: drift.Value(salsas?.join(',') ?? ''),
      adiciones: drift.Value(adiciones?.join(',') ?? ''),
    );
  }
}
