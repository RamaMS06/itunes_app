import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_app/feature/presentation/blocs/home/home_bloc.dart';
import 'package:itunes_app/feature/presentation/widget/atoms/colors.dart';
import 'package:itunes_app/feature/presentation/widget/components/text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(context)..add(DoSearchListMusic()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final controller = context.read<HomeBloc>();
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormFieldTemplate(
                          controller: controller.searchController,
                          onChanged: (val) {
                            context
                                .read<HomeBloc>()
                                .add(DoSearchListMusic(query: val));
                          })),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is SearchDataLoading) {
                        return const CircularProgressIndicator(
                            color: AtomColors.primaryColor, strokeWidth: 3);
                      } else if (state is SearchDataLoaded) {
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 36 / 2),
                                    child: Container(
                                        color: Colors.black12,
                                        height: 1,
                                        width:
                                            MediaQuery.of(context).size.width),
                                  ),
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(),
                              itemCount: state.searchModel.resultCount ?? 0,
                              itemBuilder: ((context, index) => InkWell(
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      context.read<HomeBloc>().add(
                                          GoToDetailMusicPage(index: index));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                decoration: BoxDecoration(
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          offset: Offset(0, 5),
                                                          blurRadius: 8,
                                                          spreadRadius: 3,
                                                          color: AtomColors
                                                              .primaryColor)
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    imageUrl: state
                                                            .searchModel
                                                            .results?[index]
                                                            .artworkUrl100 ??
                                                        ''),
                                              ),
                                              const SizedBox(width: 16),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        state
                                                                .searchModel
                                                                .results?[index]
                                                                .trackName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                          state
                                                                  .searchModel
                                                                  .results?[
                                                                      index]
                                                                  .artistName ??
                                                              '',
                                                          style: const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(CupertinoIcons.play_circle,
                                            size: 30)
                                      ],
                                    ),
                                  ))),
                        );
                      } else {
                        return Column(
                          children: const [
                            Icon(CupertinoIcons.music_note_2, size: 30),
                            SizedBox(height: 8),
                            Text(
                              'Music not found',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
