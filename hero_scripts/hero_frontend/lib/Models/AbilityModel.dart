class Ability {
  int score;
  int modifer;

  Ability({int tempScore})
  {
    this.score = tempScore;
    this.modifer = ((tempScore-10) / 2).floor();
  }



}