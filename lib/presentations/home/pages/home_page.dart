import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/widgets.dart';
import '../bloc/home_bloc.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final HomeBloc _homeBloc = GetIt.instance.get<HomeBloc>();

  HomePage({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    _homeBloc.add(LoadLocalMovieListEvent());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider<HomeBloc>(
        create: (_) => _homeBloc,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                HomePageTop(),
                const HomePageBottom(),
              ],
            ),
            blocMessageBuilder(context, _homeBloc),
            blocProgressBuilder(_homeBloc)
          ],
        ),
      ),
    );
  }
}
