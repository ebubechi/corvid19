import 'package:corvid/shared/buttonDecor.dart';
import 'package:corvid/shared/inputDecor.dart';
import 'package:corvid/view_models/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';


class SignUp extends StatelessWidget {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context,model,child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
        child: ListView(children: <Widget>[
          SizedBox(height: 100,),
              Container(alignment: Alignment.topLeft,child: Text('Sign Up',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green[400])),),
              SizedBox(height: 30,),
              InputField(controller: emailcontroller,placeholder: 'Email',),
              SizedBox(height: 15,),
              InputField(controller: passwordcontroller,placeholder: 'Password',),
              SizedBox(height: 15,),
              InputField(controller: usernamecontroller,placeholder: 'Username',),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Buttons(
                    title: 'Sign Up',
                    // busy: model.busy,
                    onPressed: (){},
                  ),
                ],
              )
        ],),
        ),
      ),
    );
  }
}