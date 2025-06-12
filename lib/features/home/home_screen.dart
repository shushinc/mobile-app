import 'package:flutter/material.dart';
import 'package:mobile_operator_info/mobile_operator_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MobileOperatorInfoData operatorInfo = MobileOperatorInfoData();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final data = await MobileOperatorInfo().getMobileOperatorInfo();
      setState(() {
        operatorInfo = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: Text('Logout'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 24,
            children: [
              Text('Data'),
              Text('MCC: ${operatorInfo.mobileCountryCode ?? 'not found'}'),
              Text('MNC: ${operatorInfo.mobileNetworkCode ?? 'not found'}'),
            ],
          ),
        ),
      ),
    );
  }
}
