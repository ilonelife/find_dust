import 'package:fine_dust/data/air_api.dart';
import 'package:fine_dust/model/air_result.dart';
import 'package:flutter/material.dart';

class FineDust extends StatefulWidget {
  const FineDust({Key? key}) : super(key: key);

  @override
  _FineDustState createState() => _FineDustState();
}

class _FineDustState extends State<FineDust> {
  AirResult? _airresult;

  //List<AirResult> _airresult = [];

  final _api = AirApi();

  @override
  void initState() {
    super.initState();
    _showResult();
  }

  Future<void> _showResult() async {
    AirResult airresult = await _api.fetchData();
    setState(() {
      _airresult = airresult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _airresult == null
            ? const CircularProgressIndicator()
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '현재 위치 미세먼지',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('얼굴사진'),
                                  Text(
                                    '${_airresult?.data.current.pollution.aqius}',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(getString(_airresult!)),
                                ],
                              ),
                              color: getColor(_airresult!),
                              padding: const EdgeInsets.all(8),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://airvisual.com/images/04d.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        '${_airresult?.data.current.weather.tp} 도씨'),
                                  ],
                                ),
                                Text(
                                    '습도  ${_airresult?.data.current.weather.ic} '),
                                Text(
                                    '풍속  ${_airresult?.data.current.weather.ws}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Color getColor(AirResult result) {
    if (result.data.current.pollution.aqius! <= 50) {
      return Colors.greenAccent;
    } else if (result.data.current.pollution.aqius! <= 100) {
      return Colors.yellow;
    } else if (result.data.current.pollution.aqius! <= 150) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }

  String getString(AirResult result) {
    if (result.data.current.pollution.aqius! <= 50) {
      return '좋음';
    } else if (result.data.current.pollution.aqius! <= 100) {
      return '보통';
    } else if (result.data.current.pollution.aqius! <= 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }
}
