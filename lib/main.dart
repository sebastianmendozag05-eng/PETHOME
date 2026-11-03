import 'package:flutter/material.dart';

void main() => runApp(const PethomeApp());

class PethomeApp extends StatelessWidget {
  const PethomeApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'PETHOME',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFFFF8A3D),
          useMaterial3: true,
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        home: const WelcomeScreen(),
      );
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    final t = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [c.primaryContainer, c.surface],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: c.surface,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: c.primary.withValues(alpha: 0.25),
                            blurRadius: 32,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Icon(Icons.pets, size: 88, color: c.primary),
                    ),
                    const SizedBox(height: 32),
                    Text('PETHOME',
                        style: t.displaySmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: 4,
                            color: c.onPrimaryContainer)),
                    const SizedBox(height: 8),
                    Text('Adopta, no abandones',
                        style: t.titleMedium
                            ?.copyWith(color: c.onSurfaceVariant)),
                    const SizedBox(height: 24),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        Chip(
                            avatar: Icon(Icons.search, size: 18),
                            label: Text('Explora')),
                        Chip(
                            avatar: Icon(Icons.favorite, size: 18),
                            label: Text('Guarda favoritos')),
                        Chip(
                            avatar: Icon(Icons.add_circle, size: 18),
                            label: Text('Publica')),
                      ],
                    ),
                    const Spacer(flex: 3),
                    FilledButton(
                        onPressed: () {}, child: const Text('Comenzar')),
                    const SizedBox(height: 12),
                    Text('Tizayuca, Hidalgo',
                        style: t.bodySmall
                            ?.copyWith(color: c.onSurfaceVariant)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}