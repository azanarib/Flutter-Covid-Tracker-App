import 'package:covid_app/view/world_state.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String? name;
  String? image;
  int? totalCases,
      totalDeaths,
      totalRecovered,
      todayRecovered,
      test,
      active,
      critical;
  DetailsScreen({
    super.key,
    required this.active,
    required this.critical,
    required this.image,
    required this.name,
    required this.test,
    required this.todayRecovered,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeOfDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizeOfDevice.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.067),
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .06,
                            ),
                            ReusableRow(
                              title: 'Cases',
                              value: widget.totalCases!.toString(),
                            ),
                            ReusableRow(
                              title: 'Recovered',
                              value: widget.totalRecovered!.toString(),
                            ),
                            ReusableRow(
                              title: 'Critical',
                              value: widget.critical!.toString(),
                            ),
                            ReusableRow(
                              title: 'Deaths',
                              value: widget.totalDeaths!.toString(),
                            ),
                            ReusableRow(
                              title: 'Today Recovered',
                              value: widget.todayRecovered!.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.image!.toString()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
