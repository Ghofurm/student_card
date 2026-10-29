import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:student_card/main.dart';

void main() {
  testWidgets('kartu dapat dibalik dan halaman profil terbuka', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const StudentCardApp());

    expect(find.text('Muchammad Abdul Ghofur'), findsWidgets);
    expect(find.text('Lihat sisi belakang'), findsOneWidget);

    await tester.tap(find.text('Lihat sisi belakang'));
    await tester.pumpAndSettle();
    expect(find.text('Lihat sisi depan'), findsOneWidget);
    expect(find.text('Teknik dan Informatika'), findsOneWidget);

    await tester.tap(find.text('Lihat profil'));
    await tester.pumpAndSettle();
    expect(find.text('Profil mahasiswa'), findsOneWidget);
    expect(find.text('24670008'), findsOneWidget);
  });
}
