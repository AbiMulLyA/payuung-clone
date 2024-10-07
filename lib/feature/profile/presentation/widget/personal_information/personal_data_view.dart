import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:payuung_clone/feature/profile/domain/entity/profile.dart';

import '../../components/dropdown_form_component.dart';
import '../../components/form_component.dart';

class PersonalDataView extends HookWidget {
  const PersonalDataView({
    super.key,
    required this.profile,
    required this.nameCtr,
    required this.birthDayCtr,
  });

  final Profile profile;
  final TextEditingController nameCtr;
  final TextEditingController birthDayCtr;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      nameCtr.text = profile.fullName;
      birthDayCtr.text = profile.birthDate;
      return () {};
    }, const []);

    return Column(
      children: [
        FormComponent(
          labelText: 'NAMA LENGKAP',
          formCtr: nameCtr,
          isRequired: true,
          isEnabled: true,
        ),
        const SizedBox(
          height: 16,
        ),
        FormComponent(
          labelText: 'TANGGAL LAHIR',
          formCtr: birthDayCtr,
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
              birthDayCtr.text = DateFormat(
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
