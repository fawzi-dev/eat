import 'package:eat/data/data.dart';
import 'package:eat/screens/menu_screen.dart';
import 'package:eat/widgets/rating.dart';
import 'package:flutter/material.dart';

class Resturants extends StatelessWidget {
  const Resturants({super.key});

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
            'Nearby Resturants',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: buildRecentOrders(),
        )
      ],
    );
  }

  Widget buildRecentOrders() {
    const double cardSize = 180;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: restaurants.length,
      itemBuilder: (BuildContext context, int index) {
        final textStyle = Theme.of(context).textTheme;
        // Orders
        final resturantsVar = restaurants[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuScreen(
                    resturants: restaurants[index],
                  ),
                ),
              );
            },
            child: Container(
              height: 180,
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
                      resturantsVar.imageUrl,
                      fit: BoxFit.cover,
                      width: cardSize,
                      height: cardSize,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resturantsVar.name,
                            style: textStyle.headlineMedium!.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            getRating(resturantsVar.rating),
                            style: textStyle.headlineMedium!.copyWith(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              resturantsVar.address,
                              style: textStyle.headlineSmall!
                                  .copyWith(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '0.3 miles away',
                            style: textStyle.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
