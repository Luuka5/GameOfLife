
class Button {
  String text;
  int x, y, w, h;
  boolean col;
  boolean press;
  
  Button(String text, int x, int y, int w, int h) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = true;
    this.press = false;
  }

  void show() {
    fill(col ? 50 : 200);
    rect(this.x, this.y, this.w, this.h);
    fill(col ? 255 : 0);
    text(this.text, this.x +10, this.y + this.h / 2.0, this.w - 20);
  }
  
  boolean isPressed(int x, int y) {
    if (press) {
      press = false;
      return true;
    }
    return x > this.x && x < this.x + this.w && y > this.y && y < this.y + this.h;
  }
  
  void press() {
    this.press = true;
    this.show();
  }
}

double distance(double x1, double y1, double x2, double y2) {
  double x = x1 - x2;
  double y = y1 - y2;
  return Math.sqrt(x*x + y*y);
}
