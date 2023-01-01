import 'package:flutter/foundation.dart';
import 'package:flutter/src/material/card.dart';

class transactions {
  late final String? id;
  late final String? title;
  late final double? rate;
  late final DateTime date;

  transactions({
    required this.id,
    required this.title,
    required this.rate,
    required this.date,
  });
}
