import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class GawainRequestPage extends StatefulWidget {
  const GawainRequestPage({super.key});

  @override
  State<GawainRequestPage> createState() => _GawainRequestPageState();
}

class _GawainRequestPageState extends State<GawainRequestPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _estWorkKey = GlobalKey<FormBuilderFieldState>();
  final _budgetKey = GlobalKey<FormBuilderFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        backgroundColor: Colors.transparent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("John Dela Cruz",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                )),
            Row(
              children: [
                Text("Plumbing",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        letterSpacing: -1)),
                Icon(
                  Icons.circle,
                  color: Colors.black54,
                  size: 4,
                ),
                Text("Pipe Fitting",
                    style: TextStyle(
                        color: Colors.black54, fontSize: 14, letterSpacing: -1))
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "location",
                minLines: 2,
                maxLines: 2,
                decoration: InputDecoration(labelText: "Your gawa location"),
              ),
              FormBuilderDropdown(
                key: _estWorkKey,
                items: [
                  DropdownMenuItem(
                      child: Text("Est. 30 mins to 1 hour"), value: "test1"),
                  DropdownMenuItem(
                      child: Text("Est. 1 hour to 2 hours"), value: "test2"),
                  DropdownMenuItem(
                      child: Text("Est. 2 hours to 3 hours"), value: "test3"),
                  DropdownMenuItem(
                      child: Text("Est. 3 hours to 8 hours"), value: "test4"),
                ],
                name: 'Estimated Working Hours',
                decoration: InputDecoration(
                  labelText: 'How big is your kagawa?',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['Estimated Working Hours']
                          ?.reset();
                    },
                  ),
                  hintText: 'Select Estimated Working Hours',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderDropdown(
                key: _budgetKey,
                items: [
                  DropdownMenuItem(
                      child: Text("Under 1,000 PHP"), value: "test12"),
                  DropdownMenuItem(
                      child: Text("Under 3,000 PHP"), value: "test23"),
                  DropdownMenuItem(
                      child: Text("Under 5,000 PHP"), value: "test34"),
                  DropdownMenuItem(
                      child: Text("Over 5,000 PHP"), value: "test45"),
                ],
                name: 'Budget',
                decoration: InputDecoration(
                  labelText: 'How much is your budget?',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['Budget']?.reset();
                    },
                  ),
                  hintText: 'Select budget',
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderDateTimePicker(
                name: "Schedule",
                decoration: InputDecoration(
                    labelText: "Choose your gawa date and start time:"),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: "Description",
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: "Tell us the details of your gawa"),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                onPressed: () {
                  // Validate and save the form values
                  _formKey.currentState?.saveAndValidate();
                  debugPrint(_formKey.currentState?.value.toString());

                  // On another side, can access all field values without saving form with instantValues
                  _formKey.currentState?.validate();
                  debugPrint(_formKey.currentState?.instantValue.toString());
                },
                child: const Text('Send my Gawain offer',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
