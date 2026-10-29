import 'package:flutter/material.dart';

import '../data/student.dart';
import '../theme/app_theme.dart';
import '../widgets/app_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const route = '/profil';

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return AppPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BackLink(),
          const SizedBox(height: 24),
          Semantics(
            header: true,
            child: Text('Profil mahasiswa', style: text.headlineSmall),
          ),
          const SizedBox(height: 12),
          Text(
            'Data akademik ${currentStudent.name}.',
            style: text.bodyLarge!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 40),
          const SectionTitle('Identitas'),
          const SizedBox(height: 20),
          _Facts(
            rows: [
              (label: 'Nama', value: currentStudent.name),
              (label: 'NPM', value: currentStudent.npm),
            ],
          ),
          const SizedBox(height: 40),
          const SectionTitle('Akademik'),
          const SizedBox(height: 20),
          _Facts(
            rows: [
              (label: 'Program studi', value: currentStudent.program),
              (label: 'Fakultas', value: currentStudent.faculty),
              (label: 'Jenjang', value: currentStudent.degree),
              (label: 'Angkatan', value: '${currentStudent.intakeYear}'),
              (label: 'Status', value: currentStudent.status),
            ],
          ),
          const SizedBox(height: 56),
          Text(
            'Kartu identitas digital · Universitas PGRI Semarang',
            style: text.bodySmall!.copyWith(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _Facts extends StatelessWidget {
  const _Facts({required this.rows});

  final List<({String label, String value})> rows;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          if (i > 0) const SizedBox(height: 20),
          Text(
            rows[i].label,
            style: text.bodySmall!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 2),
          Text(
            rows[i].value,
            style: text.bodyLarge!.copyWith(
              height: 1.3,
              fontWeight: FontWeight.w600,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ],
    );
  }
}
