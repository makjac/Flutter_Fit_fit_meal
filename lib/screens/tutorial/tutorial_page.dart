import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final double _bottomSheetHeight = 70;
  final _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.only(bottom: _bottomSheetHeight),
        child: PageView(
          controller: _pageController,
          onPageChanged: (pageNumber) => setState(() {
            isLastPage = pageNumber == 3;
          }),
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: homeGradientBacground(),
              child: const SafeArea(
                child: Center(
                  child: Text("Page 1"),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: homeGradientBacground(),
              child: const SafeArea(
                child: Center(
                  child: Text("Page 2"),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: homeGradientBacground(),
              child: const SafeArea(
                child: Center(
                  child: Text("Page 3"),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: homeGradientBacground(),
              child: const SafeArea(
                child: Center(
                  child: Text("Page 4"),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () => context.go("/home"),
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                  minimumSize: Size.fromHeight(_bottomSheetHeight),
                ),
                child: const Text("Let's get started!"),
              ),
            )
          : Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: _bottomSheetHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text("SKIP"),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: const WormEffect(
                      dotColor: Color.fromARGB(190, 158, 158, 158),
                      activeDotColor: Colors.white,
                    ),
                    onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                  ),
                  TextButton(
                    onPressed: () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInCubic),
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text("NEXT"),
                  ),
                ],
              ),
            ),
    );
  }
}
