import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riv_example/state/providers.dart';
import 'package:flutter_riverpod/all.dart';

class CurrentlyPlayingThumbnail extends ConsumerWidget
{

  final double height;
  final double width;

   const CurrentlyPlayingThumbnail({Key key,this.height,this.width}) : super(key:key);

  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    // TODO: implement build

    final currentPlaying = watch(currentlyPlayingProvider);
    return currentPlaying.when(data: (audioTrackModel) => Image.network(audioTrackModel.thumbnail, fit: BoxFit.cover,height: height,width: width,), loading: () => Container(), error: (_, __) => Container());
    throw UnimplementedError();
  }



}