import 'package:flutter/material.dart';

class Trader {
  String name;
  String city;
  Trader(this.name, this.city);
}
class Transaction {
  Trader trader;
  int year;
  int value;
  Transaction(this.trader, this.year, this.value);
}


// 1. 2011년에 일어난 모든 트랙잭션을 찾아 값을 오름차순으로 정리하시오
// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하시오
// 4. 모든 거래자의 이름을 알파벳순으로 정렬해서 반환하시오
// 5. 밀라노에 거래자가 있는가?
// 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
// 7. 전체 트랜잭션 중 최댓값을 얼마인가?
// 8. 전체 트랜잭션 중 최솟값은 얼마인가?


class QuizPage extends StatelessWidget {
  @override
  List<Transaction> transactions = [
    Transaction(Trader('Brian', 'Cambridge'), 2011, 300),
    Transaction(Trader("Raoul", 'Cambridge'), 2012, 1000),
    Transaction(Trader('Raoul', 'Cambridge'), 2011, 400),
    Transaction(Trader('Mario', 'Milan'), 2012, 710),
    Transaction(Trader('Mario', 'Milan'), 2012, 700),
    Transaction(Trader('Alan', 'Cambridge'), 2012, 950),
  ];
  String _quiz1() {
    transactions.sort((a, b) =>
        a.value.compareTo(b.value));
    return transactions.where((element) => element.year==2011).toString();
  }

  String _quiz3() {
    transactions.sort((a, b) =>
        a.trader.name.toLowerCase().compareTo(b.trader.name.toLowerCase()));
    return transactions.map((e) => e.trader.name).toList().toString();
  }

  String _quiz4() {
    transactions.sort((a, b) =>
        a.trader.name.toLowerCase().compareTo(b.trader.name.toLowerCase()));
    return transactions.toString();
  }


  Widget build(BuildContext context) {

    return Center(child: Column(children: [
      Text('1. $_quiz1'),
      Text('2. ${transactions.where((data) => data.trader.city == 'Cambridge')
          .toString()}'),
      Text('3. $_quiz3'),
      Text('4. $_quiz4'),
      Text('5. 밀라노에는 거래자가 ${transactions
          .where((data) => data.trader.city == 'Milan')
          .isEmpty ? '없습니다' : '있습니다'}'),
      Text('6. ${transactions.where((data) => data.trader.city == 'Cambridge')
          .toString()}'),
      Text('7. ${transactions.reduce((value, element) => value.value >
          element.value ? value : element).toString()}'),
      Text('8. ${transactions.reduce((value, element) => value.value <
          element.value ? value : element).toString()}'),
    ],));
  }
}