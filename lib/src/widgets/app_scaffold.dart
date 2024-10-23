import 'package:music_player/services/navigation.dart';
import 'package:music_player/src/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingAction;
  final Widget? bottomWidget;
  final bool? isBusy;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBodyBehindAppBar;
  final bool? canPop;
  final VoidCallback? onBack;

  const AppScaffold({
    this.appBar,
    this.body,
    this.isBusy,
    this.floatingAction,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar,
    this.bottomWidget,
    this.canPop,
    this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        if (!value) {
          if (onBack != null) {
            onBack!();
          } else {
            Navigation.instance.pop();
          }
        }
      },
      canPop: canPop ?? true,
      child: AbsorbPointer(
        absorbing: isBusy ?? false,
        child: Stack(
          children: [
            Scaffold(
              appBar: appBar,
              body: body,
              backgroundColor: Colors.white,
              bottomNavigationBar: bottomWidget,
              floatingActionButton: floatingAction,
              extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            ),
            Positioned(
              child: isBusy ?? false
                  ? Container(
                      color: Colors.black.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: const LoaderWidget(),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
