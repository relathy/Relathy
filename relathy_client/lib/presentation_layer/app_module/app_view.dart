import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:relathy_client/generic_layer/presentation/base_view.dart';
import 'package:relathy_client/presentation_layer/app_module/app_view_model.dart';
import 'package:relathy_shared/generic_layer/result/result.dart';

class AppView extends StatelessViewWidget<AppViewModel> {
  // ignore: use_key_in_widget_constructors
  AppView(super.viewModel, super.viewFactory);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final mode = viewModel.themeModel.themeMode;
        return MaterialApp(
          title: 'Webverse',
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
          darkTheme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true, brightness: Brightness.dark),
          home: Observer(
            builder: (_) {
              var loadingResult = viewModel.getLoadingResult();
              switch (loadingResult) {
                case AsyncPending<dynamic>():
                  return const _LoadingScreen();
                case AsyncSuccess<dynamic>():
                  return createView(viewModel.childViewModel, context);
                case AsyncFailure<dynamic>():
                  return const _ErrorScreen();
              }
            },
          ),
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(strokeWidth: 3, color: cs.primary),
            ),
            const SizedBox(height: 16),
            Text('…', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text('Error', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
