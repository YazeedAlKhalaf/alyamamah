class Optional<T> {
  final T? _value;

  Optional(this._value);

  T? get value => _value;
}
