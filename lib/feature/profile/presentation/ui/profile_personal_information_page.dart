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
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              EasyStepper(
                activeStep: activeStep.value,
                lineStyle: const LineStyle(
                  lineLength: 60,
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
                steps: const [
                  EasyStep(
                    customStep: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                    title: 'Biodata Diri',
                  ),
                  EasyStep(
                    customStep: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                    title: 'Alamat Pribadi',
                  ),
                  EasyStep(
                    customStep: Text(
                      '3',
                      style: TextStyle(color: Colors.white),
                    ),
                    title: 'Informasi Perusahaan',
                  ),
                ],
                onStepReached: (index) => activeStep.value = index,
              ),
              if (activeStep.value == 0) ...[
                const PersonalDataView(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
