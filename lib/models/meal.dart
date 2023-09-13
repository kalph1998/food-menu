enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    this.imageUrl =
        'https://images.pexels.com/photos/10897655/pexels-photo-10897655.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    this.rating = 0,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final int rating;

  Map<String, dynamic> toJson() => {
        'categories': categories,
        'title': title,
        'imageUrl': imageUrl,
        'ingredients': ingredients,
        'steps': steps,
        'duration': duration,
        'complexity': complexity,
        'affordability': affordability,
        'isGlutenFree': isGlutenFree,
        'isLactoseFree': isLactoseFree,
        'isVegan': isVegan,
        'isVegetarian': isVegetarian,
        'rating': rating
      };
}
