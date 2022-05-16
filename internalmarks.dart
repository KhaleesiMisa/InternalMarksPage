import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:velocity_x/velocity_x.dart';

class InternalMarks extends StatefulWidget {
  const InternalMarks({Key? key}) : super(key: key);

  @override
  State<InternalMarks> createState() => _InternalMarksState();
}

class _InternalMarksState extends State<InternalMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Internal Marks')),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [],
          ),
          SampleCard(),
          TotalMarks(),
          SizedBox(
            height: 10,
          ),
          InternalData(),
        ]),
      ).pLTRB(18, 0, 18, 0),
    );
  }
}

class SampleCard extends StatefulWidget {
  const SampleCard({Key? key}) : super(key: key);

  @override
  State<SampleCard> createState() => _SampleCardState();
}

class _SampleCardState extends State<SampleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              'Internet of Things'.text.bold.xl.make(),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          //Second element
          '18CS081'.text.lg.make(),

          //Third element
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: ['28/30'.text.make()],
          ),

          LinearProgressIndicator(
            value: 0.8,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ],
      ).p(14),
    ).card.rounded.color(Colors.red).make();
  }
}

class TotalMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //first element
              'Total Marks'.text.bold.xl.make(),
              const Spacer(),
            ],
          ),

          //second element
          '52/60'.text.lg.make(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircularProgressIndicator(
                value: 0.8,
                backgroundColor: Colors.white,
                strokeWidth: 8,
              ),
            ],
          ),
        ],
      ).p(14),
    ).card.rounded.color(Colors.orange).make();
  }
}

class InternalData extends StatefulWidget {
  const InternalData({Key? key}) : super(key: key);

  @override
  State<InternalData> createState() => _InternalDataState();
}

class _InternalDataState extends State<InternalData> {
  List<MarksData> data = [
    MarksData('Internal 1', 28),
    MarksData('Internal 2', 38),
    MarksData('Internal 3', 25),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(
              text: "Scores of all the Internals",
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<MarksData, String>>[
            LineSeries<MarksData, String>(
              dataSource: data,
              xValueMapper: (MarksData md, _) => md.internal,
              yValueMapper: (MarksData md, _) => md.marks,
              name: 'Marks',
              dataLabelSettings: DataLabelSettings(isVisible: true),
            )
          ]),
    );
  }
}

class MarksData {
  final String internal;
  final double marks;

  MarksData(this.internal, this.marks);
}
