import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_clone/core/util/image_util.dart';

import '../../../../../core/config/di/injector.dart';
import '../../../domain/entity/profile.dart';
import '../../components/form_component.dart';

class PersonalAddressView extends HookWidget {
  const PersonalAddressView({
    super.key,
    required this.profile,
    required this.nikCtr,
    required this.ktpAddressCtr,
  });

  final Profile profile;
  final TextEditingController nikCtr;
  final TextEditingController ktpAddressCtr;

  @override
  Widget build(BuildContext context) {
    final _imageUtil = getIt<ImageUtil>();

    final _ktpFile = useState('');

    useEffect(() {
      nikCtr.text = profile.nik.toString();
      ktpAddressCtr.text = profile.ktpAddress;
      return () {};
    }, const []);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pilih Sumber Gambar'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  GestureDetector(
                                    child: const Text('Galeri'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      _imageUtil.pickImage(ImageSource.gallery);
                                    },
                                  ),
                                  const Padding(padding: EdgeInsets.all(8.0)),
                                  GestureDetector(
                                    child: const Text('Kamera'),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      _imageUtil.pickImage(ImageSource.camera);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.description, color: Colors.amber),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            const Text(
                              'Upload KTP',
                              style: TextStyle(fontSize: 16),
                            ),
                            if (_ktpFile.value.isNotEmpty)
                              Text(
                                _ktpFile.value,
                                style: const TextStyle(color: Colors.grey),
                              ),
                          ],
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  if (_ktpFile.value.isNotEmpty)
                    const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
              const SizedBox(height: 16),
              FormComponent(
                labelText: 'NIK',
                formCtr: nikCtr,
                isRequired: true,
                isEnabled: true,
              ),
              const SizedBox(height: 16),
              FormComponent(
                labelText: 'ALAMAT SESUAI KTP',
                formCtr: ktpAddressCtr,
                isRequired: true,
                isEnabled: true,
              ),
            ],
          ),
        )
      ],
    );
  }
}
