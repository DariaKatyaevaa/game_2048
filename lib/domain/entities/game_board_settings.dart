enum GameBoardSettings {
  tiny(3, 3, 'Tiny(3x3)', 34, 30),
  classic(4, 4, 'Classic(4x4)', 30, 26),
  big(5, 5, 'Big(5x5)', 28, 24),
  bigger(6, 6, 'Bigger(6x6)', 24, 20),
  huge(7, 7, 'Huge(7x7)', 20, 18),
  huger(8, 8, 'Huger(8x8)', 18, 16);

  const GameBoardSettings(
    this.rowsCount,
    this.columnsCount,
    this.name,
    this._smallDigitSize,
    this._bigDigitSize,
  );

  final int rowsCount;
  final int columnsCount;
  final String name;
  final double _smallDigitSize;
  final double _bigDigitSize;

  double fontSize(int value) => value >= 1024 || (index >= 3 && value > 64) ? _bigDigitSize : _smallDigitSize;
}
