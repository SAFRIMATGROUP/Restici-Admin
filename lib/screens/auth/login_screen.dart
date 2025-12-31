import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restici_admin/core/widgets/main_widgets/app_button.dart';
import 'package:restici_admin/core/widgets/main_widgets/app_text.dart';
import 'package:restici_admin/core/widgets/main_widgets/app_text_field.dart';

import '../../core/utils/variable_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool emailEmpty = false, passwordEmpty = false, isLoading= false,
      emailValide = true, passwordValide = true;
  bool _passwordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyTextInput() async {
    setState(() {
      emailEmpty = emailController.text.isEmpty;
      passwordEmpty = passController.text.isEmpty;
      emailValide = isValidEmail(emailController.text);
      passwordValide = isValidPassword(passController.text);
    });
  }

  Future<void> _fetchAdminData(String userID) async {
    try{
      DocumentSnapshot snapshot= await FirebaseFirestore.instance.
      collection(VariableName.superAdmin).doc(userID).get();

      if(snapshot.exists){
        //Map<String, dynamic> data= snapshot.data() as Map<String, dynamic>;
        Navigator.pop(context);
        //Navigator.pushNamed(context, dashboardRoute);

      }else{
        /*MyAlertDialog.errorDialog(context, "Admin non trouvé", 'Veuillez réessayer', (){
          _auth.signOut();
          Navigator.pop(context);

        });*/
      }

    }catch(e){
      /*MyAlertDialog.errorDialog(context, "Une erreur s'est produite", 'Veuillez réessayer', (){
        _auth.signOut();
        Navigator.pop(context);
      });*/
    }
  }

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      //MyAlertDialog.progressDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //Navigator.pop(context);

      _fetchAdminData(_auth.currentUser!.uid);

    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "Utilisateur non trouvé.";
          break;
        case 'wrong-password':
          errorMessage = "Mot de passe incorrect.";
          break;
        case 'invalid-credential':
          errorMessage = "Les informations d'identification sont invalides. Veuillez réessayer.";
          break;
        case 'network-request-failed':
          errorMessage = "Problème de connexion réseau. Veuillez vérifier votre connexion Internet.";
          break;
        default:
          errorMessage = e.code;
      }
      Navigator.pop(context);
      //MyAlertDialog.errorDialog(context, "Erreur de connexion", errorMessage, null);

    } catch (e) {
      //Navigator.pop(context);
      //MyAlertDialog.errorDialog(context, "Erreur de connexion", 'Veuillez réessayer', null);
    }
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[^'']@+[^'']+\.[^'']+';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }
  bool isValidPassword(String password) {
    String passwordPattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(passwordPattern);
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              color: Colors.white,
              elevation: 6,
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: 400,
                  width: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          AppTextField(
                            controller: emailController,
                            label: 'Email',
                            cursorColor: Colors.grey,
                            validator: (value) {

                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre email';
                              }
                              if (!isValidEmail(value)) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            },
                          ),

                          AppTextField(
                            controller: passController,
                            label: 'Mot de passe',
                            cursorColor: Colors.grey,
                            obscureText: !_passwordVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? CupertinoIcons.eye_slash
                                    : CupertinoIcons.eye,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            validator: (value) {

                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre mot de passe';
                              }
                              if (isValidPassword(value)) {
                                return 'Veuillez entrer un email valide';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20,),
                          AppButton(text: 'Connexion', onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              //login(context, emailController.text, passController.text);
                            }
                          }, isLoading: isLoading, isExpand: true,)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )

      ],
      ),
    );
  }
}
