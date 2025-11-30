import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/favorites_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/filter_cubit.dart';
import 'package:nutrition_tech/presentation/bloc/receipts_bloc.dart';
import 'package:nutrition_tech/presentation/bloc/sort_cubit.dart';

import '../../presentation/bloc/fruits_bloc.dart';
import '../di/locator.dart';
import '../router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<FruitsBloc>()),
        BlocProvider(create: (context) => sl<FavoritesBloc>()),
        BlocProvider(create: (context) => sl<ReceiptsBloc>()),
        BlocProvider(create: (context) => sl<SortCubit>()),
        BlocProvider(create: (context) => sl<FilterCubit>()),
      ],
      child: MaterialApp.router(routerConfig: router, debugShowCheckedModeBanner: false,),
    );
  }
}
