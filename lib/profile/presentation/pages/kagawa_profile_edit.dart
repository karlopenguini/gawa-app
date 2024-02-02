import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class KagawaProfileEdit extends StatefulWidget {
  const KagawaProfileEdit({super.key});

  @override
  State<KagawaProfileEdit> createState() => _KagawaProfileEditState();
}

class _KagawaProfileEditState extends State<KagawaProfileEdit> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _specializationKey = GlobalKey<FormBuilderFieldState>();
  final _fieldKey = GlobalKey<FormBuilderFieldState>();
  final _budgetKey = GlobalKey<FormBuilderFieldState>();

  String first = 'John';
  String last = 'Dela Cruz';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorScheme.primary,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        backgroundColor: Colors.transparent,
        title: const Text("Edit basic info",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.5,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child:
        FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: "first",
                initialValue: first,
                minLines: 1,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: "First Name",
                ),
              ),

              FormBuilderTextField(
                name: "last",
                initialValue: last,
                minLines: 1,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: "Last Name",
                ),
              ),

              FormBuilderDropdown(
                key: _fieldKey,
                items: const [
                  DropdownMenuItem(
                      child: Text("Plumber"), value: "test1"),
                  DropdownMenuItem(
                      child: Text("Car Wash"), value: "test2"),
                  DropdownMenuItem(
                      child: Text("Home Maintenance"), value: "test3"),
                ],
                name: 'industry',
                decoration: InputDecoration(
                  labelText: 'Industry',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['industry']
                          ?.reset();
                    },
                  ),
                  hintText: 'What field do you work in?',
                ),
              ),

              FormBuilderDropdown(
                key: _specializationKey,
                items: const [
                  DropdownMenuItem(
                      child: Text("Pipe Fitting"), value: "test1"),
                  DropdownMenuItem(
                      child: Text("Troubleshooting"), value: "test2"),
                  DropdownMenuItem(
                      child: Text("Septic Tank"), value: "test3"),
                  DropdownMenuItem(
                      child: Text("Sprinkler Fitting"), value: "test4"),

                ],
                name: 'specialization',
                decoration: InputDecoration(
                  labelText: 'Specialization',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['specialization']
                          ?.reset();
                    },
                  ),
                  hintText: 'What is your specialization?',
                ),
              ),

              const SizedBox(height: 48),
              Text('Edit About',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
              Text('You can write about your years of experience, industry, or skills.', style: TextStyle(color: Colors.black54),),
              FormBuilderTextField(
                name: "Bio",
                minLines: 2,
                maxLines: 10,
                decoration: const InputDecoration(
                    labelText: "Tell us about yourself"),
              ),

              const SizedBox(height: 16),

              MaterialButton(
                color: theme.colorScheme.primary,
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                onPressed: () {
                  // Validate and save the form values
                  _formKey.currentState?.saveAndValidate();
                  debugPrint(_formKey.currentState?.value.toString());

                  // On another side, can access all field values without saving form with instantValues
                  _formKey.currentState?.validate();
                  debugPrint(_formKey.currentState?.instantValue.toString());
                },
                child: const Text('Save',
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