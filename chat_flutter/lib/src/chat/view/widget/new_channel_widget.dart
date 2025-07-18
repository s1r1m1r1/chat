import 'package:flutter/material.dart';

class NewChannelWidget extends StatefulWidget {
  final void Function(String) onAddChannel;

  const NewChannelWidget({
    super.key,
    required this.onAddChannel,
  });

  @override
  State<NewChannelWidget> createState() => _NewChannelWidgetState();
}

class _NewChannelWidgetState extends State<NewChannelWidget> {
  final _formKey = GlobalKey<FormState>();
  final _channelController = TextEditingController();

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _channelController,
                  decoration: const InputDecoration(
                    labelText: 'Channel',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a channel name';
                    }
                    return null;
                  },
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onAddChannel(_channelController.text);
                    _channelController.clear();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add Channel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
