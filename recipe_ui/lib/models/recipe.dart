class Recipe {
  String name, author, picUrl, resUrl;
  List ingredients;
  List instructions;
  int cookTime, servings, reviews;
  int? prepTime, calories;
  Recipe({
    required this.name,
    required this.author,
    required this.picUrl,
    required this.resUrl,
    // this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.reviews,
    required this.ingredients,
    required this.instructions,
    // this.calories,
  });
}

List<Map> recipeJson = [
  {
    'name': 'Holiday Lentil Mushroom Loaf in Puff Pastry',
    'author': 'Liv B',
    'resUrl': 'https://itslivb.com/2021/10/29/holiday-lentil-mushroom-loaf-in-puff-pastry/',
    'picUrl': 'assets/LentilMushroomLoaf.jpg',
    // 'prepTime': 10,
    'cookTime': 50,
    'servings': 8,
    'reviews': 6,
    // 'calories': '',
    'ingredients': [
      '2 tbsp oil',
      '1/2 onion, diced',
      '4 cloves garlic, minced',
      '1/2 tsp fennel seeds',
      '1/2 tbsp dried sage',
      '1/2 tsp dried thyme',
      'pinch of salt and pepper',
      '2 cups diced button mushrooms',
      '1 tbsp soy sauce',
      '1 can brown lentils, drained and rinsed',
      '1 cup vital wheat gluten',
      '1/2 cup vegetable, or vegan beef-flavoured broth',
      '1 package puff pastry',
      'optional: fresh thyme for garnish',
    ],
    'instructions': [
      'Ensure you have thawed the puff pastry fully before starting the recipe. I like to put mine in the fridge overnight to thaw, or about 4 hours on the counter works too.',
      'Preheat oven to 375F. Line a baking sheet with parchment paper.',
      'In a large frying pan on medium-high heat, add the oil, onion, garlic, fennel, thyme and sage. Cook a few minutes, until onion starts to become translucent.',
      'Add the mushrooms, salt pepper and and soy sauce and cook another 3 minutes, until mushrooms start to soften. Add the lentils and cook, stirring frequently, for 5 minutes, until mushrooms are cooked and softened.',
      'Add to a large mixing bowl. Add the gluten and broth and mix until it comes together in a spongey sort of dough.',
      'Roll out the puff pastry to a large rectangle about 18 inches by 12 inches. Place it on the prepared sheet pan.',
      'Place the filling into the center in a log shape, forming it with your hands. Wrap the puff pastry up and over, pinching the edges to seal. Use a sharp knife to slice a few slits in the top for steam to escape.',
      'Bake 35 minutes, or until golden brown on top and slightly firm to the touch.',
      'Let cool about 5-10 minutes before slicing and serving.',
    ],
  },
  {
    'name': 'Vegan Pulp Fiction',
    'author': 'Thee Burger Dude',
    'resUrl': 'https://www.theeburgerdude.com/post/vegan-pulp-fiction',
    'picUrl': 'assets/VeganPulpFiction.webp',
    // 'prepTime': ,
    'cookTime': 20,
    'servings': 1,
    'reviews': 6,
    // 'calories': '',
    'ingredients': [
      '1/2 cup vegan mayo',
      '2 Tbsp sriracha',
      '1 Tbsp pineapple juice',
      '2 Tbsp diced pickled jalapenos',
      '1/4 tsp onion powder',
      '1/4 tsp garlic powder',
      'Salt and pepper to taste',
      '1 burger bun ',
      'Two (3 oz. patties) (like Beyond or Impossible)',
      'Tomato (sliced)',
      'Iceberg lettuce',
      '2 slices vegan cheese (American if possible)',
      'Dill pickle slices',
    ],
    'instructions': [
      'Toast your burger buns on a pan over medium heat, set aside on wire rack.',
      'Grill burger patties over medium heat, brush with soy ginger pineapple glaze, once browned on one side, flip them, brush with more glaze, top with vegan cheese, then cover to melt (you can add a few drops of water to the pan to help them steam and melt).',
      'Assemble burger from bottom to top as follows: bottom bun, sweet and spicy burger sauce, pickles, lettuce, cheeseburger patty, tomato slice, cheeseburger patty, more sauce, top bun! You can put the tomato slice wherever you like, I dug it in the middle, but I would suggest wrapping your burger so it doesn\'t slip too much!',
    ],
  },
];
