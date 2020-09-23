extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String sentenceCase() {
    if (this == null || this.isEmpty) return this;

    return this
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  String replaceBy(String toBeReplaced, String replacedWith) {
    return this.replaceAll(toBeReplaced, replacedWith);
  }
}
