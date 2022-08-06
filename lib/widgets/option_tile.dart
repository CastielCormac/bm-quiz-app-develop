import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  const OptionTile({
    Key? key,
    required this.option,
    required this.optionSelected,
    required this.description,
    required this.correctAnswer,
    required this.isDone,
  }) : super(key: key);

  final String option;
  final String optionSelected;
  final String description;
  final bool correctAnswer;
  final bool isDone;

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 28,
      width: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isDone
              ? widget.correctAnswer
                  ? Colors.green.withOpacity(0.7)
                  : widget.optionSelected == widget.description
                      ? Colors.red.withOpacity(0.7)
                      : Colors.grey
              : widget.optionSelected == widget.description
                  ? Colors.green.withOpacity(0.7)
                  : Colors.grey,
          width: 2.0,
        ),
        color: widget.isDone
            ? widget.correctAnswer
                ? Colors.green.withOpacity(0.7)
                : widget.optionSelected == widget.description
                    ? Colors.red.withOpacity(0.7)
                    : Colors.white
            : widget.optionSelected == widget.description
                ? Colors.green.withOpacity(0.7)
                : Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        widget.option,
        style: TextStyle(
          fontSize: 17,
          color: widget.optionSelected == widget.description
              ? Colors.white
              : Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
