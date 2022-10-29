// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fit_fit_meal/screens/main/widgets/bar.dart';
import 'package:fit_fit_meal/utils/insets.dart';

class BarChart extends StatelessWidget {
  final List<double> data;
  final List<String>? labels;
  final double? height;
  final double? width;
  final Widget? title;
  final Widget? subtitle;
  const BarChart({
    Key? key,
    required this.data,
    this.labels,
    this.height,
    this.width,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int labelIndex = 0;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title ?? const SizedBox(),
            subtitle ?? const SizedBox(),
            const SizedBox(height: Insets.xs),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ...data
                      .map(
                        (value) => Expanded(
                          child: Bar(
                            value: _calculateValue(data, value),
                            label: labels?.length == data.length
                                ? Text(
                                    labels![labelIndex++],
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateValue(List<double> data, double value) =>
      value / data.reduce(max);
}
