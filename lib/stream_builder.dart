import 'package:flutter/material.dart';
import 'package:kr_builder/loading.dart';
import 'package:kr_builder/shimmer_bloc.dart';
import 'package:shimmer/shimmer.dart';

class KrStreamBuilder<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected,
  /// possibly null.
  final Stream<T> stream;

  ///The builder return the proper widget according to the connections state and the data.
  ///return loading widget if the connection is waiting.
  ///return error widget if the connection fail.
  ///return empty widget (or you can specify it) if the return is null;
  ///if the connections success then the data will pass to hte builder and build your widget.
  final Widget Function(T) builder;
  ///Specify the error widget.
  final Widget Function(Object?)? onError;
  final Widget? onEmpty;
  final Widget? onLoading;

  ///This can be used to add shimmer effect card loading. All you need is adding blocs of Containers.
  final Widget? blocs;
  ///Instead of blocs, you can specify the diamention and/or radius of the shimmer card.
  final Size? shimmerSize;
  final double? shimmerRadius;
  ///shimmer gradiant colors.
  final Color? baseColor;
  final Color? highlightColor;
  
  const KrStreamBuilder(
      {Key? key,
      required this.stream,
      required this.builder,
      this.onError,
      this.shimmerSize,
      this.shimmerRadius,
      this.onEmpty,
      this.blocs,
      this.onLoading, this.baseColor, this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, data) {
        if (data.connectionState == ConnectionState.waiting) {
          if (shimmerSize != null) {
            return ShimmerBloc(
              size: shimmerSize!,
              radius: shimmerRadius ?? 4,
            );
          } else if (blocs != null) {
            return Container(
              color: Colors.white,
              child: Shimmer.fromColors(
                  baseColor: baseColor ?? Colors.grey.withOpacity(0.2),
                  highlightColor: highlightColor ?? Colors.grey.withOpacity(0.4),
                  enabled: true,
                  child: blocs!),
            );
          } else if (onLoading != null) {
            return onLoading!;
          } else {
            return const LoadingWidget();
          }
        }
        if (data.hasError) {
          return onError != null ? onError!(data.error) : const SizedBox();
        }
        if (!data.hasData) return onEmpty ?? const SizedBox();
        return builder(data.data!);
      },
    );
  }
}
