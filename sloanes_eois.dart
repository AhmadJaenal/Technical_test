String sloanesOeis(String maxValue) {
  String sloanesSequence = '';

  try {
    int n = int.parse(maxValue);
    sloanesSequence = List.generate(
      n,
      (i) => (i * (i + 1) / 2 + 1).round(),
    ).join('-');
  } catch (e) {
    print('Nilai yang Anda masukkan harus berupa angka bulat');
  }

  return sloanesSequence;
}

void main() {
  print(sloanesOeis('7'));
  print(sloanesOeis('6'));
  print(sloanesOeis('10'));
}
