// SignUp and SignIn screen shared UI Formfields

import 'package:corvid/shared/note_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final Function(String) onChanged;
  final TextInputFormatter formatter;

  const InputField({
    @required this.controller,
    @required this.placeholder,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = false,
    this.enterPressed,
    this.additionalNote,
    this.fieldFocusNode,
    this.formatter,
    this.nextFocusNode,
    this.onChanged,
    this.textInputAction,
    this.textInputType,
    this.validationMessage
    });
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    isPassword = widget.password;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: widget.smallVersion ? 40 : fieldHeight,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: widget.isReadOnly ? 
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[100]):
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  inputFormatters: widget.formatter != null ? [widget.formatter] : null,
                  onEditingComplete: (){
                    if(widget.enterPressed != null){
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  decoration: InputDecoration.collapsed(
                      hintText: widget.placeholder,
                      hintStyle:
                          TextStyle(fontSize: widget.smallVersion ? 12 : 15)),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isPassword = !isPassword;
                }),
                child: widget.password
                    ? Container(
                        width: fieldHeight,
                        height: fieldHeight,
                        alignment: Alignment.center,
                        child: Icon(isPassword
                            ? Icons.visibility
                            : Icons.visibility_off))
                    : Container(),
              ),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          NoteText(
            widget.validationMessage,
            color: Colors.red,
          ),
        if (widget.additionalNote != null) SizedBox(height:5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote),
        SizedBox(height:10)
      ],
    );
  }
}