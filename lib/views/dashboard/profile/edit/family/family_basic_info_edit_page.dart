import 'package:flutter/material.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class FamilyBasicInfoEditPage extends StatefulWidget {
  const FamilyBasicInfoEditPage({super.key});

  @override
  State<FamilyBasicInfoEditPage> createState() =>
      _FamilyBasicInfoEditPageState();
}

class _FamilyBasicInfoEditPageState extends State<FamilyBasicInfoEditPage> {
  TextEditingController familyDetailsController = TextEditingController();
  TextEditingController marriedSistersController = TextEditingController();
  TextEditingController unmarriedSistersController = TextEditingController();
  TextEditingController marriedBrothersController = TextEditingController();
  TextEditingController unmarriedBrothersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Family information',
      onTap: () {},
      children: [
        CustomField(
          hintText: 'Family Details',
          controller: familyDetailsController,
          minLine: 3,
          maxLine: 3,
        ),
        const CustomDropDownButton(items: ['Father\'s occupation', '']),
        const CustomDropDownButton(items: ['Mother\'s occupation', '']),
        CustomField(
            hintText: 'Married Sisters', controller: marriedSistersController),
        CustomField(
            hintText: 'Unmarried Sisters',
            controller: unmarriedSistersController),
        CustomField(
            hintText: 'Unmarried Brothers',
            controller: unmarriedBrothersController),
        CustomField(
            hintText: 'Married Borthers',
            controller: marriedBrothersController),
        const CustomDropDownButton(items: ['Native Country', '']),
        const CustomDropDownButton(items: ['Native State', '']),
        const CustomDropDownButton(items: ['Native City', '']),
        const CustomDropDownButton(items: ['Family Value', '']),
        const CustomDropDownButton(items: ['Affluence level', '']),
      ],
    );
  }
}
