import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class KagawaExperienceEdit extends StatefulWidget {
  const KagawaExperienceEdit({super.key});

  @override
  State<KagawaExperienceEdit> createState() => _KagawaExperienceEditState();
}

class _KagawaExperienceEditState extends State<KagawaExperienceEdit> {
  final _formKey = GlobalKey<FormBuilderState>();

  String title = 'Plumber';
  String company = "Tubero Experts' Plumbing Services";
  String location = "San Pedro, Laguna";
  bool editing = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Icon action_icon;
    Widget page;

    editing ? (page = edit(theme), action_icon = Icon(Icons.close))
        : (page = cards(), action_icon = Icon(Icons.add));

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
        actions: [
          IconButton(onPressed: () {
            setState(() {
              editing = !editing;
            });
          }, icon: action_icon)
        ],
        backgroundColor: Colors.transparent,
        title: const Text("Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.5,
            )),

      ),
      body: Container(
        child: page
      ),
    );
  }

  Padding cards() {
    return Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              DetailsCard(),
              DetailsCard(),
            ],
          ),
        );
  }

  Padding edit(ThemeData theme) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    name: "title",
                    initialValue: title,
                    minLines: 1,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: "Title", hintText: "Ex. Plumber"),
                  ),
                  FormBuilderTextField(
                    name: "company",
                    initialValue: company,
                    minLines: 1,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: "Company name",
                        hintText: "Ex. Tubero Experts' Plumbing Services"),
                  ),
                  FormBuilderTextField(
                    name: "location",
                    initialValue: location,
                    minLines: 1,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: "Location",
                        hintText: "Ex. Makati, Metro Manila"),
                  ),

                  FormBuilderDateRangePicker(
                    name: 'start_end',
                    decoration: const InputDecoration(
                        labelText: "Start Date - End Date"
                    ),
                    firstDate: DateTime(1888),
                    lastDate: DateTime.now(),
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


// The edit button doesn't work (Idk how to make it work)
class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Plumber",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.0)),
                    Text("A & D Plumbing and Electrical Services",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            letterSpacing: -1.0)),
                    Text("Aug 2021 - Aug 2022 · 1 year",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            letterSpacing: -1.0)),
                    Text("Calabarzon, Philippines",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            letterSpacing: -1.0)),
                  ],
                )
              ],
            ),
            IconButton(
              icon: Icon(Icons.edit),
              color: theme.colorScheme.outline,
              onPressed: () {
                // setState(() {
                //   selectedIndex = value;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}