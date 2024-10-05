import 'package:flutter/material.dart';

class FormComponent extends StatelessWidget {
  const FormComponent({
    super.key,
    this.hintText,
    required this.labelText,
    required this.formCtr,
    required this.isRequired,
    required this.isEnabled,
    this.onTapForm,
    this.onChanged,
    this.suffixIcon,
  });
  final String? hintText;
  final String labelText;
  final TextEditingController formCtr;
  final bool isRequired;
  final bool isEnabled;
  final Widget? suffixIcon;
  final void Function()? onTapForm;
  final String? Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    final outlineDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(12),
      hintText: hintText ?? '',
      hintStyle: const TextStyle(color: Colors.grey),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black45,
          width: 1,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black45,
          width: 1,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black45,
          width: 1,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      counterText: "",
      suffixIcon: suffixIcon,
    );

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              if (isRequired) ...[
                const Text(
                  ' *',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(width: 4),
              ],
              Text(labelText),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: onTapForm,
          child: TextFormField(
            enabled: isEnabled,
            controller: formCtr,
            onChanged: onChanged,
            decoration: outlineDecoration,
          ),
        ),
      ],
    );
  }
}
