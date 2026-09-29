import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/l10n_extension.dart';
import '../../providers/auth_provider.dart';
import '../settings/more_screen.dart';

/// Bottom navigation: Dashboard, Sales, Invoices, Products, Customers, More.
/// Tabs 0-4 are placeholders now and get real screens in later phases.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final pages = <Widget>[
      const _DashboardPlaceholder(),
      _PlaceholderPage(icon: Icons.point_of_sale_rounded, title: l10n.sales),
      _PlaceholderPage(icon: Icons.receipt_long_rounded, title: l10n.invoices),
      _PlaceholderPage(icon: Icons.inventory_2_rounded, title: l10n.products),
      _PlaceholderPage(icon: Icons.people_alt_rounded, title: l10n.customers),
      const MoreScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _index, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.dashboard_outlined),
              selectedIcon: const Icon(Icons.dashboard_rounded),
              label: l10n.dashboard),
          NavigationDestination(
              icon: const Icon(Icons.point_of_sale_outlined),
              selectedIcon: const Icon(Icons.point_of_sale_rounded),
              label: l10n.sales),
          NavigationDestination(
              icon: const Icon(Icons.receipt_long_outlined),
              selectedIcon: const Icon(Icons.receipt_long_rounded),
              label: l10n.invoices),
          NavigationDestination(
              icon: const Icon(Icons.inventory_2_outlined),
              selectedIcon: const Icon(Icons.inventory_2_rounded),
              label: l10n.products),
          NavigationDestination(
              icon: const Icon(Icons.people_alt_outlined),
              selectedIcon: const Icon(Icons.people_alt_rounded),
              label: l10n.customers),
          NavigationDestination(
              icon: const Icon(Icons.grid_view_outlined),
              selectedIcon: const Icon(Icons.grid_view_rounded),
              label: l10n.more),
        ],
      ),
    );
  }
}

class _DashboardPlaceholder extends StatelessWidget {
  const _DashboardPlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<AuthProvider>().user;
    final name = user?.displayName ?? user?.email ?? '';

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.welcomeUser(name),
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.appName,
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const Expanded(child: SizedBox()),
          Center(
            child: _ComingSoon(
              icon: Icons.dashboard_rounded,
              title: context.l10n.dashboard,
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) =>
      Center(child: _ComingSoon(icon: icon, title: title));
}

class _ComingSoon extends StatelessWidget {
  const _ComingSoon({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 64, color: theme.colorScheme.primary),
        const SizedBox(height: 12),
        Text(title,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(context.l10n.comingSoon,
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      ],
    );
  }
}
