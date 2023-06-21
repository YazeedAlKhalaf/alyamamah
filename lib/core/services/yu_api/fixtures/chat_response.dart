import 'dart:convert';
import 'dart:typed_data';

final chatPaymentRequiredResponse = {
  'errorCode': 'free-tier-api-calls-limit-reached',
  'message':
      'You have reached the limit of the free trial API calls for your account.',
};

Stream<Uint8List> chatSuccessResponseBodyStream() async* {
  final maps = [
    {
      'data': {'type': 'token', 'data': 'Hi'}
    },
    {
      'data': {'type': 'token', 'data': ' '}
    },
    {
      'data': {'type': 'token', 'data': 'Human!'}
    }
  ];

  for (final map in maps) {
    await Future.delayed(const Duration(milliseconds: 150));

    yield Uint8List.fromList(utf8.encode(jsonEncode(map)));
  }
}
