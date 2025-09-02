import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guruh5/core/assets/app_icons.dart';
import 'package:guruh5/core/assets/app_images.dart';
import 'package:guruh5/core/widgets/app_buttons.dart';
import 'package:guruh5/features/auth/presentation/pages/sign_up_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final List<_Page> _pages = [
    _Page(
      image: AppImages.onboarding1,
      title: 'Now reading books will be easier',
      content:
          'Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
    ),
    _Page(
      image: AppImages.onboarding2,
      title: 'Your Bookish Soulmate Awaits',
      content:
          'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
    ),
    _Page(
      image: AppImages.onboarding3,
      title: 'Start Your Adventure',
      content:
          "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
    ),
  ];
  final PageController controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int lastPage = _pages.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                if (_page != lastPage) {
                  controller.animateToPage(
                    lastPage,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text('Skip'),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged:
                    (value) => setState(() {
                      _page = value;
                    }),
                controller: controller,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage(page.image)),
                        Text(
                          page.title,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(page.content),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: controller,
                count: _pages.length,
                effect: ScaleEffect(
                  dotHeight: 10.0,
                  dotWidth: 10.0,
                  scale: 2.0,
                  activeDotColor: Colors.deepPurple,
                ),
              ),
            ),
            SvgPicture.asset(
              AppIcons.home,
              colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: PrimaryButton(
                title: _page == lastPage ? 'Get started' : 'Continue',
                height: 56.0,
                radius: 12.0,
                onPressed: () {
                  if (_page != lastPage) {
                    controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page {
  final String image;
  final String title;
  final String content;

  _Page({required this.image, required this.title, required this.content});
}
