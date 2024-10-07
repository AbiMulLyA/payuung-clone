import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../components/form_component.dart';

class CompanyInformationView extends HookWidget {
  const CompanyInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final _companyNameCtr = useTextEditingController();
    final _companyAddressCtr = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        FormComponent(
          labelText: 'NAMA USAHA / PERUSAHAAN',
          formCtr: _companyNameCtr,
          isRequired: true,
          isEnabled: true,
        ),
        const SizedBox(height: 16),
        FormComponent(
          labelText: 'ALAMAT / PERUSAHAAN',
          formCtr: _companyAddressCtr,
          isRequired: true,
          isEnabled: true,
        ),
      ],
    );
  }
}
