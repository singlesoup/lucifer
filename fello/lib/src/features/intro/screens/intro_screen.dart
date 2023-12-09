import 'package:fello/src/common/custom_outline_button.dart'
    show CustomOutlineButton;
import 'package:fello/src/common/sleek_outline_widget.dart'
    show SleekOutlineWidget;
import 'package:fello/src/constants/strings.dart'
    show introSubtitle, introTitle;
import 'package:fello/src/features/goals/screens/goals_main_screen.dart'
    show GoalsScreen;
import 'package:fello/src/features/intro/data/user_data.dart' show userData;
import 'package:flutter/material.dart'
    show
        CircleAvatar,
        FontWeight,
        Icons,
        MaterialPageRoute,
        Navigator,
        Row,
        Scaffold,
        SizedBox,
        Theme;

import 'package:flutter/widgets.dart'
    show
        AssetImage,
        BuildContext,
        Column,
        EdgeInsets,
        GestureDetector,
        Icon,
        MainAxisAlignment,
        MainAxisSize,
        Padding,
        SafeArea,
        SingleChildScrollView,
        StatelessWidget,
        Text,
        Widget;

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 26,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            Text(
                              userData.name,
                              style: txtTheme.labelLarge!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SleekOutlineWidget(
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.all(4),
                              child: Text(
                                'Level : ${userData.level}',
                                style: txtTheme.labelSmall!.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SleekOutlineWidget(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.menu),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 200,
                ),

                // Desc Body
                SleekOutlineWidget(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      Text(
                        introTitle,
                        style: txtTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          introSubtitle,
                          style: txtTheme.labelLarge!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),

                // Button

                Padding(
                  padding: const EdgeInsets.only(
                    top: 180,
                  ),
                  child: CustomOutlineButton(
                    title: "Start Saving ➝ ",
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const GoalsScreen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Todo: Add some animations here