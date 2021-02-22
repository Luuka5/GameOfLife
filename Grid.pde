class Grid {
  private int w, h, res;
  private Cell[][] grid;
  private Pixel[][] img;
  
  Grid(int w, int h, int res) {
    this.w = w;
    this.h = h;
    this.res = res;
    
    this.grid = new Cell[this.w][this.h];
    for (int x = 0; x < this.w; x++) {
      for (int y = 0; y < this.h; y++) {
        grid[x][y] = new Cell(true);
      }
    }
    
    img = new Pixel[(int) (this.w*scale / (double) res)][(int) (this.h*scale / (double) res)];
    for (int x = 0; x < (double) this.w*scale / res; x++) {
      for (int y = 0; y < (double) this.h*scale / res; y++) {
        img[x][y] = new Pixel();
      }
    }
  }
  
  void show() {
    
    for (int x = 0; x < this.w; x++) {
      for (int y = 0; y < this.h; y++) {
        grid[x][y].show(x, y);
      }
    }
    
    
    for (int x = 0; x < this.w *scale / (double) res; x++) {
      for (int y = 0; y < this.h *scale / (double) res; y++) {
        this.img[x][y].show(x, y);
      }
    }
    
    
  }
  
  void update() {
    Cell[][] newGrid = new Cell[this.w][this.h];
    
    for (int x = 0; x < this.w; x++) {
      for (int y = 0; y < this.h; y++) {
        newGrid[x][y] = grid[x][y].copy();
        newGrid[x][y].setState(this.neighbours(x, y));
      }
    }
    
    this.grid = newGrid;
    
    for (int x = 0; x < this.w *scale; x += res) {
      for (int y = 0; y < this.h *scale; y += res) {
        
        float d = 0;
        for (int i = 0; i < this.w; i++) {
          for (int j = 0; j < this.h; j++) {
            if (!this.get(i, j)) {
              d += 1 / (distance(x / (double) scale, y / (double) scale, i +0.5, j +0.5));
            }
          }
        }
        
        d *= 50;
        d -= 60;
        
        d = d > 255 ? 255 : d;
        d = d < 0 ? 0 : d;
        this.img[(int) (x / (double) res)][(int) (y / (double) res)].setNewGoal(d, refreshrate);
      }
    }
  }
  
  int neighbours(int x, int y) {
    
    int sum = 0;
    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) {
        if (i == 0 && j == 0) continue;
        if (!get(x + i, y + j)) sum++;
      }
    }
    
    return sum;
  }
  
  boolean get(int x, int y) {
    if (x < 0 || x >= this.w || y < 0 || y >= this.h) return true;
    
    return grid[x][y].dead();
  }
  
  void set(int x, int y, boolean dead) {
    grid[x][y].dead = dead;
  }
}
