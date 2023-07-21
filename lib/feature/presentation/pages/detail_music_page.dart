import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_app/app/core/utils/extension.dart';
import 'package:itunes_app/feature/presentation/blocs/detail_music/detail_music_bloc.dart';
import 'package:itunes_app/feature/presentation/widget/atoms/icons.dart';

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
          final controller = context.read<DetailMusicBloc>();
          return WillPopScope(
            onWillPop: () async {
              controller.add(DisposeMusic());
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                      controller.add(DisposeMusic());
                    },
                    child:
                        const Icon(CupertinoIcons.back, color: Colors.black)),
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text('Now Playing',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              body: SafeArea(
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.15),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 10),
                                            blurRadius: 14,
                                            spreadRadius: 8,
                                            color: Colors.black12)
                                      ]),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Center(
                                    child: CachedNetworkImage(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                        imageUrl:
                                            state.resultModel?.artworkUrl100 ??
                                                ''),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 27),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(state.resultModel?.trackName ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              ),
                              const SizedBox(height: 4),
                              Text(state.resultModel?.artistName ?? '',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300)),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: Platform.isAndroid ? 20 : 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 8, bottom: 2),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                      trackHeight: 2,
                                      overlayShape:
                                          SliderComponentShape.noThumb,
                                      thumbShape: const RoundSliderThumbShape(
                                          enabledThumbRadius: 7)),
                                  child: Slider(
                                      thumbColor: Colors.black87,
                                      activeColor: Colors.black87,
                                      inactiveColor: AtomColors.primaryColor,
                                      min: 0,
                                      max: controller.maxLengthMusic,
                                      value: state.musicIndex?.toDouble() ?? 0,
                                      onChanged: (val) {
                                        print(val);
                                        context
                                            .read<DetailMusicBloc>()
                                            .add(SliderIndexMusic(val.round()));
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 8, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatDuration(Duration(
                                          minutes: 0,
                                          seconds:
                                              (state.musicIndex ?? 0).toInt())),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      formatDuration(Duration(
                                          minutes: 0,
                                          seconds: controller.maxLengthMusic
                                              .toInt())),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const IconTemplate(
                                        icon: Icon(Icons.repeat)),
                                    Row(
                                      children: [
                                        IconTemplate(
                                            icon: const Icon(
                                                CupertinoIcons.backward_fill,
                                                size: 30),
                                            onTap: () {
                                              context
                                                  .read<DetailMusicBloc>()
                                                  .add(DoPreviouseMusic());
                                            }),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: IconTemplate(
                                              icon: Icon(
                                                  (state.isPlayed ?? false)
                                                      ? CupertinoIcons
                                                          .pause_circle_fill
                                                      : CupertinoIcons
                                                          .play_circle_fill,
                                                  shadows: const [
                                                    Shadow(
                                                        color: Colors.black26,
                                                        blurRadius: 15,
                                                        offset: Offset(0, 5))
                                                  ],
                                                  size: 65),
                                              onTap: () {
                                                controller.add(TurnPlayMusic(
                                                    state.isPlayed ?? false));
                                              }),
                                        ),
                                        IconTemplate(
                                            icon: const Icon(
                                                CupertinoIcons.forward_fill,
                                                size: 30),
                                            onTap: () {
                                              controller.add(DoForwardMusic());
                                            }),
                                      ],
                                    ),
                                    const IconTemplate(
                                        icon: Icon(Icons.shuffle)),
                                  ],
                                ),
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
