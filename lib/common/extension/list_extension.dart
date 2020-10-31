extension ListExtension on List {
  List<T> replace<T extends Object>(Object newItem) => map((Object d) {
    if (d.hashCode == newItem.hashCode) {
      return newItem as T;
    }
    return d as T;
  }).toList();
}
