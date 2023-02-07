import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  const Instruction({super.key, required this.title, required this.instruction});

  final String title, instruction;

  @override
  State<Instruction> createState() => _InstructionState();
}
class _InstructionState extends State<Instruction> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          widget.instruction,
          style: TextStyle(
              fontSize: 16
          ),
        ),
      )

    );
  }
}