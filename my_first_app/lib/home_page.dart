import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_app/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cardList = ["A", "K", "Q", "J"];
  List<String> showCardList = [];
  int _timer = 1000;

  Timer? timeController;

  @override
  void initState() {
    super.initState();

    cardList.shuffle();

    timeController = Timer.periodic(
      Duration(milliseconds: 10),(timer){
        if(_timer > 0){
          setState(() {
          _timer -= 1;
          });
        }
      }
    );
  }

  void onClickCard(String title){
    if(title =="A"){
      timeController?.cancel();
    }
    setState(() {
      showCardList.add(title);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Time: $_timer",
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              ),
            ),
          SizedBox(
            height:50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myCard(
                cardList[0],
                active: showCardList.contains(cardList[0]),
                onTap: onClickCard,
              ),
              const SizedBox(width: 50),
              myCard(
                cardList[1],
                active: showCardList.contains(cardList[0]),
                onTap: onClickCard,

              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myCard(
                cardList[2],
                active: showCardList.contains(cardList[0]),
                onTap: onClickCard,

                ),
              const SizedBox(width: 50),
              myCard(
                cardList[3],
                active: showCardList.contains(cardList[0]),
                onTap: onClickCard,

                ),
            ],
          ),
        ],
      ),
    );
  }
}
