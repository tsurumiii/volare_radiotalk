T mapKeyFromValue<T, U>(U value, Map<T, U> values) =>
    values.keys.firstWhere((k) => values[k] == value, orElse: () => null);