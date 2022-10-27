import 'package:fit_fit_meal/screens/tutorial/pages/first_tutorial_page/first_tutorial_apge.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/second_tutorial_page/second_tutorial_page.dart';
import 'package:fit_fit_meal/screens/tutorial/pages/third_tutorial_page/third_tutorial_page.dart';
import 'package:fit_fit_meal/screens/tutorial/widgets/end_tutorial_button.dart';
import 'package:fit_fit_meal/screens/tutorial/widgets/tutorial_footer.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final double _bottomSheetHeight = 70;
  final _pageController = PageController();
  bool isLastPage = false;

  static const List<Widget> _pages = [
    FirstTutorialPage(),
    SecondTuorialPage(),
    ThirdTutorialPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.only(bottom: _heightBottomSheet(orientation)),
        child: PageView(
          controller: _pageController,
          onPageChanged: (pageNumber) => setState(() {
            isLastPage = pageNumber == _pages.length - 1;
          }),
          children: const <Widget>[
            ..._pages,
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? EndTutorialButton(height: _heightBottomSheet(orientation))
          : TutorialFooter(
              height: _heightBottomSheet(orientation),
              pageController: _pageController,
              pageCount: _pages.length,
            ),
    );
  }

  double _heightBottomSheet(Orientation orientation) =>
      orientation == Orientation.portrait ? 65.0 : 50.0;
}
