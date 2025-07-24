String denseRangking({
  required String countPlayed,
  required String scorePlayer,
  required String gitsCountPlayed,
  required String gitsScores,
}) {
  List<int> grades = scorePlayer.split(' ').map(int.parse).toList();
  List<int> gitsGrades = gitsScores.split(' ').map(int.parse).toList();

  List<int> ranks = [];
  List<int> gitsRanks = [];

  for (int i = 0; i < gitsGrades.length; i++) {
    grades.add(gitsGrades[i]);
    int currentRank = 1;

    ranks.clear();
    grades.sort((a, b) => b.compareTo(a));
    for (int j = 0; j < grades.length; j++) {
      if (j > 0 && grades[j] != grades[j - 1]) {
        currentRank = ranks[j - 1] + 1;
      }
      ranks.add(currentRank);
    }

    int index = grades.indexOf(gitsGrades[i]);
    gitsRanks.add(ranks[index]);
  }

  return gitsRanks.join(' ');
}

void main() {
  print(
    denseRangking(
      countPlayed: '5',
      scorePlayer: '100 90 42 31 4',
      gitsCountPlayed: '4',
      gitsScores: '28 67 90 23',
    ),
  );
  print(
    denseRangking(
      countPlayed: '7',
      scorePlayer: '100 100 50 40 20 10',
      gitsCountPlayed: '4',
      gitsScores: '5 25 50 120',
    ),
  );
  print(
    denseRangking(
      countPlayed: '3',
      scorePlayer: '67 100 28',
      gitsCountPlayed: '6',
      gitsScores: '90 27 46 89 100 37',
    ),
  );
}
