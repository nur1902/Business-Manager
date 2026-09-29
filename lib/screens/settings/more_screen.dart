import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/l10n_extension.dart';
import '../../providers/auth_provider.dart';
import '../../providers/settings_provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final auth = context.read<AuthProvider>();
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.logoutConfirmTitle),
        content: Text(l10n.logoutConfirmMessage),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(96, 44)),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.logout),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await auth.signOut(); // router sends the user back to the login screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final user = context.watch<AuthProvider>().user;
    final settings = context.watch<SettingsProvider>();
    final currentLang = settings.locale?.languageCode ??
        Localizations.localeOf(context).languageCode;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : null,
                  child: user?.photoURL == null
                      ? const Icon(Icons.person_rounded)
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user?.displayName ?? '',
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      Text(user?.email ?? '',
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(l10n.theme, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<ThemeMode>(
          showSelectedIcon: false,
          segments: [
            ButtonSegment(value: ThemeMode.system, label: Text(l10n.themeSystem)),
            ButtonSegment(value: ThemeMode.light, label: Text(l10n.themeLight)),
            ButtonSegment(value: ThemeMode.dark, label: Text(l10n.themeDark)),
          ],
          selected: {settings.themeMode},
          onSelectionChanged: (s) => settings.setThemeMode(s.first),
        ),
        const SizedBox(height: 24),
        Text(l10n.language, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          showSelectedIcon: false,
          segments: [
            ButtonSegment(value: 'en', label: Text(l10n.languageEnglish)),
            ButtonSegment(value: 'bn', label: Text(l10n.languageBangla)),
          ],
          selected: {currentLang},
          onSelectionChanged: (s) => settings.setLocale(Locale(s.first)),
        ),
        const SizedBox(height: 32),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            foregroundColor: theme.colorScheme.error,
          ),
          onPressed: () => _confirmLogout(context),
          icon: const Icon(Icons.logout_rounded),
          label: Text(l10n.logout),
        ),
      ],
    );
  }
}
