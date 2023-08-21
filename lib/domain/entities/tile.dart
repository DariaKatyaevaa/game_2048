final class Tile {
  final int row;
  final int column;
  int value;
  bool isNew;
  bool canMerge;

  Tile({
    required this.row,
    required this.column,
    this.value = 0,
    this.isNew = false,
    this.canMerge = false,
  });

  factory Tile.copy(Tile tile) => Tile(
        row: tile.row,
        column: tile.column,
        value: tile.value,
        isNew: tile.isNew,
        canMerge: tile.canMerge,
      );

  @override
  int get hashCode {
    return value.hashCode;
  }

  @override
  operator ==(other) {
    return other is Tile && value == other.value;
  }

  bool isEmpty() => value == 0;
}
