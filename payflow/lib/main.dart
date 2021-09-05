import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  // Necessário para o Firebase no Flutter
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Caso ocorra algum erro
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                'Não foi possível inicializar o Firebase',
                textDirection: TextDirection.ltr,
              )
            )
          );
        } else
        // Depois de terminar o carregamento, mostrará o seu aplicativo
        if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        } else {
        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
          child: Center (
            child: CircularProgressIndicator(),
          )
        );
        }
      },
    );
  }
}