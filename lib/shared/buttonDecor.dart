// shared Buttons for all Auths 

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Buttons extends StatefulWidget {

  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;

  const Buttons({@required this.title, this.busy = false, this.enabled = true, @required this.onPressed});

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.busy ? 40 : null,
          width: widget.busy ? 40 : null,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: widget.busy ? 10 : 10,
            vertical: widget.busy ? 10 : 10,
          ),
          decoration: BoxDecoration(
            color: widget.enabled ? Colors.green[300] : Colors.green[200],
            borderRadius: BorderRadius.circular(5),
          ),
          child: !widget.busy ? 
          Text(widget.title,style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),)
          : CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
        ),
      ),
    );
  }
}