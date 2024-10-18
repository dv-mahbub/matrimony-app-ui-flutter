import 'package:flutter/material.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class FuturePlanEdit extends StatefulWidget {
  const FuturePlanEdit({super.key});

  @override
  State<FuturePlanEdit> createState() => _FuturePlanEditState();
}

class _FuturePlanEditState extends State<FuturePlanEdit> {
  TextEditingController professionalGoalController = TextEditingController();
  TextEditingController personalGoalController = TextEditingController();

  @override
  void dispose() {
    professionalGoalController.dispose();
    personalGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
        title: 'Future Plan',
        children: [
          CustomField(
            hintText: 'Write about professional goals',
            controller: professionalGoalController,
            minLine: 3,
            maxLine: 3,
          ),
          CustomField(
            hintText: 'Write about personal goals',
            controller: personalGoalController,
            minLine: 3,
            maxLine: 3,
          ),
        ],
        onTap: () {});
  }
}
