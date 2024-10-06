import 'package:auto_route/auto_route.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:payuung_clone/feature/profile/presentation/widget/personal_information/personal_data_view.dart';

@RoutePage()
class ProfilePersonalInformationPage extends HookWidget {
  const ProfilePersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final activeStep = useState(0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.maybePop(),
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EasyStepper(
                activeStep: activeStep.value,
                lineStyle: const LineStyle(
                  lineLength: 80,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.amberAccent,
                  finishedLineColor: Colors.orange,
                ),
                activeStepBackgroundColor: Colors.amber,
                unreachedStepBackgroundColor: Colors.amberAccent,
                finishedStepBackgroundColor: Colors.amber,
                activeStepTextColor: Colors.amber,
                finishedStepTextColor: Colors.amber,
                unreachedStepTextColor: Colors.amber,
                showLoadingAnimation: false,
                showStepBorder: false,
                stepRadius: 15,
                steps: [
                  EasyStep(
                    customStep: const Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                    customTitle: _buildMultilineTitle('Informasi Pribadi'),
                  ),
                  EasyStep(
                    customStep: const Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                    customTitle: _buildMultilineTitle('Alamat Pribadi'),
                  ),
                  EasyStep(
                    customStep: const Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                    customTitle: _buildMultilineTitle('Informasi Perusahaan'),
                  ),
                ],
                onStepReached: (index) => activeStep.value = index,
              ),
              if (activeStep.value == 0) ...[
                const PersonalDataView(),
              ],
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.amber),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Sebelumnya',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Selanjutnya',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMultilineTitle(String title) {
    return SizedBox(
      width: 80,
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.visible,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.amber,
          height: 1.2,
        ),
      ),
    );
  }
}
