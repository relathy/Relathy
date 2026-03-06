import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rrf/rrf.dart';
import 'package:relathy_shared/generic_layer/result/result.dart';
import 'package:mobx/mobx.dart';
import 'package:event_bus/event_bus.dart' as event_bus;

abstract class ViewCommandBase<TResult> {
  final ViewModel viewModel;
  final Observable<AsyncResult<TResult>?> _resultObs = Observable(null);
  AsyncResult<TResult>? get result => _resultObs.value;
  set _result(AsyncResult<TResult>? value) => _resultObs.value = value;
  final Computed<bool>? _canExecuteComputed;

  ViewCommandBase({required Computed<bool>? canExecuteComputed, required this.viewModel})
    : _canExecuteComputed = canExecuteComputed {
    viewModel.commands.add(this);
  }

  bool get isPending => result is AsyncPending;
  bool get isOk => result is AsyncSuccess;
  bool get isFailure => result is AsyncFailure;
  bool get isEmpty => result == null;

  Object getError() => result!.getError();
  String getFriendlyErrorMessage() => result!.getFriendlyErrorMessage();
  TResult getValue() => result!.getValue();

  bool get canExecute {
    var result = this.result;
    return (result == null || !result.isPending) &&
        (_canExecuteComputed == null || _canExecuteComputed.value);
  }

  void reset() {
    runInAction(() {
      _result = null;
    });
  }

  void execute();
}

class ViewCommand<TResult> extends ViewCommandBase<TResult> {
  final AsyncResult<TResult> Function() _execute;

  ViewCommand({
    required AsyncResult<TResult> Function() execute,
    bool Function()? canExecute,
    required super.viewModel,
  }) : _execute = execute,
       super(canExecuteComputed: canExecute != null ? Computed(canExecute) : null);

  @override
  void execute() {
    if (!canExecute) {
      return;
    }
    runInAction(() {
      _result = _execute();
    });
  }
}

class FutureViewCommand<TResult> extends ViewCommandBase<TResult> {
  final FutureAsyncResult<TResult> Function() _execute;

  FutureViewCommand({
    required FutureAsyncResult<TResult> Function() execute,
    bool Function()? canExecute,
    required super.viewModel,
  }) : _execute = execute,
       super(canExecuteComputed: canExecute != null ? Computed(canExecute) : null);

  @override
  void execute() {
    if (!canExecute) {
      return;
    }
    runInAction(() {
      _result = AsyncPending();
    });

    () async {
      try {
        var futureResult = await _execute();
        runInAction(() => _result = futureResult);
      } catch (e) {
        runInAction(() => _result = AsyncFailure(InternalAppError(systemError: e)));
      }
    }();
  }
}

class ViewCommand1<TResult, TInput> extends ViewCommandBase<TResult> {
  final TInput input;
  final AsyncResult<TResult> Function(TInput input) _execute;

  ViewCommand1({
    required this.input,
    required AsyncResult<TResult> Function(TInput input) execute,
    bool Function(TInput input)? canExecute,
    required super.viewModel,
  }) : _execute = execute,
       super(canExecuteComputed: canExecute != null ? Computed(() => canExecute(input)) : null);

  @override
  void execute() {
    if (!canExecute) {
      return;
    }
    runInAction(() {
      _result = _execute(input);
    });
  }
}

class FutureViewCommand1<TResult, TInput> extends ViewCommandBase<TResult> {
  final TInput input;
  final FutureAsyncResult<TResult> Function(TInput input) _execute;

  FutureViewCommand1({
    required this.input,
    required FutureAsyncResult<TResult> Function(TInput input) execute,
    bool Function(TInput input)? canExecute,
    required super.viewModel,
  }) : _execute = execute,
       super(canExecuteComputed: canExecute != null ? Computed(() => canExecute(input)) : null);

  @override
  void execute() {
    if (!canExecute) {
      return;
    }
    runInAction(() {
      _result = AsyncPending();
    });

    () async {
      try {
        var futureResult = await _execute(input);
        runInAction(() => _result = futureResult);
      } catch (e) {
        runInAction(() => _result = AsyncFailure(InternalAppError(systemError: e)));
      }
    }();
  }
}

