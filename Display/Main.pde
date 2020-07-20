public void settings() {
  size(1100, 700);
}

void setup() {
  MainDisplay display = new MainDisplay();
  Map map = new Map();
  size(1100, 700);
  display.grid();
  display.headers();
  display.baseText();
  display.californiaImage();
  int[] positiveIncreases = map.checkSavedData();
  display.circles(positiveIncreases);
}

void draw() {
}
