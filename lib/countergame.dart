import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;

  int _targetCounter = 0;

  var gameRunning = true;

  double _hitpoints = 1.0;

  late final _gameTickAnimation = AnimationController.unbounded(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final _shakeAnimation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
    value: 1,
  );

  @override
  void initState() {
    super.initState();
    _gameTickAnimation.addListener(_handleTick);
    _gameTickAnimation.repeat(min: 0, max: 1);
  }

  @override
  void dispose() {
    _gameTickAnimation.dispose();
    _shakeAnimation.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    if (!gameRunning) return;
    setState(() {
      _counter++;
    });
  }

  void _restartGame() {
    setState(() {
      gameRunning = true;
      _targetCounter = 0;
      _counter = 0;
      _hitpoints = 1;
      _gameTickAnimation.repeat(min: 0, max: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('s'),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red.withOpacity((1 - _hitpoints).clamp(0, 1)),
            width: 40,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              gameRunning
                  ? const Text(
                      'You should have pushed the button this many times:',
                    )
                  : const Text('FINAL SCORE'),
              SlideTransition(
                position: Tween(begin: const Offset(0, -0.4), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: _shakeAnimation, curve: Curves.elasticOut)),
                child: Text(
                  '$_targetCounter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Visibility(
                visible: !gameRunning,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: OutlinedButton(
                    onPressed: _restartGame,
                    child: const Text('Restart game'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _counter == _targetCounter ? Colors.blue : Colors.red,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: 1 - _hitpoints,
              color: Colors.white,
            ),
            const Icon(Icons.add),
          ],
        ),
      ),
    );
  }

  final _random = Random();

  void _handleTick() {
    if (_targetCounter != _counter) {
      setState(() {
        _hitpoints -= 0.002 * log(_targetCounter + 2);
      });
    } else {
      setState(() {
        // Healing.
        _hitpoints += 0.001;

        // Maybe increment?
        if (_random.nextDouble() < 0.01 * log(_targetCounter + 2)) {
          _targetCounter += 1;
          _shakeAnimation.forward(from: 0);
        }
      });
    }

    _hitpoints = _hitpoints.clamp(0, 1);
    if (_hitpoints <= 0) {
      _gameTickAnimation.stop();
      gameRunning = false;
    }
  }
}
