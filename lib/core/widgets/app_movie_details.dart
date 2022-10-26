import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';
import '../consts/enums.dart';
import '../theme/app_colors.dart';
import 'widgets.dart';

class AppMovieDetails extends StatelessWidget {
  final MovieEntity movieEntity;

  const AppMovieDetails({
    super.key,
    required this.movieEntity,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Material(
                elevation: 5.0,
                child: SizedBox(
                  width: getWidth(context, percent: 1),
                  height: getHeight(context, percent: .6),
                  child: AppImageHero(
                    path: movieEntity.poster ?? '',
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: convertSize(30), horizontal: convertSize(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        movieInfoCard(
                            context, Icons.subject, movieEntity.plot ?? ''),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.category, movieEntity.genre ?? ''),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.timer, movieEntity.runtime ?? ''),
                        sizedbox(),
                        movieInfoCard(context, Icons.language,
                            movieEntity.language ?? ''),
                        sizedbox(),
                        movieInfoCard(context, Icons.calendar_today,
                            movieEntity.released ?? ''),
                        sizedbox(),
                        movieInfoCard(context, Icons.video_call,
                            movieEntity.director ?? ''),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.edit, movieEntity.writer ?? ''),
                        sizedbox(),
                        movieInfoCard(
                            context, Icons.star, movieEntity.actors ?? ''),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          closeButton(context)
        ],
      ),
    );
  }

  Widget movieInfoCard(BuildContext context, IconData data, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: getWidth(context, percent: .1),
          child: Align(
            alignment: Alignment.topLeft,
            child: Icon(
              data,
              size: getFontSize(SizeType.large),
              color: AppColors.navyBlue,
            ),
          ),
        ),
        Expanded(
          child: AppGTText(
            text: content,
            align: TextAlign.justify,
            color: AppColors.black,
            sizeType: SizeType.small,
          ),
        )
      ],
    );
  }

  Widget sizedbox() {
    return SizedBox(
      height: convertSize(30),
    );
  }

  Widget closeButton(BuildContext context) {
    return Positioned(
      right: convertSize(25),
      top: convertSize(25),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.black.withOpacity(.5),
              borderRadius: BorderRadius.circular(convertSize(8))),
          child: Icon(
            Icons.close,
            color: AppColors.white,
            size: getIconSize(SizeType.mega),
          ),
        ),
      ),
    );
  }
}
