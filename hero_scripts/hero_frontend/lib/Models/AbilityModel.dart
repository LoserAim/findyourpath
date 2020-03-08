class Ability {
  int score;
  int modifier;

  Ability({int tempScore})
  {
    this.score = tempScore;
    this.modifier = ((tempScore-10) / 2).floor();
  }



}