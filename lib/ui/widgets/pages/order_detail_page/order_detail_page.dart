import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/decorated_page_scaffold.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double doubleTopPadding = MediaQuery.of(context).padding.top;

    return DecoratedPageScaffold(
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.green,
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              height: doubleTopPadding == 0
                  ? 60
                  : doubleTopPadding + 40
          ),
          Text('hello'),
          // Container(height: 400, width: 300, color: Colors.red,)
        ],
      )
    );
  }
}
