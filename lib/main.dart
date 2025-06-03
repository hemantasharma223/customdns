import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDNSApp());
}

class CustomDNSApp extends StatelessWidget {
  const CustomDNSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom DNS',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom DNS'),
        ),
        body: const Center(
          child: Text('Default DNS: dns.adguard-dns.com'),
        ),
      ),
    );
  }
}
