import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class Chess extends StatefulWidget {
  const Chess({Key? key}) : super(key: key);

  @override
  _Chess createState() => _Chess();
}

class _Chess extends State<Chess> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Demo'),
      ),
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.orange,
          boardOrientation: PlayerColor.white,
        ),
      ),
    );
  }
}
