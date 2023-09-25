import 'package:eat/models/restaurant.dart';
import 'package:flutter/material.dart';

import '../widgets/rating.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.resturants});

  final Restaurant resturants;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  resturants.imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 18.0),
                child: Row(
                  children: [
                    CustomButton(
                        heroTag: 'arrow back',
                        icon: Icons.arrow_back,
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    const Spacer(),
                    CustomButton(
                      heroTag: 'fav',
                      icon: Icons.favorite_outline,
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
          ResturantDescriptionWidget(
            resturants: resturants,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomMaterialButton(
                label: 'Reviews',
              ),
              CustomMaterialButton(
                label: 'Contact',
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Menu',
                style: textTheme.headlineMedium!.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
                itemCount: resturants.menu.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(resturants.menu[index].imageUrl),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: Colors.black38,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        resturants.menu[index].name,
                                        style:
                                            textTheme.headlineMedium!.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.visible,
                                      ),
                                      Text(
                                        '\$${resturants.menu[index].price.toString()}',
                                        style:
                                            textTheme.headlineMedium!.copyWith(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FloatingActionButton(
                                      heroTag: 'Tag $index',
                                      onPressed: () {},
                                      child: const Icon(Icons.add_rounded),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class ResturantDescriptionWidget extends StatelessWidget {
  const ResturantDescriptionWidget({super.key, required this.resturants});

  final Restaurant resturants;

  final double spaceBetweenTexts = 6;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                resturants.name,
                style: textTheme.headlineMedium!.copyWith(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '0.3 miles away',
                style: textTheme.headlineMedium!.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: spaceBetweenTexts,
          ),
          Text(
            getRating(resturants.rating),
            style: const TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: spaceBetweenTexts,
          ),
          Text(
            resturants.address,
            style: textTheme.headlineMedium!.copyWith(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.heroTag,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      highlightElevation: 0.0,
      elevation: 0.0,
      onPressed: onTap,
      child: Icon(icon),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: MaterialButton(
        height: 60,
        minWidth: 180,
        color: Colors.deepOrange,
        elevation: 0.0,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
