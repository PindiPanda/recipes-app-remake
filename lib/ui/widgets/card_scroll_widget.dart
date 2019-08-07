import 'package:flutter/material.dart';
import 'package:recipes_app/util/store.dart';
import 'package:recipes_app/model/recipe.dart';
import 'dart:math';

var cardAspectRatio = 3 / 4;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  List<Recipe> recipes = getRecipes();
  var currentPage;
  var padding = 10.0;
  var verticalInset = 20.0;

  final Recipe recipe;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  CardScrollWidget({
    @required this.currentPage,
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

    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < recipes.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;
          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);
          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: AspectRatio(
              aspectRatio: cardAspectRatio,
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
                        image: NetworkImage(recipes[i].imageURL),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3.0, 6.0),
                          blurRadius: 10.0),
                    ],
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
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

/*Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: widthOfPrimaryCard,
                    height: heightOfPrimaryCard / 5,
                    color: Theme.of(context).accentColor,
                    child: Column(
                      children: <Widget>[
                        Text(
                          recipes[i].name,
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          recipes[i].duration.toString(),
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                  ),
                ),*/
