// Food
import '../models/food.dart';
import '../models/order.dart';
import '../models/restaurant.dart';
import '../models/user.dart';

final _burrito = Food(imageUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);
final _steak = Food(imageUrl: 'assets/images/steak.jpg', name: 'Steak', price: 17.99);
final _pasta = Food(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 14.99);
final _ramen = Food(imageUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 13.99);
final _pancakes = Food(imageUrl: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 9.99);
final _burger = Food(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 14.99);
final _pizza = Food(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99);
final _salmon = Food( imageUrl: 'assets/images/salmon.jpg', name: 'Salmon Salad', price: 12.99);

// Restaurants
final List<Restaurant> restaurants = [
  Restaurant(
    imageUrl: 'assets/images/restaurant0.jpg',
    name: 'Restaurant 0',
    address: '200 Main St, New York, NY',
    rating: 5,
    menu: [
      _burrito,
      _steak,
      _pasta,
      _ramen,
      _pancakes,
      _burger,
      _pizza,
      _salmon,
      
    ],
  ),
  Restaurant(
    imageUrl: 'assets/images/restaurant1.jpg',
    name: 'Restaurant 1',
    address: '200 Main St, New York, NY',
    rating: 4,
    menu: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza],
  ),
  Restaurant(
    imageUrl: 'assets/images/restaurant2.jpg',
    name: 'Restaurant 2',
    address: '200 Main St, New York, NY',
    rating: 4,
    menu: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon],
  ),
  Restaurant(
    imageUrl: 'assets/images/restaurant3.jpg',
    name: 'Restaurant 3',
    address: '200 Main St, New York, NY',
    rating: 2,
    menu: [_burrito, _steak, _burger, _pizza, _salmon],
  ),
  Restaurant(
    imageUrl: 'assets/images/restaurant4.jpg',
    name: 'Restaurant 4',
    address: '200 Main St, New York, NY',
    rating: 3,
    menu: [_burrito, _ramen, _pancakes, _salmon],
  ),
];

// User
final currentUser = User(
  name: 'Rebecca',
  orders: [
    Order(
      date: 'Nov 10, 2019',
      food: _steak,
      restaurant: restaurants[0],
      quantity: 1,
    ),
    Order(
      date: 'Nov 8, 2019',
      food: _ramen,
      restaurant: restaurants[1],
      quantity: 3,
    ),
    Order(
      date: 'Nov 5, 2019',
      food: _burrito,
      restaurant: restaurants[2],
      quantity: 2,
    ),
    Order(
      date: 'Nov 2, 2019',
      food: _salmon,
      restaurant: restaurants[3],
      quantity: 1,
    ),
    Order(
      date: 'Nov 1, 2019',
      food: _pancakes,
      restaurant: restaurants[3],
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      date: 'Nov 11, 2019',
      food: _burger,
      restaurant: restaurants[1],
      quantity: 2,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pasta,
      restaurant: restaurants[1],
      quantity: 1,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _salmon,
      restaurant: restaurants[3],
      quantity: 1,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _pancakes,
      restaurant: restaurants[3],
      quantity: 3,
    ),
    Order(
      date: 'Nov 11, 2019',
      food: _burrito,
      restaurant: restaurants[0],
      quantity: 2,
    ),
  ],
);
