import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/entity/profile.dart';
import '../../components/form_component.dart';

class CompanyInformationView extends HookWidget {
  const CompanyInformationView({
    super.key,
    required this.profile,
    required this.companyNameCtr,
    required this.companyAddressCtr,
  });

  final Profile profile;
  final TextEditingController companyNameCtr;
  final TextEditingController companyAddressCtr;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      companyNameCtr.text = profile.companyName;
      companyAddressCtr.text = profile.companyAddress;
      return () {};
    }, const []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        FormComponent(
          labelText: 'NAMA USAHA / PERUSAHAAN',
          formCtr: companyNameCtr,
          isRequired: true,
          isEnabled: true,
        ),
        const SizedBox(height: 16),
        FormComponent(
          labelText: 'ALAMAT / PERUSAHAAN',
          formCtr: companyAddressCtr,
          isRequired: true,
          isEnabled: true,
        ),
      ],
    );
  }
}
