import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapShot.error != null) {
            //error handle
            return Center(child: CircularProgressIndicator());
            
          }
          else {
            return Consumer<Orders>( builder: (ctx, orderData, child) =>ListView.builder(
                  itemBuilder: (ctx, i) {
                    return OrderItem(orderData.orders[i]);
                  },
                  itemCount: orderData.orders.length,
                ),
            );
          }
        } 
      ),
    );
  }
}
