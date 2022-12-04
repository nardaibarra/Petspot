import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Widgets/Report_first.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/report_second.dart';
import 'package:petspot/Widgets/report_second_1image.dart';
import '../bloc/report_form/report_form_bloc.dart';
import 'home.dart';

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
                listener: (context, state) {
                  if (state is ReportFormSuccesfulPostState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('cargado')),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  } else if (state is ReportFormErrorPostState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('error al cargar')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ReportFormFirstStepState) {
                    return ReportFirst();
                  } else if (state is ReportFormSecondStepState) {
                    return ReportSecond();
                  } else if (state is PreviousReportFormEvent) {
                    return ReportFirst();
                  } else if (state is FirstImageLoadingSucces) {
                    return ReportSecondImage(
                      Images: state.images,
                    );
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
