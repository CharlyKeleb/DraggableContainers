import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = useState(const Offset(150, 350));
    List<Color> colors = [
      Colors.grey,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.red,
      Colors.white
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Listener(
        onPointerMove: (event) {
          if (event.position.dy > 10 &&
              event.position.dy < MediaQuery.of(context).size.height * 0.9 &&
              event.position.dx > 10 &&
              event.position.dx < MediaQuery.of(context).size.width * 0.75) {
            position.value = event.position;
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            children: List.generate(
              9,
              (index) {
                return AnimatedPositioned(
                  duration: Duration(
                    microseconds: 10,
                    milliseconds: (1200 - (index * 100)),
                  ),
                  left: position.value.dx,
                  top: position.value.dy,
                  child: Padding(
                    padding: EdgeInsets.all(
                      (index * 5 + 10),
                    ),
                    child: Container(
                      height: 100 - (index * 10).toDouble(),
                      width: 100 - (index * 10).toDouble(),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: index == 8 ? 5 : 3,
                          color: colors[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
