import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resturant_ui/core/data/data.dart';
import 'package:resturant_ui/ui/shared/ui_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController _controller;
  AnimationController animationController;
  Animation<double> fadeImageAnimation;
  Animation<double> fadeTextAnimation;
  int currentIndex = 0;
  double value = 1;
  double rotateValue = 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      keepPage: true,
    );
    animationController = new AnimationController(
        duration: Duration(seconds: 1,),
        vsync: this);

    fadeImageAnimation = Tween(
      begin: 0.0,
      end: 0.3,
    ).animate(
        CurvedAnimation(parent: animationController,
         curve: Curves.easeIn));
    fadeImageAnimation.addListener(() {
      this.setState(() {});
    });

    fadeTextAnimation = Tween(
      begin: 0.0,
      end: 0.9,
    ).animate(CurvedAnimation(
        parent: animationController, 
        curve: Curves.easeInOutCirc));
    fadeTextAnimation.addListener(() {
      this.setState(() {});
    });

    animatedForward();
  }

  void animatedForward() {
    animationController.forward(
      from: 0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment(0, -2),
            child: FractionallySizedBox(
              heightFactor: 0.7,
              widthFactor: 1.4,
              alignment: Alignment.topCenter,
              child: FadeTransition(
                  opacity: fadeImageAnimation,
                  child: Container(
                    child: Transform.rotate(
                      angle: rotateValue * 2 * pi,
                      child: Image.asset(
                        allFoodData[currentIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  pageSnapping: true,
                  controller: _controller,
                  onPageChanged: (index) {
                    animatedForward();
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: allFoodData.length,
                  itemBuilder: (_, int index) {
                    return itemBuilder(index);
                  },
                ),
              ),
              UIhelper.verdicalSpaceVsmall,
              detailsBuilder(currentIndex),
            ],
          )
        ],
      ),
    );
  }

  Widget itemBuilder(index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        value = _controller.page - index;
        rotateValue = value;
        value = (1 - value.abs() * 0.5).clamp(0.0, 1.0);
        return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Curves.easeIn.transform(value) * 400,
                child: Transform.rotate(
                  angle: rotateValue * pi,
                  child: Image.asset(
                    allFoodData[index],
                    fit: BoxFit.contain,
                  ),
                )));
      },
    );
  }

   Widget detailsBuilder(index) {
    return Container(
        child: Column(
      children: <Widget>[
        FadeTransition(
          opacity: fadeTextAnimation,
          child: Column(
            children: <Widget>[
              Text(
                detailsList[index].title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Georgia'),
              ),
              UIhelper.verdicalSpacesmall,
              Text(
                detailsList[index].price,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              UIhelper.verdicalSpacesmall
            ],
          ),
        ),
        Container(
            height: 65,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black,
            ),
            child: Center(
              child: Text(
                'Add To Cart',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )),
        UIhelper.verdicalSpaceMedium,
        Text(
          'Swipe To See Recipe',
          style: TextStyle(fontSize: 15, color: Colors.black45),
        ),
        UIhelper.verdicalSpaceMedium,
        UIhelper.verdicalSpacesmall,
      ],
    ));
  }
}
