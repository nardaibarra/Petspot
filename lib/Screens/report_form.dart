import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Widgets/Report_first.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/report_second.dart';
import '../bloc/report_form/report_form_bloc.dart';

class ReportPetForm extends StatefulWidget {
  const ReportPetForm({super.key});

  @override
  State<ReportPetForm> createState() => _ReportPetFormState();
}

class _ReportPetFormState extends State<ReportPetForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 25, left: 20, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Reportar una mascota',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              BlocConsumer<ReportFormBloc, ReportFormState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ReportFormFirstStepState) {
                    return ReportFirst();
                  } else if (state is ReportFormSecondStepState) {
                    return ReportSecond();
                  } else if (state is PreviousReportFormEvent) {
                    return ReportFirst();
                  } else
                    return ReportFirst();
                },
              ),
            ]),
      ),
      bottomNavigationBar: Navbar(context, screen: ' '),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
