
MainDisplay display = new MainDisplay();
Map map = new Map();
Button posIncreaseButton = new Button("Positive Increase", 675, 40, 130, 30);
Button deathIncreaseButton = new Button("Death Increase", 675, 80, 130, 30);

public void settings() {
  size(1100, 700);
}

void setup() {
  size(1100, 700);
  display.grid();
  display.headers();
  display.baseText();
  display.californiaImage();
  posIncreaseButton.display();
  deathIncreaseButton.display();
}

void draw() {
}

void mousePressed() {
  if (posIncreaseButton.mouseIsOver()) {
    int[] positiveIncreases = map.checkSavedData();
    display.circles(positiveIncreases);
  } else if (deathIncreaseButton.mouseIsOver()) {
    int[] deathIncreases = map.checkSavedData();
    display.circles(deathIncreases);
  }
}
