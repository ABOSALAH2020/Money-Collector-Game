ArrayList<MovingSpikes> movingSpikes;
ArrayList<RotatingCoin> rotatingCoins;
ArrayList<MovingPlatform> movingPlatforms;
void loadLevel(String[] level) {
  platforms = new ArrayList<Platform>();
  spikes = new ArrayList<Spikes>();
  movingSpikes = new ArrayList<MovingSpikes>();
  movingPlatforms = new ArrayList<MovingPlatform>();
  rotatingCoins = new ArrayList<RotatingCoin>();
  coins = new ArrayList<Coin>();
  player = new Player(50, height - 60);

  for (int row = 0; row < level.length; row++) {
    for (int col = 0; col < level[row].length(); col++) {
      char tile = level[row].charAt(col);
      float x = col * 20;
      float y = row * 20;
      switch (tile) {
        case 'O':
          platforms.add(new Platform(x, y, 20, 20));
          break;        
        case '~':
          movingPlatforms.add(new MovingPlatform(x, y, 20, 20, 0.5, 0));
          break;
        case '^':
          spikes.add(new Spikes(x, y, 20, 20, '^'));
          break;
        case 'V':
          spikes.add(new Spikes(x, y, 20, 20, 'V'));
          break;
        case '*':
          coins.add(new Coin(x, y));
          break;
        case '#':
         rotatingCoins.add(new RotatingCoin(x, y));
         break;
        case '@':
          player = new Player(x, y);
          break;
        case '+':
          movingSpikes.add(new MovingSpikes(x, y, 20, 20, 10, 0.3, true, '+')); // Moving up-down
          break;
        case '!':
          movingSpikes.add(new MovingSpikes(x, y, 20, 15, -10, 0.3, false, '!')); // Moving down-up
          break;
      }
    }
  }
}
