import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_textfieldform.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscuretext,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscuretext = !obscuretext;
          setState(() {});
        },
        child: obscuretext
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
