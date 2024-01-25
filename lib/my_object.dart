class MyObject {
  int value_1;
  int value_2;
  MyObject({required this.value_1, required this.value_2});
// Cac kieu tham so;
  void increase() {
    value_1++;
  }

  void decrease() {
    value_1--;
  }

  void sum() {
    value_1 + value_2;
  }

  int get myValue => value_1;
  set myValue(int newValue) {
    value_1 = newValue;
  }
}
