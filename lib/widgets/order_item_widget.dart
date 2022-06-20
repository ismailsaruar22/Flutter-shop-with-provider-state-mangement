import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class OrderedItemWidget extends StatefulWidget {
  final OrderItem order;
  const OrderedItemWidget(this.order);

  @override
  State<OrderedItemWidget> createState() => _OrderedItemWidgetState();
}

class _OrderedItemWidgetState extends State<OrderedItemWidget> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('\$${widget.order.amount}'),
          subtitle: Text(
            DateFormat('dd/ MM/ yyyy    hh:mm').format(widget.order.dateTime),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: min(widget.order.products.length * 20.0 + 10, 100),
            child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${prod.quantity}* \$${prod.price}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ))
                    .toList()),
          )
      ]),
    );
  }
}
