import 'package:block_and_cubit/app_navigator.dart';
import 'package:block_and_cubit/nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_bloc.dart';
import 'posts_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => NavCubit()),
        BlocProvider(

            ///получаем блок и сразу обращаемся к его функции через точки, чтобы получить посты
            create: (context) => PostsBloc()..add(LoadPostsEvent()))
      ], child: AppNavigator()),
    );
  }
}
