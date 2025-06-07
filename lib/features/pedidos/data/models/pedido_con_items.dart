import 'package:fast_post/core/database/app_database.dart';
// necesario para PedidosData y ItemsPedidoData

class PedidoConItems {
  final Pedido pedido;
  final List<ItemsPedidoData> items;

  PedidoConItems(this.pedido, this.items);
}
