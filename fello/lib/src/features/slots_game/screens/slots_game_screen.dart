import 'package:fello/src/features/slots_game/utils/game_service.dart';
import 'package:flutter/material.dart';

class SlotsGameScreen extends StatefulWidget {
  const SlotsGameScreen({super.key});

  @override
  State<SlotsGameScreen> createState() => _SlotsGameScreenState();
}

class _SlotsGameScreenState extends State<SlotsGameScreen> {
  GameService gameService = GameService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/graphics/gfx-slot-machine.png',
            scale: 3.6,
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Slot(gameService: gameService),
              Slot(gameService: gameService),
              Slot(gameService: gameService),
            ],
          ),
        ],
      ),
    );
  }
}

class Slot extends StatelessWidget {
  const Slot({
    super.key,
    required this.gameService,
  });

  final GameService gameService;

  @override
  Widget build(BuildContext context) {
    List slots = gameService.items;
    slots.shuffle();
    return SizedBox(
      height: 220,
      width: 120,
      child: ListWheelScrollView(
        magnification: 1.5,
        useMagnifier: true,
        itemExtent: 42,
        children: [
          for (var i = 0; i < slots.length; i++)
            SizedBox(
              width: 200,
              child: Image.asset(
                'assets/graphics/${slots[i]}',
              ),
            ),
        ],
      ),
    );
  }
}

/// 3 List wheel scroll view
/// 