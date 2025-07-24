String highestPalindrome(String s, int k) {
  List<String> chars = s.split('');
  List<int> temp = List.filled(s.length, 0);

  bool makePalindrome(int start, int end, int k) {
    if (start >= end) return true;
    if (chars[start] != chars[end]) {
      if (k == 0) return false;

      if (chars[start].compareTo(chars[end]) > 0) {
        chars[end] = chars[start];
      } else {
        chars[start] = chars[end];
      }
      temp[start] = 1;
      temp[end] = 1;
      return makePalindrome(start + 1, end - 1, k - 1);
    }
    return makePalindrome(start + 1, end - 1, k);
  }

  void maximizePalindrome(int start, int end, int k) {
    if (start > end || k <= 0) return;

    if (chars[start] != '9') {
      if (chars[start] != chars[end]) {
        if (k >= 1 && (chars[start] != '9' || chars[end] != '9')) {
          chars[start] = chars[end] = '9';
          maximizePalindrome(start + 1, end - 1, k - 1);
        }
      } else {
        if (k >= 2) {
          chars[start] = chars[end] = '9';
          maximizePalindrome(start + 1, end - 1, k - 2);
        } else {
          maximizePalindrome(start + 1, end - 1, k);
        }
      }
    } else {
      maximizePalindrome(start + 1, end - 1, k);
    }
  }

  bool canMakePalindrome = makePalindrome(0, s.length - 1, k);

  if (!canMakePalindrome) return "-1";

  // Menghitung sisa k
  int used = 0;
  for (int i in temp) {
    if (i == 1) used++;
  }
  int remaining = k - used;

  maximizePalindrome(0, s.length - 1, remaining);

  return chars.join('');
}

void main() {
  print(highestPalindrome('785787', 2));
  print(highestPalindrome('3943 ', 1));
  print(highestPalindrome('88933', 2));
}
