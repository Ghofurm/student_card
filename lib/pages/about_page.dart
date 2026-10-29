import 'package:flutter/material.dart';

import '../data/student.dart';
import '../theme/app_theme.dart';
import '../widgets/app_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const route = '/tentang';

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
            child: Text('Tentang', style: text.headlineSmall),
          ),
          const SizedBox(height: 12),
          Text(
            'Kartu mahasiswa digital ${currentStudent.name}, '
            'mahasiswa ${currentStudent.program} '
            '${currentStudent.university}.',
            style: text.bodyLarge!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 40),
          const SectionTitle('Kampus'),
          const SizedBox(height: 16),
          Text(
            'Universitas PGRI Semarang',
            style: text.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'The Meaning University',
            style: text.bodyMedium!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 12),
          Text(
            'Jl. Sidodadi Timur No. 24, Karangtempel, '
            'Semarang Timur, Kota Semarang 50232',
            style: text.bodyMedium!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 4),
          Text(
            'upgris.ac.id',
            style: text.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 40),
          const SectionTitle('Aplikasi'),
          const SizedBox(height: 16),
          Text(
            'Menampilkan identitas, program studi, dan status akademik '
            'dalam satu kartu. Tampilan ini bukan pengganti KTM resmi kampus.',
            style: text.bodyMedium!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 12),
          Text(
            'Versi 1.0.0 · Dibuat dengan Flutter',
            style: text.bodySmall!.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 56),
          Text(
            '${currentStudent.name} · ${currentStudent.npm}',
            style: text.bodySmall!.copyWith(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}
