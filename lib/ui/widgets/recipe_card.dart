import 'package:flutter/material.dart';

import 'package:recipes_app/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  RecipeCard({
    @required this.recipe,
    @required this.inFavorites,
    @required this.onFavoriteButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(recipe.id),
        child: Icon(
          inFavorites == true ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).iconTheme.color,
        ),
        elevation: 2.0,
        fillColor: Theme.of(context).buttonColor,
        shape: CircleBorder(),
      );
    }

    Container _buildTitleSection() {
      return Container(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                recipe.name,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    size: 15.0,
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    recipe.getDurationString,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => print("Tapped!"),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(5),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(recipe.imageURL), fit: BoxFit.cover),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: _buildFavoriteButton(),
                  top: 2.5,
                  right: 2.5,
                ),
                Positioned.directional(
                  bottom: 0,
                  start: -1,
                  end: -1,
                  textDirection: TextDirection.ltr,
                  child: _buildTitleSection(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
