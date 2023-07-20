import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunes_app/feature/presentation/blocs/detail_music/detail_music_bloc.dart';

class DetailMusicPage extends StatelessWidget {
  const DetailMusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DetailMusicArgs;
    return BlocProvider(
      create: (context) =>
          DetailMusicBloc(context, args)..add(FetchDetailMusic()),
      child: BlocBuilder<DetailMusicBloc, DetailMusicState>(
        builder: (context, state) {
          return CupertinoPageScaffold(
            backgroundColor: Colors.white,
            navigationBar: const CupertinoNavigationBar(
              middle: Text(''),
            ),
            child: Material(
              child: SafeArea(
                child: Column(
                  children: [Text('${state.artistId}')],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
