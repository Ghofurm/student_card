import 'package:flutter/material.dart';

import '../data/student.dart';
import '../theme/app_theme.dart';
import '../widgets/app_page.dart';
import '../widgets/student_card.dart';
import 'about_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return AppPage(
      maxWidth: 1040,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Kartu Mahasiswa',
                style: text.labelLarge!.copyWith(fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, AboutPage.route),
                child: const Text('Tentang'),
              ),
            ],
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 900;
              return wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _Intro(wide: true)),
                        const SizedBox(width: 64),
                        const SizedBox(
                          width: 440,
                          child: StudentCard(student: currentStudent),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _Intro(wide: false),
                        const SizedBox(height: 36),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 560),
                            child: const StudentCard(student: currentStudent),
                          ),
                        ),
                      ],
                    );
            },
          ),
          const SizedBox(height: 56),
          Text(
            'Universitas PGRI Semarang · The Meaning University',
            style: text.bodySmall!.copyWith(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({required this.wide});

  final bool wide;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            currentStudent.name,
            style: (wide ? text.displayLarge : text.displayMedium),
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Text(
            'Mahasiswa ${currentStudent.program} '
            'di ${currentStudent.university}.',
            style: text.bodyLarge!.copyWith(color: AppColors.muted),
          ),
        ),
        const SizedBox(height: 28),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: wide ? 320 : 400),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.pushNamed(context, ProfilePage.route),
              child: const Text('Lihat profil'),
            ),
          ),
        ),
      ],
    );
  }
}