abstract interface class Scope {}

abstract interface class ScopeFinder {
  T find<T extends Scope>();
}

class WidgetHandle {
  VoidCallback? _callback;
  void execute() => _callback?.call();
  void attach(VoidCallback callback) => _callback = callback;
  void detach() => _callback = null;
}

class EventBus {
  final eventBus = event_bus.EventBus();
  Stream<T> on<T>() => eventBus.on();
  void fire(dynamic event) => eventBus.fire(event);
}

abstract interface class ViewModelVisitor {
  void visit<T extends ViewModel>(T viewModel);
}

@immutable
abstract class ViewProps {
  static const empty = EmptyViewProps();
  const ViewProps();
}

class EmptyViewProps extends ViewProps {
  const EmptyViewProps();
}

abstract interface class ViewModelFactory {
  T create<T extends ViewModel<TProps>, TProps extends ViewProps>(TProps props, {Scope? scope});
}

abstract class ViewModelBase<TViewModel extends ViewModelBase<TViewModel, TProps>, TProps extends ViewProps>
    extends ViewModel<TProps> {
  ViewModelBase(super.viewModelFactory);

  @override
  void acceptVisitor(ViewModelVisitor visitor) {
    return visitor.visit(this as TViewModel);
  }
}

abstract class ViewModel<TProps extends ViewProps> {
  final ViewModelFactory viewModelFactory;

  late final ViewModelKey? key;
  late final Observable<TProps> _propsObs;
  TProps get props => _propsObs.value;
  final List<ViewCommandBase> commands = [];
  ViewModel(this.viewModelFactory);

  late final Computed<List<Object>> _errorsObs = Computed(() {
    return commands.where((x) => x.isFailure).map((x) => x.result!.getError()).toList();
  });
  bool get hasErrors => errors.isNotEmpty;
  List<Object> get errors => _errorsObs.value;

  @protected
  ViewCommand<TResult> createCommand<TResult>({
    required AsyncResult<TResult> Function() execute,
    bool Function()? canExecute,
  }) => ViewCommand(execute: execute, canExecute: canExecute, viewModel: this);

  @protected
  FutureViewCommand<TResult> createFutureCommand<TResult>({
    required FutureAsyncResult<TResult> Function() execute,
    bool Function()? canExecute,
  }) => FutureViewCommand(execute: execute, canExecute: canExecute, viewModel: this);

  @protected
  ViewCommand1<TResult, TInput> createCommand1<TResult, TInput>({
    required AsyncResult<TResult> Function(TInput input) execute,
    bool Function(TInput input)? canExecute,
    required TInput input,
  }) => ViewCommand1(execute: execute, canExecute: canExecute, viewModel: this, input: input);

  @protected
  FutureViewCommand1<TResult, TInput> createFutureCommand1<TResult, TInput>({
    required FutureAsyncResult<TResult> Function(TInput input) execute,
    bool Function(TInput input)? canExecute,
    required TInput input,
  }) => FutureViewCommand1(execute: execute, canExecute: canExecute, viewModel: this, input: input);

  @nonVirtual
  void init(TProps props) {
    key = computeKey(props);
    _propsObs = Observable(props);
    doInit(props);
  }

  @protected
  void doInit(TProps props) {}

  @protected
  ViewModelKey? computeKey(TProps props) => null;

  void acceptVisitor(ViewModelVisitor visitor);

  @protected
  T createViewModel<T extends ViewModel<TProps2>, TProps2 extends ViewProps>(TProps2 props, {Scope? scope}) =>
      viewModelFactory.create<T, TProps2>(props, scope: scope);
}

// @immutable
// class LoadingData {
//   final List<ComputedResult> computedResults;

//   LoadingData({List<ComputedResult>? computedResults, List<Future>? futures})
//     : computedResults = computedResults ?? const [],
//       futures =
//           futures
//               ?.map((x) => x is ObservableFuture ? x : ObservableFuture(x))
//               .toList() ??
//           const [];
// }

abstract class LoadingViewModelBase<
  TViewModel extends LoadingViewModelBase<TViewModel, TProps>,
  TProps extends ViewProps
