import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/utils/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  String? passwordValidationHandler(String? value) {
    if (FieldRequiredValidator().validate(value)) {
      return "This field is required";
    }

    if (PasswordValidator().validate(value!)) {
      return 'Please enter valid password';
    }
    return null;
  }

  String? emailValidationHandler(String? value) {
    if (FieldRequiredValidator().validate(value)) {
      return "This field is required";
    }

    if (EmailValidator().validate(value!)) {
      return "please enter valid password";
    }
    return null;
  }

  _submit() {
    var isFormValid = _formKey.currentState!.validate();
    if (!isFormValid) {
      return;
    }
    _formKey.currentState!.save();

    if (_isLogin) {
    } else {
      try {
        var response = _firebase.createUserWithEmailAndPassword(
            email: email, password: password);
        print(response);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: kDarkColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isLogin ? 'Login' : 'Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).colorScheme.surface),
                    ),
                    TextFormField(
                      key: const Key(
                        'email',
                      ),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      validator: emailValidationHandler,
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    TextFormField(
                      key: const Key('password'),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface),
                      obscureText: true,
                      validator: passwordValidationHandler,
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //     style: TextButton.styleFrom(
                    //       padding: EdgeInsets.zero,
                    //     ),
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Forgot password?',
                    //       style: TextStyle(
                    //           color: Theme.of(context).colorScheme.surface),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: Text(
                        _isLogin ? 'Sign in' : 'Create account',
                        style: Theme.of(context).textTheme.labelLarge!,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                        _isLogin
                            ? "Create account"
                            : "Already have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
