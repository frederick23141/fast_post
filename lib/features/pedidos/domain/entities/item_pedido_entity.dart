class ItemPedidoEntity {
  final int? id;
  final int pedidoId;
  final String producto;
  final String tamano;
  final String salsas;
  final String adiciones;

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
    String? salsas,
    String? adiciones,
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
}
