import 'package:flutter/material.dart';
import 'package:hello_bou/component/global_widget/custom_drop_down.dart';
import 'package:hello_bou/component/global_widget/custom_field.dart';
import 'package:hello_bou/views/dashboard/profile/edit/edit_page_template.dart';

class AddressEditPage extends StatefulWidget {
  const AddressEditPage({super.key});

  @override
  State<AddressEditPage> createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  @override
  void dispose() {
    address1Controller.dispose();
    address2Controller.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EditPageTemplate(
      title: 'Address',
      children: [
        CustomField(hintText: 'Address1', controller: address1Controller),
        CustomField(hintText: 'Address2', controller: address2Controller),
        const CustomDropDownButton(items: ['Country', '']),
        const CustomDropDownButton(items: ['State', '']),
        CustomField(hintText: 'City', controller: cityController),
        CustomField(hintText: 'Zip code', controller: zipCodeController),
      ],
      onTap: () {},
    );
  }
}
