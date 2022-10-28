// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fit_fit_meal/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:fit_fit_meal/data/models/activity_item.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/third_tutorial_page/utils/activity_items.dart';
import 'package:fit_fit_meal/screens/tutorial/utils/tutorial_elevated_button_decoration.dart';
import 'package:fit_fit_meal/utils/insets.dart';

import '../../../../widgets/boxDecoration/home_gradnient_bacground.dart';

// ignore: must_be_immutable
class ThirdTutorialPage extends StatefulWidget {
  ActivityItem? currentItem;
  ThirdTutorialPage({
    Key? key,
    this.currentItem,
  }) : super(key: key);

  @override
  State<ThirdTutorialPage> createState() => _ThirdTutorialPageState();
}

class _ThirdTutorialPageState extends State<ThirdTutorialPage> {
  @override
  void initState() {
    try {
      final item = ActivityItems.activities.firstWhere(
          (activity) => activity.value == UserSharedPreferences.getUserPAL());
      widget.currentItem = item;
      // ignore: empty_catches
    } catch (e) {}
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();

    if (widget.currentItem != null) {
      await UserSharedPreferences.setUserPAL(widget.currentItem!.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: homeGradientBacground(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: Column(
              children: [
                const Spacer(),
                _activityTitle(),
                const Spacer(),
                const SizedBox(height: Insets.s),
                Expanded(
                  flex: 10,
                  child: _activityPicker(
                      width, orientation == Orientation.portrait ? 2 : 4),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _activityTitle() => const AutoSizeText(
        "How active are you?",
        maxLines: 1,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      );

  Widget _activityPicker(double width, int crossAxisCount) => GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          ...ActivityItems.activities
              .map((activity) => _activityChoice(activity, width)),
        ],
      );

  Widget _activityChoice(ActivityItem activity, double width) => Opacity(
        opacity: widget.currentItem == activity || widget.currentItem == null
            ? 1.0
            : 0.7,
        child: ElevatedButton(
          onPressed: () => setState(
            () => widget.currentItem = activity,
          ),
          style: tutorialElevatedButtonDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(Insets.xs),
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 3, child: LottieBuilder.asset(activity.lottiePath)),
                const SizedBox(height: Insets.xs),
                Expanded(
                  child: AutoSizeText(
                    activity.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
