
class Cell {
  private boolean dead;
  
  Cell(boolean dead) {
    this.dead = dead;
  }
  
  void show(int x, int y) {
    if (this.dead) {
      fill(50);
    } else {
      fill(255);
    }
    rect(x * scale, y * scale, scale, scale);
  }
  
  void setState(int neighbours) {
    
    if (this.dead) {
      this.dead = !b.contains(neighbours);
    } else {
      this.dead = !s.contains(neighbours);
    }
  }
  
  boolean dead() {
    return this.dead;
  }
  
  Cell copy() {
    return new Cell(this.dead);
  }
}
