
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riv_example/state/providers.dart';
import 'package:flutter_riverpod/all.dart';

class PlayPauseButton extends ConsumerWidget
{
  final double width;
  final double height;
  final double iconSize;
  final IconData pauseIcon;
  final IconData playIcon;

  PlayPauseButton({this.width,this.height,this.iconSize,this.pauseIcon,this.playIcon});

  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    // TODO: implement build
    return watch(playingStateProvider).when(data: (isPlaying) => Center(
           child: SizedBox(
             height: height,
             width: width,
             child: IconButton(padding: EdgeInsets.all(0),icon: SizedBox(height: height,width: width,child: Icon(isPlaying ? pauseIcon : playIcon, size: iconSize,),), onPressed: (){
               context.read(audioPlayerProvider).playOrPause();
             }),
           ),
    ), loading: () => Container(), error: (_, __) => Container());
  }


}