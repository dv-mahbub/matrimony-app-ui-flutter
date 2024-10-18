import 'package:flutter/material.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class EducationEditPage extends StatefulWidget {
  const EducationEditPage({super.key});

  @override
  State<EducationEditPage> createState() => _EducationEditPageState();
}

class _EducationEditPageState extends State<EducationEditPage> {
  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
        title: 'Education & Career',
        children: const [
          CustomDropDownButton(items: ['Educational Qualification', '']),
          CustomDropDownButton(items: ['Employed As', '']),
          CustomDropDownButton(items: ['Area/Field', '']),
          CustomDropDownButton(items: ['Employed With', '']),
          CustomDropDownButton(items: ['Annual Income', '']),
        ],
        onTap: () {});
  }
}
