import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../components/dropdown_form_component.dart';
import '../../components/form_component.dart';

class PersonalDataView extends HookWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameCtr = useTextEditingController();
    final _birthDayCtr = useTextEditingController();

    return Column(
      children: [
        FormComponent(
          labelText: 'NAMA LENGKAP',
          formCtr: _nameCtr,
          isRequired: true,
          isEnabled: true,
        ),
        const SizedBox(
          height: 16,
        ),
        FormComponent(
          labelText: 'TANGGAL LAHIR',
          formCtr: _birthDayCtr,
          isRequired: true,
          isEnabled: false,
          suffixIcon: const Icon(Icons.calendar_month),
          onTapForm: () async {
            final _showDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1990),
              lastDate: DateTime(2045),
            );

            if (_showDate != null) {
              _birthDayCtr.text = DateFormat(
                'dd MMMM yyyy',
              ).format(_showDate);
            }
          },
        ),
        const SizedBox(
          height: 16,
        ),
        DropdownFormComponent(
          labelText: 'JENIS KELAMIN',
          isRequired: true,
          onChanged: (p0) {},
          items: const [
            DropdownMenuItem(
              value: 'Laki-laki',
              child: Text('Laki-laki'),
            ),
            DropdownMenuItem(
              value: 'Perempuan',
              child: Text('Perempuan'),
            ),
          ],
        ),
      ],
    );
  }
}
