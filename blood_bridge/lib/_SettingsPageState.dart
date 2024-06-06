import 'package:flutter/material.dart';
import 'package:blood_bridge/TextFormFieldWithIcon.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _email;
  late String _identityNumber;
  late String _phoneNumber;
  late String _address;
  late DateTime _birthday;
  late String _bloodGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE PAGE',
          style:
              TextStyle(color: Color.fromARGB(255, 60, 152, 192), fontSize: 40),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Change Profile Photo Button
                GestureDetector(
                  onTap: _changeProfilePhoto,
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 60, 152, 192),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Change Profile Photo',
                        style: TextStyle(
                          color: Color.fromARGB(255, 60, 152, 192),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Name
                TextFormFieldWithIcon(
                  labelText: 'Name',
                  hintText: 'Change your name',
                  icon: Icons.person,
                  onSaved: (value) => _name = value!,
                  validator: (value) {},
                ),

                // E-Mail
                TextFormFieldWithIcon(
                  labelText: 'E-Mail',
                  hintText: 'Change your email',
                  icon: Icons.email,
                  onSaved: (value) => _email = value!,
                  validator: (value) {},
                ),

                // Identity Number
                TextFormFieldWithIcon(
                  labelText: 'Identity Number',
                  hintText: 'Change your identity number',
                  icon: Icons.badge,
                  onSaved: (value) => _identityNumber = value!,
                  validator: (value) {},
                ),

                // Phone Number
                TextFormFieldWithIcon(
                  labelText: 'Phone Number',
                  hintText: 'Change your phone number',
                  icon: Icons.phone,
                  onSaved: (value) => _phoneNumber = value!,
                  validator: (value) {},
                ),

                // Address
                TextFormFieldWithIcon(
                  labelText: 'Address',
                  hintText: 'Change your address',
                  icon: Icons.location_on,
                  onSaved: (value) => _address = value!,
                  validator: (value) {},
                ),

                // Birthday
                TextFormFieldWithIcon(
                  labelText: 'Birthday',
                  hintText: 'Change your birthday',
                  icon: Icons.cake,
                  onSaved: (value) => _birthday = value! as DateTime,
                  validator: (value) {},
                ),

                // Blood Group
                TextFormFieldWithIcon(
                  labelText: 'Blood Group',
                  hintText: 'Change your blood group',
                  icon: Icons.favorite,
                  onSaved: (value) => _bloodGroup = value!,
                  validator: (value) {},
                ),

                const SizedBox(height: 25),

                // Save Button
                ElevatedButton(
                  onPressed: _saveForm,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 60, 152, 192),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(16.0),
                    ),
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeProfilePhoto() {
    // Add functionality to change profile photo
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Save the user data to a database or local storage
      // For example, you can use the shared_preferences package
      // https://pub.dev/packages/shared_preferences
      // After saving, you can navigate back or show a success message
    }
  }
}

class TextFormFieldWithIcon extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final FormFieldSetter<String> onSaved;

  const TextFormFieldWithIcon({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.onSaved,
    required String? Function(dynamic value) validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon:
              Icon(icon, color: const Color.fromARGB(255, 60, 152, 192)),
        ),
        onSaved: onSaved,
      ),
    );
  }
}
