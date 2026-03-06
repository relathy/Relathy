import 'package:flutter/material.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';

abstract class ViewFactory {
  Widget createView(ViewModel viewModel, BuildContext? context);
}

abstract interface class IView<T extends ViewModel> {
  T get viewModel;
  ViewFactory get viewFactory;
}

abstract class StatelessViewWidget<T extends ViewModel> extends StatelessWidget implements IView<T> {
  @override
  final T viewModel;

  @override
  final ViewFactory viewFactory;
  StatelessViewWidget(this.viewModel, this.viewFactory) : super(key: _toKey(viewModel.key));

  Widget createView(ViewModel viewModel, BuildContext? context) => viewFactory.createView(viewModel, context);

  static Key? _toKey(ViewModelKey? key) {
    switch (key) {
      case null:
        return null;
      case ViewModelObjectKey():
        return ObjectKey(key.value);
      case ViewModelUniqueKey():
        return UniqueKey();
      case ViewModelGlobalObjectKey():
        return GlobalObjectKey(key.value);
    }
  }
}

abstract class ViewState<TWidget extends StatefulViewWidget<TViewModel>, TViewModel extends ViewModel>
    extends State<TWidget>
    implements IView<TViewModel> {
  @override
  TViewModel get viewModel => widget.viewModel;

  @override
  ViewFactory get viewFactory => widget.viewFactory;
}

abstract class StatefulViewWidget<T extends ViewModel> extends StatefulWidget implements IView<T> {
  @override
  final T viewModel;

  @override
  final ViewFactory viewFactory;
  StatefulViewWidget(this.viewModel, this.viewFactory) : super(key: _toKey(viewModel.key));

  Widget createView(ViewModel viewModel, BuildContext? context) => viewFactory.createView(viewModel, context);

  static Key? _toKey(ViewModelKey? key) {
    switch (key) {
      case null:
        return null;
      case ViewModelObjectKey():
        return ObjectKey(key.value);
      case ViewModelUniqueKey():
        return UniqueKey();
      case ViewModelGlobalObjectKey():
        return GlobalObjectKey(key.value);
    }
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("...", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
