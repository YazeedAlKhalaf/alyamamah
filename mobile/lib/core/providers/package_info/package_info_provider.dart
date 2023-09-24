import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// This will be overrided in the ProviderScope that is in the App widget.
final packageInfoProvider = Provider<PackageInfo>((ref) {
  throw UnimplementedError();
});
