import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> userMessages = [];
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 118, 236),
        title: const Text("Message App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: userMessages.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(userMessages[index]),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: inputController,
              decoration: const InputDecoration(
                labelText: "Eingeben",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    userMessages.insert(0, inputController.text);
                    print(userMessages);
                    inputController.clear();
                  });
                },
                child: const Text("Send Message")),
          ],
        ),
      ),
    );
  }
}
