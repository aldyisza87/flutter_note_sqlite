import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Notes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Title'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input title';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            maxLines: 8,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Content'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please input content';
              }
              return null;
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
