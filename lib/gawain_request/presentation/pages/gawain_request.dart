import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GawainRequestPage extends StatefulWidget {
  final int id;
  const GawainRequestPage({Key? key, required this.id}) : super(key: key);

  @override
  State<GawainRequestPage> createState() => _GawainRequestPageState(id);
}

class _GawainRequestPageState extends State<GawainRequestPage> {
  final int id;

  _GawainRequestPageState(this.id);

  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          reverse: true,
          child: buildForm(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      foregroundColor: Colors.blue,
      shadowColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.chevron_left),
      ),
      backgroundColor: Colors.transparent,
      title: buildAppBarTitle(),
    );
  }

  Column buildAppBarTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "John Dela Cruz",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1.5),
        ),
        buildSubtitle(),
      ],
    );
  }

  Row buildSubtitle() {
    return Row(
      children: [
        buildSubtitleText("Plumbing"),
        buildSubtitleIcon(),
        buildSubtitleText("Pipe Fitting"),
      ],
    );
  }

  Text buildSubtitleText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black54, fontSize: 14, letterSpacing: -1),
    );
  }

  Icon buildSubtitleIcon() {
    return const Icon(
      Icons.circle,
      color: Colors.black54,
      size: 4,
    );
  }

  FormBuilder buildForm() {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            buildFormFields("Your gawa location", "location"),
            FormBuilderDropdown(
              key: GlobalKey<FormBuilderFieldState>(),
              items: const [
                DropdownMenuItem(
                    value: "30m1h", child: Text("Est. 30 mins to 1 hour")),
                DropdownMenuItem(
                    value: "1h2h", child: Text("Est. 1 hour to 2 hours")),
                DropdownMenuItem(
                    value: "2h3h", child: Text("Est. 2 hours to 3 hours")),
                DropdownMenuItem(
                    value: "3h8h", child: Text("Est. 3 hours to 8 hours")),
              ],
              name: "estimatedSize",
              decoration: InputDecoration(
                labelText: "How big is your gawa?",
                suffix: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () =>
                      _formKey.currentState!.fields["estimatedSize"]?.reset(),
                ),
                hintText: 'Select Size',
              ),
            ),
            const SizedBox(height: 32),
            FormBuilderDropdown(
              key: GlobalKey<FormBuilderFieldState>(),
              items: const [
                DropdownMenuItem(value: "below1000", child: Text("Below 1000")),
                DropdownMenuItem(
                    value: "1000to2999", child: Text("1000 - 2999")),
                DropdownMenuItem(
                    value: "3000to5999", child: Text("3000 - 5999")),
                DropdownMenuItem(value: "above6000", child: Text("Above 6000")),
              ],
              name: "budget",
              decoration: InputDecoration(
                labelText: "How big is your budget?",
                suffix: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () =>
                      _formKey.currentState!.fields["budget"]?.reset(),
                ),
                hintText: 'Select Budget',
              ),
            ),
            const SizedBox(height: 32),
            buildFormDateTimePicker(
                "Choose your gawa date and start time:", "schedule"),
            const SizedBox(height: 32),
            buildFormFields("Tell us the details of your gawa", "description"),
            const SizedBox(height: 64),
            buildSubmitButton(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFormFields(String labelText, String name) {
    return FormBuilderTextField(
      name: name,
      minLines: 2,
      maxLines: 2,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  Widget buildFormDateTimePicker(String labelText, String name) {
    return FormBuilderDateTimePicker(
      name: name,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  Widget buildSubmitButton() {
    return MaterialButton(
      autofocus: true,
      color: Colors.blue,
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      onPressed: () async {
        _formKey.currentState?.saveAndValidate();
        debugPrint(_formKey.currentState?.value.toString());
        // Create a new modifiable map with form values
        Map<String, dynamic> payload = Map.from(_formKey.currentState!.value);
        // Add an additional entry for "status"
        payload["status"] = "pending";
        payload["kagawa"] =
            FirebaseFirestore.instance.collection('user').doc(id.toString());
        payload["user"] = FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid);
        // Save to Firestore
        await FirebaseFirestore.instance.collection('gawa').add(payload);
      },
      child: const Text(
        'Send my Gawain offer',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
