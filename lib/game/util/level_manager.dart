abstract interface class LevelManager {
  static const expForEachLevel = <int>[
    10, // 1
    20, // 2
    30, // 3
    50, // 4
    100, // 5
    200, // 6
    500, // 7
    1000, // 8
    2000, // 9
  ];

  static (int level, int exp) expToLevel(int exp) {
    int retLevel = 1, retExp = exp;
    for (int i = 0; i < expForEachLevel.length; i++) {
      if (exp >= expForEachLevel[i]) {
        retLevel++;
        exp -= expForEachLevel[i];
        retExp = exp;
      } else {
        break;
      }
    }
    return (retLevel, retExp);
  }

  static bool isMaxLevel(int exp) {
    return exp >= expForEachLevel.reduce((value, element) => value + element);
  }
}
