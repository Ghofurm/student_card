import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../data/student.dart';
import '../theme/app_theme.dart';

class StudentCard extends StatefulWidget {
  const StudentCard({super.key, required this.student});

  final Student student;

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _flip = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );
  late final Animation<double> _turn = CurvedAnimation(
    parent: _flip,
    curve: Curves.easeInOutCubic,
  );

  bool get _showingBack => _flip.value > 0.5;

  void _toggle() => _showingBack ? _flip.reverse() : _flip.forward();

  @override
  void dispose() {
    _flip.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _turn,
      builder: (context, _) {
        final angle = _turn.value * math.pi;
        final showingBack = angle > math.pi / 2;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1.586,
              child: GestureDetector(
                onTap: _toggle,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.0012)
                      ..rotateY(angle),
                    child: showingBack
                        ? Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateY(math.pi),
                            child: _CardBack(student: widget.student),
                          )
                        : _CardFront(student: widget.student),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: _toggle,
                icon: const Icon(Icons.flip, size: 18),
                label: Text(
                  showingBack ? 'Lihat sisi depan' : 'Lihat sisi belakang',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CardFront extends StatelessWidget {
  const _CardFront({required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('Universitas PGRI Semarang', style: _meta),
              ),
              Text(
                'Kartu Mahasiswa',
                style: _meta.copyWith(
                  color: AppColors.yellow,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _Portrait(initials: student.initials),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      student.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.08,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      student.npm,
                      style: _meta.copyWith(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${student.degree} ${student.program}',
                  style: _meta,
                ),
              ),
              _Status(status: student.status),
            ],
          ),
        ],
      ),
    );
  }
}

const _meta = TextStyle(
  color: Colors.white70,
  fontSize: 12,
  height: 1.3,
  letterSpacing: 0.1,
);

class _Portrait extends StatelessWidget {
  const _Portrait({required this.initials});

  static const photoAsset = 'assets/images/profil.jpg';

  final String initials;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 64,
        height: 80,
        child: Image.asset(
          photoAsset,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.white.withValues(alpha: 0.12),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Status extends StatelessWidget {
  const _Status({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: AppColors.active,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 7),
        Text(status, style: _meta),
      ],
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack({required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('Universitas PGRI Semarang', style: _metaDark),
              ),
              Text('Kartu Mahasiswa', style: _metaDark.copyWith(fontSize: 11)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _BackField(label: 'NPM', value: student.npm),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _BackField(
                  label: 'Angkatan',
                  value: '${student.intakeYear}',
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _BackField(
                  label: 'Program studi',
                  value: student.program,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _BackField(label: 'Fakultas', value: student.faculty),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Text('The Meaning University', style: _metaDark),
              ),
              Text(
                'upgris.ac.id',
                style: _metaDark.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const _metaDark = TextStyle(
  color: AppColors.muted,
  fontSize: 11,
  height: 1.3,
  letterSpacing: 0.1,
);

class _BackField extends StatelessWidget {
  const _BackField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: _metaDark),
        const SizedBox(height: 3),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.navy,
            fontSize: 14,
            height: 1.25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
