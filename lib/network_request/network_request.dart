import 'package:flutter/material.dart';
import 'package:flutter_playground/network_request/data_service.dart';

class NetworkRequest extends StatefulWidget {
  NetworkRequest({Key? key}) : super(key: key);

  @override
  _NetworkRequestState createState() => _NetworkRequestState();
}

class _NetworkRequestState extends State<NetworkRequest> {
  final _dataService = DataService();
  String _response = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network request',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Network request'),
        ),
        body: Center(
          child: Container(
            child: Builder(builder: (_) {
              if (_response != '') {
                return Text(_response);
              }

              return ElevatedButton(
                onPressed: _makeRequest,
                child: Text('Make Request'),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToApi();

    setState(() {
      _response = response;
    });
  }
}
