
abstract class DotAlgorithm {
  // Define how to calculate each dot's alignment and state.
  List<Map<String, dynamic>> generateDots(int count);

  // Define how the dots should animate over time
  List<Map<String, dynamic>> animateDots(int count, double time);


  @override
  bool operator == (Object  other) =>
      other.runtimeType == runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
