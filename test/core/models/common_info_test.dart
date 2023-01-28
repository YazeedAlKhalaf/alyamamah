import 'dart:convert';

import 'package:alyamamah/core/models/common_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommonInfo |', () {
    group('verify properties |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'actorImage should be of type String.',
        () {
          expect(commonInfo.actorImage, isA<String>());
        },
      );

      test(
        'actorType should be of type String.',
        () {
          expect(commonInfo.actorType, isA<String>());
        },
      );

      test(
        'latestVersion should be of type String.',
        () {
          expect(commonInfo.latestVersion, isA<String>());
        },
      );

      test(
        'msg should be of type String.',
        () {
          expect(commonInfo.msg, isA<String>());
        },
      );

      test(
        'status should be of type bool.',
        () {
          expect(commonInfo.status, isA<bool>());
        },
      );

      test(
        'userId should be of type String.',
        () {
          expect(commonInfo.userId, isA<String>());
        },
      );
    });

    group('verify copyWith |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'should return a new CommonInfo object with the same values.',
        () {
          final copy = commonInfo.copyWith();
          expect(copy, isNot(same(commonInfo)));
          expect(copy, equals(commonInfo));
        },
      );

      test(
        'should return a new CommonInfo object with the new values.',
        () {
          final copy = commonInfo.copyWith(
            actorImage: 'image2.jpg',
            actorType: 'type2',
            latestVersion: '2.0.0',
            msg: 'Test message 2',
            status: false,
            userId: 'user2',
          );
          expect(copy, isNot(same(commonInfo)));
          expect(
            copy,
            equals(const CommonInfo(
              actorImage: 'image2.jpg',
              actorType: 'type2',
              latestVersion: '2.0.0',
              msg: 'Test message 2',
              status: false,
              userId: 'user2',
            )),
          );
        },
      );
    });

    group('verify toMap |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'converts CommonInfo to a map.',
        () {
          expect(
            commonInfo.toMap(),
            equals({
              'actorImage': 'image.jpg',
              'actorType': 'type',
              'latestVersion': '1.0.0',
              'msg': 'Test message',
              'status': true,
              'userId': 'user1',
            }),
          );
        },
      );
    });

    group('verify fromMap |', () {
      test(
        'converts map to CommonInfo.',
        () {
          expect(
            CommonInfo.fromMap({
              'actorImage': 'image.jpg',
              'actorType': 'type',
              'latestVersion': '1.0.0',
              'msg': 'Test message',
              'status': true,
              'userId': 'user1',
            }),
            equals(const CommonInfo(
              actorImage: 'image.jpg',
              actorType: 'type',
              latestVersion: '1.0.0',
              msg: 'Test message',
              status: true,
              userId: 'user1',
            )),
          );
        },
      );
    });

    group('verify toJson |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'converts CommonInfo to a json.',
        () {
          expect(
            commonInfo.toJson(),
            equals(jsonEncode({
              'actorImage': 'image.jpg',
              'actorType': 'type',
              'latestVersion': '1.0.0',
              'msg': 'Test message',
              'status': true,
              'userId': 'user1',
            })),
          );
        },
      );
    });

    group('verify fromJson |', () {
      test(
        'converts json to CommonInfo.',
        () {
          expect(
            CommonInfo.fromJson(jsonEncode({
              'actorImage': 'image.jpg',
              'actorType': 'type',
              'latestVersion': '1.0.0',
              'msg': 'Test message',
              'status': true,
              'userId': 'user1',
            })),
            equals(const CommonInfo(
              actorImage: 'image.jpg',
              actorType: 'type',
              latestVersion: '1.0.0',
              msg: 'Test message',
              status: true,
              userId: 'user1',
            )),
          );
        },
      );
    });

    group('verify toString |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'should return a string representation of CommonInfo.',
        () {
          expect(
            commonInfo.toString(),
            equals(
              'CommonInfo(actorImage: image.jpg, actorType: type, latestVersion: 1.0.0, msg: Test message, status: true, userId: user1)',
            ),
          );
        },
      );
    });

    group('verify equality works |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'should return true when comparing two equal CommonInfo objects.',
        () {
          final copy = commonInfo.copyWith();
          expect(copy, equals(commonInfo));
        },
      );

      test(
        'should return false when comparing two unequal CommonInfo objects.',
        () {
          final copy = commonInfo.copyWith(
            actorImage: 'image2.jpg',
            actorType: 'type2',
            latestVersion: '2.0.0',
            msg: 'Test message 2',
            status: false,
            userId: 'user2',
          );
          expect(copy, isNot(equals(commonInfo)));
        },
      );
    });

    group('verify hascode |', () {
      late CommonInfo commonInfo;

      setUp(() {
        commonInfo = const CommonInfo(
          actorImage: 'image.jpg',
          actorType: 'type',
          latestVersion: '1.0.0',
          msg: 'Test message',
          status: true,
          userId: 'user1',
        );
      });

      test(
        'should return the same hashcode for two equal CommonInfo objects.',
        () {
          final copy = commonInfo.copyWith();
          expect(copy.hashCode, equals(commonInfo.hashCode));
        },
      );

      test(
        'should return a different hashcode for two unequal CommonInfo objects.',
        () {
          final copy = commonInfo.copyWith(
            actorImage: 'image2.jpg',
            actorType: 'type2',
            latestVersion: '2.0.0',
            msg: 'Test message 2',
            status: false,
            userId: 'user2',
          );
          expect(copy.hashCode, isNot(equals(commonInfo.hashCode)));
        },
      );
    });
  });
}
