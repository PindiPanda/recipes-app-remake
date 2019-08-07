import 'package:recipes_app/model/recipe.dart';

List<Recipe> getRecipes(){
  return[
    Recipe(
      id: '0',
      type: RecipeType.food,
      name: 'Oatmeal Muffins',
      servings: '12-14 muffins',
      duration: Duration(hours: 1),
      ingredients: [
        '2 1/2 cups toasted oats',
        '2-3 large overripe bananas (or 1 cup applesauce)'
        '2 large eggs',
        '1/3 cup honey or maple syrup',
        '3/4 cup milk',
        '2 t vanilla',
        '2 t baking powder',
        '1/2 t baking soda',
        '1/2 t salt',
        '1 t cinnamon',
        '1/2 cup chocolate chips',
      ],
      preparation: [
        'toast oats on baking sheet @325 for 4-6 min',
        'blend 1.5 cups of oats',
        'mix wet ingredients, add dry ingredients, and let sit for ~10 min',
        'scoop into muffin tin and bake @350 for 20-23 min (until a tooth pick comes out clean)',
      ],
      notes: [
        '1/2 cup of chocolate chips is ~7-8 chips per muffin: divide evenly and fold in',
        "DO NOT forget to bring one of these for your Everything each morning",
      ],
      imageURL: 'https://brendid.com/wp-content/uploads/2017/05/Healthy-Oatmeal-Muffins-from-Bren-Did-2-2.jpg',
    ),
    Recipe(
      id: '1',
      type: RecipeType.food,
      name: 'Pasta Al Pomodoro',
      servings: '4',
      duration: Duration(hours: 1),
      ingredients: [
        '1/4 cup olive oil',
        '1 medium onion, finely chopped',
        '4 garlic cloves, finely chopped',
        'Pinch of crushed red pepper flakes',
        '1 28-ounce can whole peeled tomatoes, puréed in a food processor',
        'Kosher salt',
        '3 large sprigs basil',
        '12 ounces bucatini or spaghetti',
        '2 T unsalted butter, cut into pieces',
        '1/4 cup finely grated Parmesan or Pecorino',
      ],
      preparation: [
        'heat olive oil in large pan over medium low heat',
        'add onion and cook until soft ~12 min',
        'add garlic and cook ~4-6 min',
        'add crushed red pepper and cook ~1 min',
        'increase heat to medium, add pureed tomatoes and season with salt',
        'cook until sauce thickens and the "flavors get to know eachother" ~20 min',
        'remove from heat and stir in basil',
        '(under) cook pasta and reserve 1/2 cup water',
        'discard basil and over high heat add pasta & water to sauce',
        'remove from heat and add butter & parmesan tossing until they melt',
      ],
      notes: [
        'feel free to add vegetables or meat!',
      ],
      imageURL: 'https://assets.bonappetit.com/photos/57b000ccf1c801a1038bd5fc/16:9/w_1028,c_limit/mare-pasta-al-pomodoro-h.jpg',
    ),
    Recipe(
      id: '2',
      type: RecipeType.dessert,
      name: 'Oatmeal Cookies',
      duration: Duration(minutes: 15),
      servings: '1 pan',
      ingredients: [
        '1 cup butter, softened',
        '1 cup sugar, mixnmatch',
        '2 eggs',
        '1 t vanilla',
        '1 t baking soda',
        '1 cup flour',
        '2 cups oats + more',
        '"feel" the chocolate chips',
      ],
      preparation: [
        'cream together butter & sugar',
        'add eggs & vanilla',
        'add baking soda',
        'add flour',
        'add oats',
        'add chocoalte chips',
        'butter baking pan (with butter wrappers)',
        'bake @350 for 12-18 mins (until golden brown)'
      ],
      notes: [
        'DO NOT FORGET THE CINNAMON'
      ],
      imageURL: 'https://www.meatloafandmelodrama.com/wp-content/uploads/2018/10/best-oatmeal-chocolate-chip-cookies-dough.jpg',
    ),
    Recipe(
      id: '3',
      type: RecipeType.dessert,
      name: 'Chocolate Cookies',
      servings: '33 cookies',
      duration: Duration(minutes: 25),
      ingredients: [
        '2 1/3 cups all-purpose flour',
        '1 t baking soda',
        '1/2 t sea salt',
        '3/4 cup Dutch processed cocoa',
        '1 cup unsalted butter at room temperature',
        '1 cup granulated sugar',
        '1 cup light brown sugar',
        '2 large eggs at room temperature',
        '1 t vanilla extract',
        '1 cup chocolate chips',
        '1 cup chocolate chunks',
        '3/4 cup chocolate baking wafers or big chocolate chunks',
        'Sea salt flakes for sprinkling on cookies ',
      ],
      preparation: [
        'Preheat oven to 350 degrees F. Line a baking sheet with parchment paper or Silpat baking mat or parchment paper. Set aside.',
        'In a medium bowl, whisk together flour, baking soda, sea salt, and cocoa. Set aside.',
        'With a mixer, cream butter and sugars together until smooth. Add in eggs, one at a time. Next, add in vanilla extract and mix until combined.',
        'Gradually add flour mixture and beat until just combined. Stir in the chocolate chips and chocolate chunks. Scoop the dough into rounded tablespoons and place on prepared baking sheet, about 2 inches apart. Bake cookies for 8 minutes and remove the baking sheet from the oven. Quickly press the chocolate wafers or big chocolate chunks gently into the tops of the cookies. Place the baking sheet back in the oven and finish baking the cookies for an additional 2 minutes or until the cookies are set around the edges but still soft in the center.',
        'Remove from oven and let sit on baking sheet for 3 minutes. Move to a cooling rack and cool completely.',
      ],
      notes: [
        'Still turns out great if you replace chocolate chunks with chocolate chips and press squares of your darkest chocolate bar into the cookies inseta of baking wafers',
      ],
      imageURL: 'https://www.twopeasandtheirpod.com/wp-content/uploads/2019/01/Ultimate-Chocolate-Cookies-2.jpg',
    ),
  ];
}

List<String> getFavoritesIDs(){
  return [
    '0',
    '2',
    '3',
  ];
}