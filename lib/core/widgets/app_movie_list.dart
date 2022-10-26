import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';
import '../consts/enums.dart';
import '../localization/app_localization_key.dart';
import '../theme/app_colors.dart';
import '../utils/validations.dart';
import 'widgets.dart';

class AppMovieList extends StatelessWidget {
  final List<MovieEntity> movieList;

  const AppMovieList({
    super.key,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: convertSize(15)),
      shrinkWrap: true,
      addAutomaticKeepAlives: true,
      children: movieList
          .where((movie) => Validations.isUrl(movie.poster))
          .map((movie) => movieCard(
                context,
                movie,
              ))
          .toList(),
    );
  }

  Widget translatedRawChip(String label, IconData data) {
    return FutureBuilder<String>(
        future: tg(label),
        initialData: label,
        builder: (context, snapshot) {
          return AppRawChip(
            label: snapshot.data ?? '',
            iconData: data,
            sizeType: SizeType.tiny,
          );
        });
  }

  Widget movieCard(BuildContext context, MovieEntity movie) => Container(
        padding: EdgeInsets.symmetric(vertical: convertSize(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getWidth(context, percent: .32),
              padding: EdgeInsets.only(left: convertSize(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(convertSize(8.0)),
                child: AppImageHero(
                  path: movie.poster ?? '',
                ),
              ),
            ),
            Container(
              width: getWidth(context, percent: .68),
              padding: EdgeInsets.symmetric(horizontal: convertSize(12.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitle(movie),
                  const Divider(
                    color: AppColors.navyBlue,
                  ),
                  buildPlot(movie),
                  SizedBox(height: convertSize(8)),
                  buildGenreAndYear(movie),
                  SizedBox(height: convertSize(8)),
                  buildMovieChips(movie),
                  SizedBox(
                    height: convertSize(12),
                  ),
                  buildDetailButton(context, movie)
                ],
              ),
            )
          ],
        ),
      );

  Align buildDetailButton(BuildContext context, MovieEntity movie) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          navPush(
            context,
            AppMovieDetails(
              movieEntity: movie,
            ),
          );
        },
        child: AppRawChip(
          label: t(AppLocalizationKey.homeOpenButton),
          backgroundColor: AppColors.navyBlue,
          radius: 5,
          color: AppColors.sky[300]!,
          iconData: Icons.open_in_new,
        ),
      ),
    );
  }

  SingleChildScrollView buildMovieChips(MovieEntity movie) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          translatedRawChip(movie.runtime ?? '', Icons.timer),
          SizedBox(
            width: convertSize(3),
          ),
          translatedRawChip(movie.director ?? '', Icons.edit),
          SizedBox(
            width: convertSize(3),
          ),
          translatedRawChip(movie.country ?? '', Icons.language),
        ],
      ),
    );
  }

  Row buildGenreAndYear(MovieEntity movie) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: convertSize(15.0),
            ),
            child: AppGTText(
              maxLines: 1,
              sizeType: SizeType.xxSmall,
              text: movie.genre ?? '',
            ),
          ),
        ),
        Text(
          movie.year ?? '',
          style: TextStyle(
            fontSize: getFontSize(SizeType.xxSmall),
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }

  AppGTText buildPlot(MovieEntity movie) {
    return AppGTText(
      text: movie.plot ?? '',
      sizeType: SizeType.xxSmall,
      maxLines: 2,
      align: TextAlign.justify,
    );
  }

  Center buildTitle(MovieEntity movie) {
    return Center(
      child: AppGTText(
        text: movie.title ?? '',
        sizeType: SizeType.middle,
        maxLines: 1,
        fontWeight: FontWeight.w500,
        align: TextAlign.center,
      ),
    );
  }
}
