import 'dart:convert';

import 'package:alyamamah/core/models/semester.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Semester |', () {
    group('verify properties |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'currentSemester should be of type String.',
        () {
          expect(semester.currentSemester, isA<String>());
        },
      );

      test(
        'currentSemesterDesc should be of type String.',
        () {
          expect(semester.currentSemesterDesc, isA<String>());
        },
      );

      test(
        'markSemester should be of type String.',
        () {
          expect(semester.markSemester, isA<String>());
        },
      );

      test(
        'markSemesterDesc should be of type String.',
        () {
          expect(semester.markSemesterDesc, isA<String>());
        },
      );

      test(
        'prevSemester should be of type String.',
        () {
          expect(semester.prevSemester, isA<String>());
        },
      );

      test(
        'prevSemesterDesc should be of type String.',
        () {
          expect(semester.prevSemesterDesc, isA<String>());
        },
      );

      test(
        'regSemester should be of type String.',
        () {
          expect(semester.regSemester, isA<String>());
        },
      );

      test(
        'regSemesterDesc should be of type String.',
        () {
          expect(semester.regSemesterDesc, isA<String>());
        },
      );

      test(
        'yearSemester should be of type String.',
        () {
          expect(semester.yearSemester, isA<String>());
        },
      );

      test(
        'yearSemesterDesc should be of type String.',
        () {
          expect(semester.yearSemesterDesc, isA<String>());
        },
      );
    });

    group('verify copyWith |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'copyWith should return a new instance of Semester.',
        () {
          expect(
            semester.copyWith(),
            isA<Semester>(),
          );
        },
      );

      test(
        'copyWith should return a new instance of Semester with the same values.',
        () {
          expect(
            semester.copyWith(),
            equals(semester),
          );
        },
      );

      test(
        'copyWith should return a new instance of Semester with the new values.',
        () {
          expect(
            semester.copyWith(
              currentSemester: 'currentSemester2',
              currentSemesterDesc: 'currentSemesterDesc2',
              markSemester: 'markSemester2',
              markSemesterDesc: 'markSemesterDesc2',
              prevSemester: 'prevSemester2',
              prevSemesterDesc: 'prevSemesterDesc2',
              regSemester: 'regSemester2',
              regSemesterDesc: 'regSemesterDesc2',
              yearSemester: 'yearSemester2',
              yearSemesterDesc: 'yearSemesterDesc2',
            ),
            isNot(equals(semester)),
          );
        },
      );
    });

    group('verify toMap |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'toMap should return a Map<String, dynamic>.',
        () {
          expect(
            semester.toMap(),
            isA<Map<String, dynamic>>(),
          );
        },
      );

      test(
        'toMap should return a Map<String, dynamic> with the correct values.',
        () {
          expect(
            semester.toMap(),
            equals({
              'currentSemester': 'currentSemester',
              'currentSemesterDesc': 'currentSemesterDesc',
              'markSemester': 'markSemester',
              'markSemesterDesc': 'markSemesterDesc',
              'prevSemester': 'prevSemester',
              'prevSemesterDesc': 'prevSemesterDesc',
              'regSemester': 'regSemester',
              'regSemesterDesc': 'regSemesterDesc',
              'yearSemester': 'yearSemester',
              'yearSemesterDesc': 'yearSemesterDesc',
            }),
          );
        },
      );
    });

    group('verify fromMap |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'fromMap should return a Semester.',
        () {
          expect(
            Semester.fromMap(semester.toMap()),
            isA<Semester>(),
          );
        },
      );

      test(
        'fromMap should return a Semester with the correct values.',
        () {
          expect(
            Semester.fromMap(semester.toMap()),
            equals(semester),
          );
        },
      );
    });

    group('verify toJson |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'converts Semester to a json.',
        () {
          expect(
            semester.toJson(),
            equals(jsonEncode({
              'currentSemester': 'currentSemester',
              'currentSemesterDesc': 'currentSemesterDesc',
              'markSemester': 'markSemester',
              'markSemesterDesc': 'markSemesterDesc',
              'prevSemester': 'prevSemester',
              'prevSemesterDesc': 'prevSemesterDesc',
              'regSemester': 'regSemester',
              'regSemesterDesc': 'regSemesterDesc',
              'yearSemester': 'yearSemester',
              'yearSemesterDesc': 'yearSemesterDesc',
            })),
          );
        },
      );
    });

    group('verify fromJson |', () {
      test(
        'converts json to a Semester.',
        () {
          expect(
            Semester.fromJson(jsonEncode({
              'currentSemester': 'currentSemester',
              'currentSemesterDesc': 'currentSemesterDesc',
              'markSemester': 'markSemester',
              'markSemesterDesc': 'markSemesterDesc',
              'prevSemester': 'prevSemester',
              'prevSemesterDesc': 'prevSemesterDesc',
              'regSemester': 'regSemester',
              'regSemesterDesc': 'regSemesterDesc',
              'yearSemester': 'yearSemester',
              'yearSemesterDesc': 'yearSemesterDesc',
            })),
            equals(const Semester(
              currentSemester: 'currentSemester',
              currentSemesterDesc: 'currentSemesterDesc',
              markSemester: 'markSemester',
              markSemesterDesc: 'markSemesterDesc',
              prevSemester: 'prevSemester',
              prevSemesterDesc: 'prevSemesterDesc',
              regSemester: 'regSemester',
              regSemesterDesc: 'regSemesterDesc',
              yearSemester: 'yearSemester',
              yearSemesterDesc: 'yearSemesterDesc',
            )),
          );
        },
      );
    });

    group('verify toString |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'toString should return a String with the correct values.',
        () {
          expect(
            semester.toString(),
            equals(
              'Semester(currentSemester: currentSemester, currentSemesterDesc: currentSemesterDesc, markSemester: markSemester, markSemesterDesc: markSemesterDesc, prevSemester: prevSemester, prevSemesterDesc: prevSemesterDesc, regSemester: regSemester, regSemesterDesc: regSemesterDesc, yearSemester: yearSemester, yearSemesterDesc: yearSemesterDesc)',
            ),
          );
        },
      );
    });

    group('verify equality works |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'should return true when comparing two equal Semester objects.',
        () {
          final copy = semester.copyWith();
          expect(copy, equals(semester));
        },
      );

      test(
        'should return false when comparing two unequal Semester objects.',
        () {
          final copy = semester.copyWith(
            currentSemester: 'currentSemester2',
            currentSemesterDesc: 'currentSemesterDesc2',
            markSemester: 'markSemester2',
            markSemesterDesc: 'markSemesterDesc2',
            prevSemester: 'prevSemester2',
            prevSemesterDesc: 'prevSemesterDesc2',
            regSemester: 'regSemester2',
            regSemesterDesc: 'regSemesterDesc2',
            yearSemester: 'yearSemester2',
            yearSemesterDesc: 'yearSemesterDesc2',
          );
          expect(copy, isNot(equals(semester)));
        },
      );
    });

    group('verify hascode |', () {
      late Semester semester;

      setUp(() {
        semester = const Semester(
          currentSemester: 'currentSemester',
          currentSemesterDesc: 'currentSemesterDesc',
          markSemester: 'markSemester',
          markSemesterDesc: 'markSemesterDesc',
          prevSemester: 'prevSemester',
          prevSemesterDesc: 'prevSemesterDesc',
          regSemester: 'regSemester',
          regSemesterDesc: 'regSemesterDesc',
          yearSemester: 'yearSemester',
          yearSemesterDesc: 'yearSemesterDesc',
        );
      });

      test(
        'should return the same hashcode for two equal Semester objects.',
        () {
          final copy = semester.copyWith();
          expect(copy.hashCode, equals(semester.hashCode));
        },
      );

      test(
        'should return a different hashcode for two unequal Semester objects.',
        () {
          final copy = semester.copyWith(
            currentSemester: 'currentSemester2',
            currentSemesterDesc: 'currentSemesterDesc2',
            markSemester: 'markSemester2',
            markSemesterDesc: 'markSemesterDesc2',
            prevSemester: 'prevSemester2',
            prevSemesterDesc: 'prevSemesterDesc2',
            regSemester: 'regSemester2',
            regSemesterDesc: 'regSemesterDesc2',
            yearSemester: 'yearSemester2',
            yearSemesterDesc: 'yearSemesterDesc2',
          );
          expect(copy.hashCode, isNot(equals(semester.hashCode)));
        },
      );
    });
  });
}
