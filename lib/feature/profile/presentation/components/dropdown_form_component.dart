import 'package:flutter/material.dart';

class DropdownFormComponent extends StatelessWidget {
  const DropdownFormComponent({
    super.key,
    this.hintText,
    required this.labelText,
    required this.isRequired,
    this.onTapForm,
    this.onChanged,
    required this.items,
    this.value,
  });
  final String? hintText;
  final String labelText;
  final bool isRequired;

  final void Function()? onTapForm;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>> items;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final outlineDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText),
            if (isRequired) ...[
              const SizedBox(width: 4),
              const Text(
                '*',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: outlineDecoration,
          hint: Text(hintText ?? ''),
        ),
      ],
    );
  }
}
