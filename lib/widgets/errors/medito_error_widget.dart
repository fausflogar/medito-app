import 'package:Medito/widgets/widgets.dart';
import 'package:Medito/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MeditoErrorWidget extends StatelessWidget {
  const MeditoErrorWidget({
    Key? key,
    required this.onTap,
    required this.message,
    this.isLoading = false,
    this.showCheckDownloadText = false,
    this.hasScaffold = true,
  }) : super(key: key);
  final void Function() onTap;
  final String message;
  final bool isLoading;
  final bool showCheckDownloadText;
  final bool hasScaffold;
  @override
  Widget build(BuildContext context) {
    var isInvalidToken = message == StringConstants.invalidToken;

    var textStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 16,
          color: ColorConstants.walterWhite,
          fontFamily: DmSerif,
        );
    if (hasScaffold) {
      return Scaffold(
        backgroundColor: ColorConstants.ebony,
        body: _mainBody(context, isInvalidToken, textStyle),
      );
    }

    return _mainBody(context, isInvalidToken, textStyle);
  }

  SizedBox _mainBody(
    BuildContext context,
    bool isInvalidToken,
    TextStyle? textStyle,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding,
        ),
        child: Column(
          mainAxisSize: hasScaffold ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: isInvalidToken
                    ? '${StringConstants.someThingWentWrong}. '
                    : '$message ',
                style: textStyle,
                children: <TextSpan>[
                  if (showCheckDownloadText || isInvalidToken)
                    TextSpan(
                      text: '${StringConstants.meanWhileCheck} ',
                      style: textStyle,
                    ),
                  if (showCheckDownloadText || isInvalidToken)
                    TextSpan(
                      text: '${StringConstants.downloads.toLowerCase()}',
                      style: textStyle?.copyWith(
                        decoration: TextDecoration.underline,
                        color: ColorConstants.lightPurple,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => context.push(RouteConstants.downloadsPath),
                    ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            height16,
            LoadingButtonWidget(
              btnText: StringConstants.tryAgain,
              onPressed: onTap,
              isLoading: isLoading,
              bgColor: ColorConstants.walterWhite,
              textColor: ColorConstants.onyx,
            ),
          ],
        ),
      ),
    );
  }
}
