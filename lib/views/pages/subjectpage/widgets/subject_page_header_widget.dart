import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubjectPageHeaderWidget extends StatelessWidget {
  const SubjectPageHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: FractionalOffset.centerLeft,
          child: Column(
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Hello \nNaveen',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            'assets/images/home_bg_image.svg.svg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
