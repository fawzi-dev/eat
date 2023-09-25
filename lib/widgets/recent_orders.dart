import 'package:eat/data/data.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
        SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildRecentOrders(),
          ),
        )
      ],
    );
  }

  Widget buildRecentOrders() {
    const double cardSize = 100;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: currentUser.orders.length,
      itemBuilder: (BuildContext context, int index) {
        final textStyle = Theme.of(context).textTheme;
        // Orders
        final orders = currentUser.orders[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(width: 1.5, color: Colors.black12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    orders.food.imageUrl,
                    fit: BoxFit.cover,
                    width: cardSize,
                    height: cardSize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orders.food.name,
                        style: textStyle.titleMedium,
                      ),
                      Text(
                        orders.restaurant.name,
                        style: textStyle.bodyMedium,
                      ),
                      Text(
                        orders.date,
                        style: textStyle.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  heroTag: 'Hero $index',
                  onPressed: () {},
                  elevation: 0.0,
                  child: Icon(Icons.add),
                ),
                const SizedBox(
                  width: 8.0,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
