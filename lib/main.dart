import 'package:flutter/material.dart';

void main() {
  runApp(CustomDNSApp());
}

class CustomDNSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom DNS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DNSHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DNSHomePage extends StatefulWidget {
  @override
  _DNSHomePageState createState() => _DNSHomePageState();
}

class _DNSHomePageState extends State<DNSHomePage> {
  final TextEditingController _dnsController =
      TextEditingController(text: 'dns.adguard-dns.com');

  bool _connected = false;

  void _connect() {
    setState(() {
      _connected = true;
    });
    // Here you can add real VPN / DNS connect logic later
  }

  void _disconnect() {
    setState(() {
      _connected = false;
    });
    // Here you can add disconnect logic later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom DNS'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'DNS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.5,
                  color: Colors.white70,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter DNS Server:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _dnsController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter DNS server address',
              ),
              keyboardType: TextInputType.url,
              enabled: !_connected,
            ),
            SizedBox(height: 30),
            if (!_connected)
              ElevatedButton.icon(
                onPressed: _connect,
                icon: Icon(Icons.wifi),
                label: Text('CONNECT'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            if (_connected)
              ElevatedButton.icon(
                onPressed: _disconnect,
                icon: Icon(Icons.wifi_off),
                label: Text('DISCONNECT'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  _connected ? Icons.check_circle : Icons.cancel,
                  color: _connected ? Colors.green : Colors.red,
                  size: 28,
                ),
                SizedBox(width: 10),
                Text(
                  _connected ? 'Connected' : 'Disconnected',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: _connected ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue[100],
              child: Text(
                'DNS',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
