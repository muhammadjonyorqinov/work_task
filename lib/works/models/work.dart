class Work {
  final int number;
  final int duration;
  bool isSelected;

  Work({
    this.number,
    this.duration,
    this.isSelected,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Work &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          duration == other.duration &&
          isSelected == other.isSelected;

  @override
  int get hashCode => number.hashCode ^ duration.hashCode ^ isSelected.hashCode;
}
