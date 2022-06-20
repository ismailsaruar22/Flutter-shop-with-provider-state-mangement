import 'package:flutter/material.dart';
import 'package:flutter_shop_app_with_provider/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../widgets/order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  static const routName = 'orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) => OrderedItemWidget(
          orderData.orders[i],
        ),
      ),
    );
  }
}
