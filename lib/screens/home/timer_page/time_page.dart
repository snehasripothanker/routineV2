import 'package:flutter/material.dart';
import 'package:routine_app_v2/screens/home/task_models/tasklist.dart';
import 'package:routine_app_v2/service/auth.dart';

// code sourced from :https://medium.com/flutterdevs/creating-a-countdown-timer-using-animation-in-flutter-2d56d4f3f5f1

const double pi = 3.1415926535897932;

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: cumSecs, minutes: cumMins),
    );
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text('Routine'),
        backgroundColor: Colors.green[300],
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              }),
          TextButton.icon(
              icon: Icon(Icons.list),
              label: Text('routine list'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.amber,
                    height:
                        controller.value * MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                    animation: controller,
                                    backgroundColor: Colors.white,
                                    color: themeData.indicatorColor,
                                  )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      (timerString ==
                                              completeList[0]
                                                      .timeMin
                                                      .toString() +
                                                  ":0" +
                                                  completeList[0]
                                                      .timeSec
                                                      .toString())
                                          ? Text(completeList[1].name)
                                          : Text(completeList[0].name),
                                      Text(
                                        "Count Down Timer",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 112.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                onPressed: () {
                                  if (controller.isAnimating)
                                    controller.stop();
                                  else {
                                    controller.reverse(
                                        from: controller.value == 0.0
                                            ? 1.0
                                            : controller.value);
                                  }
                                },
                                icon: Icon(controller.isAnimating
                                    ? Icons.pause
                                    : Icons.play_arrow),
                                label: Text(
                                    controller.isAnimating ? "Pause" : "Play"));
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
