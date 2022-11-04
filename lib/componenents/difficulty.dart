
import 'package:flutter/material.dart';
//parte de dificuldade do app colocar estrelas e barra de dificuldade
class Difficulty extends StatelessWidget {
  final int dificuldadeLevel;
  const Difficulty({
    required this.dificuldadeLevel,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,size: 15,color:(dificuldadeLevel >= 1) ? Colors.blue: Colors.blue[100]),
        Icon(Icons.star,size: 15,color:(dificuldadeLevel >= 2) ? Colors.blue: Colors.blue[100]),
        Icon(Icons.star,size: 15,color:(dificuldadeLevel >= 3) ? Colors.blue: Colors.blue[100]),
        Icon(Icons.star,size: 15,color:(dificuldadeLevel >= 4) ? Colors.blue: Colors.blue[100]),
        Icon(Icons.star,size: 15,color:(dificuldadeLevel >= 5) ? Colors.blue: Colors.blue[100]),
      ],
    );
  }
}