import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/widgets/widgets.dart';
import '../bloc/home_bloc.dart';

class HomePageBottom extends StatelessWidget {
  const HomePageBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: GetIt.instance.get<HomeBloc>(),
        builder: (_, state) {
          return AppMovieList(movieList: state.movieList);
        },
      ),
    );
  }
}
