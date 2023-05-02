import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppScreen extends StatefulWidget {
  @override
  _WhatsAppScreenState createState() => _WhatsAppScreenState();
}

class _WhatsAppScreenState extends State<WhatsAppScreen> {
  //To access the value fo the Txtform field
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('WhatsApp Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.network(
                  "https://www.freepnglogos.com/uploads/whatsapp-png-image-9.png"),
            ),
            const SizedBox(height: 30),
            TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                    focusColor: Colors.green,
                    counterText: '',
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "+919999999999",
                    labelText: "Enter number here",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ))),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () async {
                final phoneNumber = _controller.text;
                final url = 'https://api.whatsapp.com/send?phone=$phoneNumber';

                launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              },
              child: const Text('Open Chat'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
