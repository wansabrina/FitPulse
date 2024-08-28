import 'package:flutter/material.dart';

List<Map<String, dynamic>> meals = [
  {
    "name": "Bubur Ayam",
    "serving": "1 Serving",
    "calories": "295.2 kcal",
    "image": "assets/images/bubur.png",
    "composition": [
      {"name": "Rice Porridge", "calories": "150 kcal", "amount": "200g", "imagePath": "assets/images/porridge.png"},
      {"name": "Boiled Egg", "calories": "70 kcal", "amount": "1 pcs", "imagePath": "assets/images/egg.png"},
      {"name": "Shredded Chicken", "calories": "60 kcal", "amount": "50g", "imagePath": "assets/images/chicken.png"},
      {"name": "Fried Shallots", "calories": "20 kcal", "amount": "10g", "imagePath": "assets/images/shallots.png"},
      {"name": "Scallions", "calories": "1 kcal", "amount": "5g", "imagePath": "assets/images/scallions.png"},
      {"name": "Soy Sauce", "calories": "4 kcal", "amount": "5ml", "imagePath": "assets/images/soy.png"},
    ]
  },
  {
    "name": "Nasi Ayam Geprek",
    "serving": "1 Serving",
    "calories": "450 kcal",
    "image": "assets/images/ayamgeprek.png",
    "composition": [
      {"name": "Rice", "calories": "150 kcal", "amount": "200 gr", "imagePath": "assets/images/rice.png"},
      {"name": "Fried Chicken", "calories": "150 kcal", "amount": "300 gr", "imagePath": "assets/images/friedchicken.png"},
      {"name": "Cucumber", "calories": "150 kcal", "amount": "60 gr", "imagePath": "assets/images/cucumber.png"},
      {"name": "Tempe", "calories": "150 kcal", "amount": "80 gr", "imagePath": "assets/images/tempe.png"},
      {"name": "Sambal", "calories": "150 kcal", "amount": "50 gr", "imagePath": "assets/images/sambal.png"},
      {"name": "Selada", "calories": "150 kcal", "amount": "30 gr", "imagePath": "assets/images/selada.png"},
    ]
  },
  {
    "name": "Mushroom Pizza",
    "serving": "1 Slice",
    "calories": "450 kcal",
    "image": "assets/images/mushroompizza.png",
    "composition": [
      {"name": "Pizza Dough", "calories": "200 kcal", "amount": "100 gr", "imagePath": "assets/images/pizzadough.png"},
      {"name": "Cheese", "calories": "150 kcal", "amount": "50 gr", "imagePath": "assets/images/cheese.png"},
      {"name": "Mushroom", "calories": "100 kcal", "amount": "60 gr", "imagePath": "assets/images/mushroom.png"},
    ]
  },
  {
    "name": "Nasi Padang Ayam Gulai",
    "serving": "1 Serving",
    "calories": "780 kcal",
    "image": "assets/images/nasipadang.png",
    "composition": [
      {"name": "Rice", "calories": "200 kcal", "amount": "200 gr", "imagePath": "assets/images/rice.png"},
      {"name": "Chicken", "calories": "250 kcal", "amount": "150 gr", "imagePath": "assets/images/chicken.png"},
      {"name": "Curry Sauce", "calories": "150 kcal", "amount": "100 gr", "imagePath": "assets/images/currysauce.png"},
      {"name": "Potatoes", "calories": "180 kcal", "amount": "80 gr", "imagePath": "assets/images/potatoes.png"},
    ]
  },
  {
    "name": "Spaghetti Carbonara",
    "serving": "1 Serving",
    "calories": "600 kcal",
    "image": "assets/images/spaghetti.png",
    "composition": [
      {"name": "Spaghetti", "calories": "300 kcal", "amount": "200 gr", "imagePath": "assets/images/spaghetti.png"},
      {"name": "Cream Sauce", "calories": "200 kcal", "amount": "100 gr", "imagePath": "assets/images/creamsauce.png"},
      {"name": "Bacon", "calories": "100 kcal", "amount": "50 gr", "imagePath": "assets/images/bacon.png"},
    ]
  },
];

final List<Map<String, dynamic>> mealPlan = [
  {
    'title': 'Breakfast',
    'number': 295.2,
    'unit': 'kkal',
    'icon': Icons.wb_sunny_outlined,
  },
  {
    'title': 'Lunch',
    'number': 0.0,
    'unit': 'kkal',
    'icon': Icons.sunny,
  },
  {
    'title': 'Dinner',
    'number': 0.0,
    'unit': 'kkal',
    'icon': Icons.nights_stay,
  },
  {
    'title': 'Snack',
    'number': 0.0,
    'unit': 'kkal',
    'icon': Icons.emoji_food_beverage,
  },
];

