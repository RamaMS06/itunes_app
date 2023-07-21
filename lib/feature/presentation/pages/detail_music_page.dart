import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_app/feature/presentation/blocs/detail_music/detail_music_bloc.dart';

import '../widget/atoms/colors.dart';

class DetailMusicPage extends StatelessWidget {
  const DetailMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DetailMusicArgs;
    return BlocProvider(
      create: (context) => DetailMusicBloc(context, args)
        ..add(FetchDetailMusic())
        ..add(PlayMusic(0, false)),
      child: BlocBuilder<DetailMusicBloc, DetailMusicState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              context.read<DetailMusicBloc>().add(DisposeMusic());
              return true;
            },
            child: CupertinoPageScaffold(
              backgroundColor: Colors.white,
              navigationBar: const CupertinoNavigationBar(
                middle: Text('Now Playing'),
              ),
              child: SafeArea(
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 5),
                                            blurRadius: 8,
                                            spreadRadius: 5,
                                            color: AtomColors.primaryColor)
                                      ]),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Center(
                                    child: CachedNetworkImage(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            state.resultModel?.artworkUrl100 ??
                                                ''),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(state.resultModel?.trackName ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                              const SizedBox(height: 4),
                              Text(state.resultModel?.artistName ?? '',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              SliderTheme(
                                data: const SliderThemeData(
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 7)),
                                child: Slider(
                                    thumbColor: Colors.black87,
                                    activeColor: Colors.black87,
                                    inactiveColor: AtomColors.primaryColor,
                                    min: 0,
                                    max: 29,
                                    value: state.musicIndex ?? 0,
                                    onChanged: (val) {
                                      context
                                          .read<DetailMusicBloc>()
                                          .add(SliderIndexMusic(val));
                                    }),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(CupertinoIcons.backward_fill),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      context.read<DetailMusicBloc>().add(
                                          TurnPlayMusic(
                                              state.isPlayed ?? false));
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                            (state.isPlayed ?? false)
                                                ? CupertinoIcons
                                                    .pause_circle_fill
                                                : CupertinoIcons
                                                    .play_circle_fill,
                                            size: 55)),
                                  ),
                                  const Icon(CupertinoIcons.forward_fill)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
