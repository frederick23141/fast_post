class ItemPedidoEntity {
  final int id;
  final int pedidoId;
  final String producto;
  final String tamano;
  final String salsas;
  final String adiciones;

  ItemPedidoEntity({
    required this.id,
    required this.pedidoId,
    required this.producto,
    required this.tamano,
    required this.salsas,
    required this.adiciones,
  });
}