>
    extends LoadingViewModel<TProps> {
  LoadingViewModelBase(super.viewModelFactory);

  @override
  void acceptVisitor(ViewModelVisitor visitor) {
    return visitor.visit(this as TViewModel);
  }
}

abstract class FutureLoadingViewModelBase<
  TViewModel extends FutureLoadingViewModelBase<TViewModel, TProps>,
  TProps extends ViewProps
>
    extends FutureLoadingViewModel<TProps> {
  FutureLoadingViewModelBase(super.viewModelFactory);

  @override
  void acceptVisitor(ViewModelVisitor visitor) {
    return visitor.visit(this as TViewModel);
  }
}

abstract class LoadingViewModel<TProps extends ViewProps> extends ViewModel<TProps> {
  late final _loadingResultComputed = Computed(_getLoadingResult);

  late final List<ComputedAsyncResult> _computedResults;

  LoadingViewModel(super.viewModelFactory);

  AsyncResult getLoadingResult() => _loadingResultComputed.value;

  AsyncResult _getLoadingResult() {
    AsyncResult? notOkayResult;
    for (var computedResult in _computedResults) {
      var result = computedResult.compute();
      if (notOkayResult == null && result.returnIsRequired) {
        notOkayResult = result.returnRequired();
      }
    }
    return notOkayResult ?? AsyncResult.success(null);
  }

  @override
  @nonVirtual
  void doInit(TProps props) {
    super.doInit(props);
    _computedResults = doInitAsync(props);
  }

  @protected
  List<ComputedAsyncResult> doInitAsync(TProps props);
}

abstract class FutureLoadingViewModel<TProps extends ViewProps> extends ViewModel<TProps> {
  late final _loadingResultComputed = Computed(_getLoadingResult);

  late final List<ComputedAsyncResult> _computedResults;
  late final ObservableFuture<void> _initFuture;

  FutureLoadingViewModel(super.viewModelFactory);

  AsyncResult getLoadingResult() => _loadingResultComputed.value;

  AsyncResult _getLoadingResult() {
    if (_initFuture.status == FutureStatus.pending) {
      return AsyncResult.pending();
    }
    if (_initFuture.status == FutureStatus.rejected) {
      return AsyncResult.failure(_initFuture.error);
    }

    AsyncResult? notOkayResult;
    for (var computedResult in _computedResults) {
      var result = computedResult.compute();
      if (notOkayResult == null && result.returnIsRequired) {
        notOkayResult = result.returnRequired();
      }
    }
    return notOkayResult ?? AsyncResult.success(null);
  }

  @override
  @nonVirtual
  void doInit(TProps props) {
    super.doInit(props);
    _initFuture = ObservableFuture(_doInitAsync(props));
  }

  Future<void> _doInitAsync(TProps props) async {
    _computedResults = await doInitAsync(props);
  }

  @protected
  Future<List<ComputedAsyncResult>> doInitAsync(TProps props);
}

abstract interface class Model {}

abstract class ModelBase implements Model {}

abstract interface class LoadingModel implements Model {
  AsyncResult getLoadingResult();

  Future<void> init();
}

abstract class LoadingModelBase implements LoadingModel {
  late final _loadingResultComputed = Computed(_getLoadingResult);

  late final ObservableFuture<void> _initFuture;

  @override
  AsyncResult getLoadingResult() => _loadingResultComputed.value;

  AsyncResult _getLoadingResult() {
    if (_initFuture.status == FutureStatus.pending) {
      return AsyncResult.pending();
    }
    if (_initFuture.status == FutureStatus.rejected) {
      return AsyncResult.failure(_initFuture.error);
    }

    return AsyncResult.success(null);
  }

  @override
  @nonVirtual
  Future<void> init() => doInit();

  @protected
  Future<void> doInit();
}

@immutable
sealed class ViewModelKey {
  const ViewModelKey();
}

@immutable
class ViewModelObjectKey extends ViewModelKey {
  final Object? value;

  const ViewModelObjectKey(this.value);
}

@immutable
class ViewModelUniqueKey extends ViewModelKey {
  const ViewModelUniqueKey();
}

@immutable
class ViewModelGlobalObjectKey extends ViewModelKey {
  final Object value;

  const ViewModelGlobalObjectKey(this.value);
}
