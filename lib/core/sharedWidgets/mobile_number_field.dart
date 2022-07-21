import 'package:flutter/material.dart';
import 'package:quizhouse/core/utils/color.dart';
import 'package:quizhouse/viewModels/auth/mobile_login_view_model.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';


import 'decoration.dart';


class MobileNumberField extends StatelessWidget {
  GlobalKey<FormState> formKey;
  MobileNumberField({Key? key,required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MobileLoginViewModel mobileLoginViewModel = context.watch<MobileLoginViewModel>();
    return IntlPhoneField(
      decoration: textFieldDecoration.copyWith(label: const Text('Phone Number')),
      pickerDialogStyle: PickerDialogStyle(
        searchFieldInputDecoration: textFieldDecoration.copyWith(label: const Text('Search Country')),
        searchFieldCursorColor: const Color(primaryColor),
      ),
      initialCountryCode: 'BD',
      onChanged: (phone) {
        mobileLoginViewModel.mobileNumber = phone.completeNumber;
      },
    );
  }
}
