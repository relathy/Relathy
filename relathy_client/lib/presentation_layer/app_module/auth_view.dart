import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:relathy_client/generic_layer/presentation/base_view.dart';
import 'package:relathy_client/presentation_layer/app_module/auth_view_model.dart';
import 'package:relathy_client/presentation_layer/shared_module/theme_model.dart';

class AuthView extends StatefulViewWidget<AuthViewModel> {
  // ignore: use_key_in_widget_constructors
  AuthView(super.viewModel, super.viewFactory);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ViewState<AuthView, AuthViewModel> {
  late final TextEditingController _emailController;
  late final TextEditingController _codeController;

  ThemeModel get themeModel => viewModel.themeModel;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: viewModel.email);
    _codeController = TextEditingController(text: viewModel.code);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Observer(
                builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Top row with theme toggle icon
                      Row(
                        children: [
                          const Spacer(),
                          Observer(
                            builder: (_) {
                              final mode = themeModel.themeMode;
                              final platformBrightness = MediaQuery.of(context).platformBrightness;

                              final bool isDarkEffective =
                                  mode == ThemeMode.dark ||
                                  (mode == ThemeMode.system && platformBrightness == Brightness.dark);

                              final IconData themeIcon = isDarkEffective ? Icons.dark_mode : Icons.light_mode;

                              return SizedBox(
                                width: 32,
                                height: 32,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: Icon(themeIcon, size: 20),
                                  tooltip: isDarkEffective ? 'Switch to light theme' : 'Switch to dark theme',
                                  onPressed: () {
                                    final newMode = isDarkEffective ? ThemeMode.light : ThemeMode.dark;
                                    themeModel.setThemeMode(newMode);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Use your email to receive a one-time code.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                      ),
                      const SizedBox(height: 24),

                      // ... rest of your existing widgets stay the same
                      const SizedBox(height: 8),
                      Text(
                        'Use your email to receive a one-time code.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                      ),
                      const SizedBox(height: 24),

                      if (viewModel.stage == AuthStage.enterEmail) ...[
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                          onChanged: viewModel.setEmail,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: viewModel.sendOtpCommand.execute,
                            child: viewModel.sendOtpCommand.isPending
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Text('Send code'),
                          ),
                        ),
                      ] else ...[
                        Text('We’ve sent a code to:', style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 4),
                        Text(
                          viewModel.email,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _codeController,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Enter 6-digit code',
                            border: OutlineInputBorder(),
                            counterText: '',
                          ),
                          onChanged: viewModel.setCode,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: viewModel.verifyOtpCommand.execute,
                            child: viewModel.verifyOtpCommand.isPending
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Text('Verify & continue'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            TextButton(
                              onPressed: viewModel.backToEmailStepCommand.execute,
                              child: const Text('Back'),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: viewModel.sendOtpCommand.execute,
                              child: const Text('Resend code'),
                            ),
                          ],
                        ),
                      ],

                      if (viewModel.hasError()) ...[
                        const SizedBox(height: 12),
                        Text(
                          viewModel.getFriendlyErrorMessage(),
                          style: TextStyle(color: cs.error, fontSize: 13),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
