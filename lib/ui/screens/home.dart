import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:recipes_app/model/recipe.dart';
import 'package:recipes_app/util/store.dart';
import 'package:recipes_app/ui/widgets/recipe_card.dart';

import 'package:recipes_app/ui/widgets/card_scroll_widget.dart';
import 'package:recipes_app/ui/header_delegate.dart';

import 'package:recipes_app/model/state.dart';
import 'package:recipes_app/state_widget.dart';
import 'package:recipes_app/ui/screens/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  StateModel appState;
  List<Recipe> recipes = getRecipes();
  List<String> userFavorites = getFavoritesIDs();
  var currentPage = getRecipes().length - 1.0;

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      //floating: true,
      delegate: SliverAppBarDelegate(
        minHeight: 50,
        maxHeight: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor,
                //color: Colors.black38,
                blurRadius: 2.0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              headerText,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        ),
      ),
    );
  }

  DefaultTabController _buildTabView({Widget body}) {
    double _iconSize = 20.0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 2,
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "JP's Recipes",
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: Theme.of(context).indicatorColor,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.book, size: _iconSize)),
                Tab(icon: Icon(Icons.create, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(0),
          child: body,
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () => print('new'),
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).indicatorColor,
        ),*/
    );
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildTabView(
        body: _buildLoadingIndicator(),
      );
    } else if (!appState.isLoading && appState.user == null) {
      return new LoginScreen();
    } else {
      return _buildTabView(body: _buildTabsContent());
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  TabBarView _buildTabsContent() {
    PageController pageController =
        PageController(initialPage: recipes.length - 1);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    Padding _buildRecipes(List<Recipe> recipesList) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Container(
          child: CustomScrollView(
            slivers: [
              makeHeader('Recently Added'),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return RecipeCard(
                    recipe: recipesList[index],
                    inFavorites: userFavorites.contains(recipesList[index].id),
                    onFavoriteButtonPressed: _handleFavoritesListChanged,
                  );
                }, childCount: recipesList.length),
              ),
              makeHeader('Favorites'),
              SliverList(
                delegate: SliverChildListDelegate([
                  Stack(
                    children: <Widget>[
                      CardScrollWidget(
                        currentPage: currentPage,
                        recipe: recipesList[0],
                        inFavorites: userFavorites.contains(recipesList[0].id),
                        onFavoriteButtonPressed: _handleFavoritesListChanged,
                      ),
                      Positioned.fill(
                        child: PageView.builder(
                          itemCount: recipes.length,
                          controller: pageController,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              makeHeader('All'),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(0),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: RecipeCard(
                          recipe: recipesList[index],
                          inFavorites:
                              userFavorites.contains(recipesList[index].id),
                          onFavoriteButtonPressed: _handleFavoritesListChanged,
                        ),
                      ),
                    );
                  },
                  childCount: recipesList.length,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return TabBarView(children: <Widget>[
      _buildRecipes(recipes.toList()),
      Center(
          child: Icon(
        CupertinoIcons.bookmark_solid,
        size: 100,
      )),
      Center(
          child: Icon(
        CupertinoIcons.create,
        size: 100,
      )),
      Center(
          child: Icon(
        CupertinoIcons.settings,
        size: 100,
      )),
    ]);
  }

  void _handleFavoritesListChanged(String recipeID) {
    setState(() {
      if (userFavorites.contains(recipeID)) {
        userFavorites.remove(recipeID);
      } else {
        userFavorites.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    return _buildContent();
  }
}
