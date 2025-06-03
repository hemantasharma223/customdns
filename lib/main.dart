import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDnsApp());
}

class CustomDnsApp extends StatelessWidget {
  const CustomDnsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom DNS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CustomDnsHomePage(),
    );
  }
}

class CustomDnsHomePage extends StatefulWidget {
  const CustomDnsHomePage({super.key});

  @override
  State<CustomDnsHomePage> createState() => _CustomDnsHomePageState();
}

class _CustomDnsHomePageState extends State<CustomDnsHomePage> {
  final TextEditingController _dnsController = TextEditingController(text: "dns.adguard-dns.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom DNS")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Set your custom DNS server below:"),
            const SizedBox(height: 12),
            TextField(
              controller: _dnsController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "DNS Server",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Stub: DNS application logic goes here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("DNS set to ${_dnsController.text}")),
                );
              },
              child: const Text("Apply DNS"),
            )
          ],
        ),
      ),
    );
  }
}
