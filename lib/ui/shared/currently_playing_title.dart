import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riv_example/state/providers.dart';
import 'package:flutter_riverpod/all.dart';

class CurrentlyPlayingText extends ConsumerWidget
{
  final double fontSize;
  final TextAlign textAlign;

  CurrentlyPlayingText({this.fontSize, this.textAlign});

  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    // TODO: implement build
    final currentlyPlaying = watch(currentlyPlayingProvider);
    return currentlyPlaying.when(data: (audioTrackModel) => Text('${audioTrackModel.trackName} \u25CF ${audioTrackModel.artistName} ' , style: TextStyle(fontSize: fontSize),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,), loading: () => Container(), error: (_, __) => Container());
  }


}