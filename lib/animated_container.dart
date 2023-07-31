import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late AnimationController _animationController;
  List<TileModel> dataList = [
    TileModel(icon: Icons.favorite, name: 'Fahad', number: 1),
    TileModel(icon: Icons.back_hand, name: 'Haroon', number: 2),
    TileModel(icon: Icons.r_mobiledata, name: 'Usman', number: 3),
    TileModel(icon: Icons.qr_code, name: 'Faizan', number: 4)
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedList(
          initialItemCount: dataList.length,
          itemBuilder: (context, index, animation) {
            //animation here
            final slideAnimation = Tween<Offset>(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
              parent: _animationController,
              curve: Interval(index * 0.15, (index + 1) * 0.15),
            ));
            return SlideTransition(
              position: slideAnimation,
              child: TileWidget(tile: dataList[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward(from: 0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({
    Key? key,
    required this.tile,
  }) : super(key: key);

  final TileModel tile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 81,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 10,
              children: [
                const CircleAvatar(radius: 30, backgroundColor: Colors.green),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(tile.name ?? 'null',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        tile.number.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(tile.icon)
          ],
        ),
      ),
    );
  }
}

class TileModel {
  String? name;
  int? number;
  IconData? icon;

  TileModel({required this.icon, required this.name, required this.number});
}
