void resetPlayer() {
  player.x = 50; // Initial x position
  player.y = height - 100; // Adjust y position to be above the ground
  player.speedX = 0;
  player.speedY = 0;
  player.inAir = true; // Ensure the player starts falling
}
