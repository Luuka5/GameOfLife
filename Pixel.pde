
class Pixel {
  float brightness, goal, change;
  
  Pixel() {
    this.brightness = 0;
    this.goal = 0;
    this.change = 0;
  }
  
  void show(int x, int y) {
      fill(0, this.brightness, 0, 200);
      noStroke();
      rect(x*res, y*res, res, res);
      
      this.brightness += this.change;
  }
  
  void setNewGoal(float goal, float m) {
    this.goal = goal;
    this.change = ((this.goal - this.brightness) / m);
  }
}
