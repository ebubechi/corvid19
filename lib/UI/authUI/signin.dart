import 'package:corvid/shared/buttonDecor.dart';
import 'package:corvid/shared/inputDecor.dart';
import 'package:corvid/view_models/signin_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SignIn extends StatelessWidget {

  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignInVIewModel>.withConsumer(
      viewModel: SignInVIewModel(), 
      builder: (context,model,child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
        child: ListView(
          children: <Widget>[
              SizedBox(height: 150,),
              Container(alignment: Alignment.topLeft,child: Text('Sign In',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green[400])),),
              SizedBox(height: 30,),
              InputField(controller: usernamecontroller,placeholder: 'Username',),
              SizedBox(height: 15,),
              InputField(controller: emailcontroller,placeholder: 'Email',),
              SizedBox(height: 15,),
              InputField(controller: passwordcontroller,placeholder: 'Password', password: true,),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Buttons(
                    title: 'Sign In',
                     busy: model.busy,
                    onPressed: (){
                      model.signIn(emailcontroller.text, passwordcontroller.text, usernamecontroller.text);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}