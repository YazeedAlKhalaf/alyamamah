import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextX on BuildContext {
  S get s => S.of(this)!;
}
