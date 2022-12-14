import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/blocs/authentication/authentication_bloc.dart';
import '../../../core/consts/enums.dart';
import '../../../core/localization/app_localization_key.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/validations.dart';
import '../../../core/widgets/widgets.dart';
import '../bloc/home_bloc.dart';

class HomePageTop extends StatelessWidget {
  final TextEditingController txtSearchMovieController =
      TextEditingController();

  HomePageTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.red[800]!,
              AppColors.red[400]!,
            ],
          ),
        ),
        padding: EdgeInsets.only(
            left: convertSize(10),
            right: convertSize(10),
            top: convertSize(5),
            bottom: convertSize(20)),
        child: Column(
          children: [
            buildTopIcons(),
            buildLogoImage(context),
            buildSearchTextField(),
          ],
        ),
      ),
    );
  }

  AppTextField buildSearchTextField() {
    return AppTextField(
      icon: Icons.search,
      hintText: t(AppLocalizationKey.homeSearchMovieHint),
      controller: txtSearchMovieController,
      onIconClick: () {
        String input = txtSearchMovieController.text;
        if (Validations.sNotNullOrEmpty(input)) {
          GetIt.instance
              .get<HomeBloc>()
              .add(SearchMovieByTitleEvent(title: input));
        } else {
          GetIt.instance.get<HomeBloc>().add(LoadLocalMovieListEvent());
        }
      },
    );
  }

  Image buildLogoImage(BuildContext context) {
    return Image.asset(
      "assets/images/logo.png",
      height: getHeight(context, percent: .16),
      width: getWidth(context, percent: .30),
      fit: BoxFit.fitWidth,
      color: AppColors.white,
    );
  }

  SafeArea buildTopIcons() {
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: AppColors.sky[300],
            size: getIconSize(SizeType.xxLarge),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.notifications,
                color: AppColors.sky[300],
                size: getIconSize(SizeType.middle),
              ),
              SizedBox(
                width: convertSize(20),
              ),
              PopupMenuButton(
                  onSelected: (selected) {
                    if (selected == t(AppLocalizationKey.profile)) {
                      debugPrint('ProfileClicked');
                    } else if (selected == t(AppLocalizationKey.logout)) {
                      GetIt.instance
                          .get<AuthenticationBloc>()
                          .add(AuthenticationLogoutEvent());
                    }
                  },
                  child: Icon(
                    Icons.person,
                    color: AppColors.sky[300],
                    size: getIconSize(SizeType.large),
                  ),
                  itemBuilder: (_) {
                    return [
                      PopupMenuItem(
                        value: t(AppLocalizationKey.profile),
                        child: Text(t(AppLocalizationKey.profile)),
                      ),
                      PopupMenuItem(
                        value: t(AppLocalizationKey.logout),
                        child: Text(t(AppLocalizationKey.logout)),
                      )
                    ];
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
