import 'package:dart_dependency_injection/dart_dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:rrf/rrf_json.dart';
import 'package:relathy_client/application_layer/app_module/app_client.dart';
import 'package:relathy_client/api_layer/app_module/app_client_impl.dart';
import 'package:relathy_client/generic_layer/presentation/base_view.dart';
import 'package:relathy_client/presentation_layer/app_module/app_view_model.dart';
import 'package:relathy_client/presentation_layer/app_module/auth_view.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model.dart';
import 'package:relathy_client/presentation_layer/app_module/auth_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/user_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/theme_model.dart';
import 'package:relathy_client/generic_layer/presentation/base_view_model.dart';
import 'package:relathy_client/presentation_layer/app_module/app_view.dart';
import 'package:relathy_client/presentation_layer/shared_module/preferences_model_impl.dart';
import 'package:relathy_shared/application_layer/app_module/app_json_converter_factory.dart';
import 'package:rrf/rrf.dart';

void _registerViews(ServiceCollection services) {
  _registerView(
    services,
    (s) => AuthViewModel(s.get(), s.get(), s.get(), s.get()),
    (s, p, f, c) => AuthView(p, f),
  );
  _registerView(
    services,
    (s) => AppViewModel(s.get(), s.get(), s.get(), s.get()),
    (s, p, f, c) => AppView(p, f),
  );
}

void _registerModels(ServiceCollection services) {
  services.addSingleton<PreferencesModel>((s) => NullPreferencesModelImpl());
  services.addSingleton<UserModel>((s) => UserModel(s.get(), s.get()));
  services.addSingleton<ThemeModel>((s) => ThemeModel(s.get()));
}

void _registerTypes(ServiceCollection services, {bool isLocal = false}) {
  _registerViews(services);
  _registerModels(services);

  if (isLocal) {
    services.addSingleton<AppClient>((s) => LocalAppClientImpl(s.get()));
  } else {
    services.addSingleton<AppClient>(
      (s) => WebSocketAppClient(Uri.parse("ws://localhost:5000/ws/"), s.get()),
    );
  }

  services.addSingleton<DateTimeService>((s) => DateTimeServiceImpl());
  services.addSingleton<Executor>((s) => s.get<AppClient>());
  services.addSingleton<MessageDtoJsonConverter>((s) => AppJsonConverterFactory.create());
  services.add<ViewFactory>((s) => _ViewFactory(s));
  services.add<ViewModelFactory>((s) => _ViewModelFactory(s));
  services.add<ScopeFinder>((s) => ScopeFinderImpl(s));
  services.addSingleton<EventBus>((s) => EventBus());
}

void _registerView<T extends ViewModel>(
  ServiceCollection services,
  T Function(ServiceProvider s) viewModelFactory,
  Widget Function(ServiceProvider s, T viewModel, ViewFactory viewFactory, BuildContext? context) viewFactory,
) {
  services.add<T>((s) => viewModelFactory(s));
  services.addSingleton<_CreateView<T>>(
    (s) =>
        (p, f, c) => viewFactory(s, p, f, c),
  );
}

class FrontendCompositionRoot {
  late final ServiceProvider _serviceProvider;
  FrontendCompositionRoot({bool isLocal = false}) {
    final services = ServiceCollection();
    _registerTypes(services, isLocal: isLocal);
    _serviceProvider = services.build();
  }

  // OSAppViewModel getOSAppViewModel(OSAppProps props) {
  //   return _serviceProvider
  //       .buildScoped(scope: UserScope(citizenId: props.citizenId))
  //       .get<ViewModelFactory>()
  //       .create<OSAppViewModel, OSAppProps>(props);
  // }

  AppView createAppView() {
    return _serviceProvider.get<ViewFactory>().createView(
          _serviceProvider.get<ViewModelFactory>().create<AppViewModel, EmptyViewProps>(ViewProps.empty),
          null,
        )
        as AppView;
  }

  AppClient getAppClient() {
    return _serviceProvider.get<AppClient>();
  }
}

typedef _CreateView<T extends ViewModel> =
    Widget Function(T viewModel, ViewFactory viewFactory, BuildContext? context);

class _ViewModelFactory implements ViewModelFactory {
  final ServiceProvider _serviceProvider;

  _ViewModelFactory(this._serviceProvider);

  @override
  T create<T extends ViewModel<TContext>, TContext extends ViewProps>(TContext param, {Scope? scope}) {
    final serviceProvider = scope == null ? _serviceProvider : _serviceProvider.buildScoped(scope: scope);
    final result = serviceProvider.get<T>();
    result.init(param);
    return result;
  }
}

class _ViewFactory implements ViewFactory {
  final ServiceProvider _serviceProvider;

  _ViewFactory(this._serviceProvider);

  @override
  Widget createView(ViewModel viewModel, BuildContext? context) =>
      _ResolveViewBaseHandler(_serviceProvider, this).resolve(viewModel, context);
}

class _ResolveViewBaseHandler implements ViewModelVisitor {
  final ServiceProvider _serviceProvider;
  final _ViewFactory _viewFactory;
  Widget? _result;
  BuildContext? context;

  _ResolveViewBaseHandler(this._serviceProvider, this._viewFactory);

  @override
  void visit<T extends ViewModel>(T viewModel) {
    _result = _serviceProvider.get<_CreateView<T>>()(viewModel, _viewFactory, context);
  }

  Widget resolve(ViewModel viewModel, BuildContext? context) {
    this.context = context;
    viewModel.acceptVisitor(this);
    this.context = null;
    return _result!;
  }
}

class ScopeFinderImpl implements ScopeFinder {
  final ServiceProvider provider;

  ScopeFinderImpl(this.provider);

  @override
  T find<T extends Scope>() {
    var nextProvider = provider;
    while (nextProvider.scope is! T) {
      nextProvider = provider.parent ?? (throw Exception("scope not found"));
    }
    return nextProvider.scope as T;
  }
}
