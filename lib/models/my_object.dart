class MyObject {
  int value;
  MyObject({required this.value});
// Cac kieu tham so;
  void increase() {
    value++;
  }

  void decrease() {
    value--;
  }

  int get myValue => value;
  set myValue(int newValue) {
    value = newValue;
  }
}
