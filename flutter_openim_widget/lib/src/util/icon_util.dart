import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_openim_widget/src/chat_emoji_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconUtil {
  IconUtil._();

  static String imageResStr(var name) => "assets/images/$name.webp";

  static AssetImage emojiImage(String key) => AssetImage(
        IconUtil.imageResStr(emojiFaces[key]),
        package: 'flutter_openim_widget',
      );

  static Widget svg(
    String name, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return SvgPicture.asset(
      "assets/images/$name.svg",
      width: width,
      height: height,
      color: color,
      package: 'flutter_openim_widget',
    );
  }

  static Widget assetImage(
    String res, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return Image.asset(
      imageResStr(res),
      width: width,
      height: height,
      fit: fit,
      color: color,
      // cacheHeight: height?.toInt(),
      // cacheWidth: width?.toInt(),
      package: 'flutter_openim_widget',
    );
  }

  static Widget back({Color color = const Color(0xFF333333)}) => assetImage(
        'ic_back',
        width: 12.w,
        height: 20.h,
        color: color,
      );

  static Widget add() => assetImage(
        "ic_add",
        width: 24.h,
        height: 24.h,
        color: Color(0xFF333333),
      );

  static Widget search() => assetImage(
        'ic_search',
        width: 24.h,
        height: 24.h,
        color: Color(0xFF333333),
      );

  static Widget play() => assetImage(
        'ic_video_play',
        width: 48.h,
        height: 48.h,
      );

  static Widget sendFailed() => assetImage(
        'ic_send_failed',
        width: 16.h,
        height: 16.h,
      );

  static Widget speak() => svg(
        'ic_speak',
        width: 26.h,
        height: 26.h,
      );

  static Widget tools() => svg(
        'ic_tools',
        width: 26.h,
        height: 26.h,
      );

  static Widget emoji() => svg(
        'ic_emoji',
        width: 26.h,
        height: 26.h,
      );

  static Widget keyboard() => svg(
        'ic_keyboard',
        width: 26.h,
        height: 26.h,
      );

  static Widget toolsAlbum() => assetImage(
        'ic_tools_album',
        width: 48.h,
        height: 48.h,
      );

  static Widget toolsCamera() => assetImage(
        'ic_tools_camera',
        width: 48.h,
        height: 48.h,
      );

  static Widget toolsCarte() => assetImage(
        'ic_tools_carte',
        width: 48.h,
        height: 48.h,
      );

  static Widget toolsFile() => assetImage(
        'ic_tools_file',
        width: 48.h,
        height: 48.h,
      );

  static Widget toolsLocation() => assetImage(
        'ic_tools_location',
        width: 48.h,
        height: 48.h,
      );

  static Widget toolsVideoCall() => assetImage(
        'ic_tools_video_call',
        width: 48.h,
        height: 48.h,
      );

  static Widget toolsVoiceInput() => assetImage(
        'ic_tools_voice_input',
        width: 48.h,
        height: 48.h,
      );

  static Widget menuCopy() => assetImage(
        'ic_menu_copy',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuDel() => assetImage(
        'ic_menu_del',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuForward() => assetImage(
        'ic_menu_forward',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuMultiChoice() => assetImage(
        'ic_menu_multichoice',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuReply() => assetImage(
        'ic_menu_reply',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuRevoke() => assetImage(
        'ic_menu_revoke',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuDownload() => assetImage(
        'ic_menu_download',
        width: 18.w,
        height: 18.h,
      );

  static Widget menuTranslation() => assetImage(
        'ic_menu_translation',
        width: 18.w,
        height: 18.h,
      );

  static Widget file() => assetImage(
        'ic_file',
        width: 22.w,
        height: 28.h,
      );

  static Widget delQuote() => assetImage(
        'ic_del_quote',
        width: 14.w,
        height: 15.h,
      );

  static Widget voiceInputNor() => assetImage(
        'ic_voice_input_nor',
        width: 88.h,
        height: 88.h,
        fit: BoxFit.cover,
      );

  static Widget error({
    double? width,
    double? height,
  }) =>
      assetImage(
        'ic_load_error',
        height: height,
        width: width,
      );

  static Widget notDisturb() => assetImage(
        'ic_not_disturb',
        width: 20.h,
        height: 20.h,
      );

  static Widget lowMemoryNetworkImage({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    bool loadProgress = true,
  }) =>
      networkImage(
        url: url,
        width: width,
        height: height,
        fit: fit,
        cacheWidth: width?.toInt(),
        cacheHeight: height?.toInt(),
        loadProgress: loadProgress,
        clearMemoryCacheWhenDispose: true,
      );

  static Widget networkImage({
    required String url,
    double? width,
    double? height,
    int? cacheWidth,
    int? cacheHeight,
    BoxFit? fit,
    bool loadProgress = true,
    bool clearMemoryCacheWhenDispose = false,
  }) =>
      ExtendedImage.network(
        url,
        width: width,
        height: height,
        fit: fit,
        cache: true,
        cacheWidth: cacheWidth ?? (1.sw * .75).toInt(),
        cacheHeight: cacheHeight,
        clearMemoryCacheWhenDispose: clearMemoryCacheWhenDispose,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              {
                final ImageChunkEvent? loadingProgress = state.loadingProgress;
                final double? progress =
                    loadingProgress?.expectedTotalBytes != null
                        ? loadingProgress!.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null;
                // CupertinoActivityIndicator()
                return loadProgress
                    ? Container(
                        width: 15.0,
                        height: 15.0,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                            value: progress,
                          ),
                        ),
                      )
                    : Container();
              }
            case LoadState.completed:
              {
                ///if you don't want override completed widget
                ///please return null or state.completedWidget
                return null;
                //return state.completedWidget;
                // return state.completedWidget;
                // return FadeIn(
                //   // duration: const Duration(milliseconds: 100),
                //   child: ExtendedRawImage(
                //     image: state.extendedImageInfo?.image,
                //     width: width,
                //     height: height,
                //     fit: fit,
                //   ),
                // );
              }
            case LoadState.failed:
              //remove memory cached
              state.imageProvider.evict();
              return error(width: width, height: height);
          }
        },
        // border: Border.all(color: Colors.red, width: 1.0),
        // shape: boxShape,
        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //cancelToken: cancellationToken,
      );
/*FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        imageCacheHeight: cacheHeight,
        imageCacheWidth: cacheWidth,
        fadeInDuration: const Duration(milliseconds: 100),
      );*/
/*Image.network(
        url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
        loadingBuilder: null != loadingWidget
            ? (context, child, loadingProgress) => loadingWidget
            : null,
        errorBuilder: null != errorWidget
            ? (context, Object, stackTrace) => errorWidget
            : null,
      );*/

/*static Widget networkImage({
    required String url,
    double? width,
    double? height,
    BoxFit? fit,
    int? memCacheHeight,
    int? memCacheWidth,
    PlaceholderWidgetBuilder? placeholder,
    ProgressIndicatorBuilder? progressIndicatorBuilder,
    LoadingErrorWidgetBuilder? errorWidget,
  }) =>
      CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        memCacheHeight: memCacheHeight,
        memCacheWidth: memCacheWidth,
        placeholder: placeholder,
        progressIndicatorBuilder: progressIndicatorBuilder,
        errorWidget: errorWidget,
        // filterQuality: FilterQuality.medium,
        // cacheManager: CustomCacheManager.instance,
      );*/

}
