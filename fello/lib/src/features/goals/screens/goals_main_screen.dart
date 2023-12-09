import 'package:fello/src/common/custom_outline_button.dart'
    show CustomOutlineButton;
import 'package:fello/src/common/sleek_outline_widget.dart'
    show SleekOutlineWidget;
import 'package:fello/src/constants/constants.dart' show AssetType;
import 'package:fello/src/constants/strings.dart' show goalDesc;
import 'package:fello/src/features/goals/data/asset_types.dart'
    show assetTypesList;
import 'package:fello/src/features/slots_game/screens/slots_game_screen.dart'
    show SlotsGameScreen;
import 'package:flutter/material.dart'
    show
        AppBar,
        BorderSide,
        Colors,
        Icons,
        InputDecoration,
        MaterialPageRoute,
        OutlineInputBorder,
        Scaffold,
        TextFormField,
        Theme;

import 'package:flutter/widgets.dart'
    show
        BuildContext,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Expanded,
        FontWeight,
        Form,
        FormState,
        GestureDetector,
        GlobalKey,
        Icon,
        Image,
        Navigator,
        Padding,
        Row,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextAlign,
        TextInputType,
        Widget;

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  // TextEditingController

  final _formKey = GlobalKey<FormState>();
  AssetType _selectedType = AssetType.none;

  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 18,
        ),
        child: Column(
          children: [
            // Title png, description and form
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Title png,
                    Image.asset(
                      'assets/images/piggy.png',
                      scale: 3.6,
                    ),
                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                      ),
                      child: Text(
                        'Goal Based Savings',
                        style: txtTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        goalDesc,
                        textAlign: TextAlign.center,
                        style: txtTheme.bodyMedium!.copyWith(),
                      ),
                    ),

                    // Form

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const GoalFormFields(
                                hintxt: 'Title of goal',
                                errorText: 'Please enter some text',
                              ),
                              const GoalFormFields(
                                hintxt: 'Add Description (optional)',
                                errorText: '',
                                isNotRequired: true,
                              ),
                              const GoalFormFields(
                                hintxt: 'Duration (in months)',
                                errorText: "Can't be empty",
                                keyboardType: TextInputType.number,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Asset Type',
                                      style: txtTheme.bodyLarge,
                                    ),
                                    Row(
                                      children: [
                                        customToggleButton(0),
                                        customToggleButton(1),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GoalFormFields(
                                errorText: _selectedType == AssetType.p2p
                                    ? 'Min Amount ₹100'
                                    : "Can't be empty",
                                hintxt: '₹ Amount',
                                keyboardType: TextInputType.number,
                                // validation: _selectedType == AssetType.p2p
                                //     ? (String? value) {
                                //         String errTxt = '';
                                //         if (int.parse(value!) < 100) {
                                //           errTxt = "Please enter more ₹100";
                                //         }
                                //         return errTxt;
                                //       }
                                //     : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Save button

            CustomOutlineButton(
              title: "Save ",
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              width: double.infinity,
              onTap: () => submit(),
            ),
          ],
        ),
      ),
    );
  }

  submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const SlotsGameScreen(),
        ),
      );
    }
  }

  Widget customToggleButton(int index) {
    return SleekOutlineWidget(
      bgColor:
          _selectedType == assetTypesList[index].$1 ? Colors.deepPurple : null,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedType = assetTypesList[index].$1;
            _formKey.currentState!.validate();
          });
        },
        child: Text(
          assetTypesList[index].$2,
        ),
      ),
    );
  }
}

class GoalFormFields extends StatelessWidget {
  const GoalFormFields({
    super.key,
    required this.errorText,
    required this.hintxt,
    this.keyboardType,
    this.isNotRequired = false,
    this.validation,
  });

  final String errorText;
  final String hintxt;
  final TextInputType? keyboardType;
  final bool isNotRequired;

  final Function(String? value)? validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: TextFormField(
        validator: isNotRequired
            ? null
            : (value) {
                if (validation != null) {
                  validation!(value);
                } else {
                  if (value == null || value.isEmpty) {
                    return errorText;
                  }
                }
                return null;
              },
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple,
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          // ignore: unnecessary_null_comparison
          hintText: hintxt,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
