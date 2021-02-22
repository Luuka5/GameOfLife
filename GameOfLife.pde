float scale = 30;
int res = 5;

String rule = "b3/s23";
ArrayList<Integer> b, s;

boolean play = true;
boolean brush = false;

boolean mode = false;

float clock = 0;
float refreshrate = 5;

Button playB;
Button clear;
Button modeB;

Grid g;

void setup() {
  playB = new Button("Stop", 10, 905, 80, 40);
  playB.col = false;
  clear = new Button("Clear", 110, 905, 80, 40);
  modeB = new Button("Mode", 110, 905, 80, 40);
  
  size(900, 950);
  b = new ArrayList<Integer>();
  b.add(3);
  s = new ArrayList<Integer>();
  s.add(2);
  s.add(3);
  
  g = new Grid(30, 30, res);
  
  g.set(5, 5, false);
  g.set(6, 6, false);
  g.set(6, 7, false);
  g.set(5, 7, false);
  g.set(4, 7, false);
  
  clear();
  g.show();
}

void draw() {
  if (play) {
    clear();
    
    clock += 1.0 / refreshrate;
    if (clock >= 1) {
      g.update();
      clock = 0;
    }
    
     g.show();
  }
  
  playB.show();
  clear.show();
}

void mousePressed() {
  buttons();
  
  if (mouseY < scale * g.h) {
    int x = (int) ((double) mouseX / scale);
    int y = (int) ((double) mouseY / scale);
    g.set(x, y, !g.get(x, y));
    
    for (int i = 0; i < refreshrate; i++) {
      g.show();
    }
    clock = 0;
  }
}

void buttons() {
  if (playB.isPressed(mouseX, mouseY)) {
    play = !play;
    playB.col = !play;
    
    if (play) {
      playB.text = "Stop";
    } else {
      playB.text = "Play";
    }
    
    playB.show();
  }
  
  if (clear.isPressed(mouseX, mouseY)) {
    g = new Grid(g.w, g.h, res);
    
    for (int i = 0; i < refreshrate; i++) {
      g.show();
    }
    clock = 0;
  }
}

void keyPressed() {
  if (key == ' ') playB.press();
  if (key == ENTER) clear.press();
  buttons();
}
