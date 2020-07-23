
MainDisplay display = new MainDisplay();
Map map = new Map();
Button posIncreaseButton = new Button("Positive Increase", 675, 40, 130, 30);
Button deathIncreaseButton = new Button("Death Increase", 675, 80, 130, 30);
final int WIDTH = 1100;
NewsDatum newsInfo = display.getCurrentNews();

public void settings() {
  size(1100, 700);
}

void setup() {
  display.grid();
  display.headers();
  display.baseText();
  display.usMap();
  posIncreaseButton.display();
  deathIncreaseButton.display();
  map.checkSavedData();
  //display.showNews();
}

void redraw() {
  background(#D6D6D6);
  display.grid();
  display.headers();
  display.baseText();
  display.usMap();
  posIncreaseButton.display();
  deathIncreaseButton.display();
  //display.showNews();
}

void draw() {
}

void mousePressed() {
  if (mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY >= 51 && mouseY <= 134) {
    try {
      link(newsInfo.getArticles().get(0).getURL());
    }
    catch(Exception e) {
    }
  } else if (mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY > 134 && mouseY <= 217) {
    try {
      link(newsInfo.getArticles().get(1).getURL());
    }
    catch(Exception e) {
    }
  } else if (mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY > 217 && mouseY <= 300) {
    try {
      link(newsInfo.getArticles().get(2).getURL());
    }
    catch(Exception e) {
    }
  }
  if (posIncreaseButton.mouseIsOver()) {
    int[] positiveIncreases = map.positiveIncreaseMap();
    redraw();
    display.circles(positiveIncreases, 255, 0, 0);
  } else if (deathIncreaseButton.mouseIsOver()) {
    int[] deathIncreases = map.deathIncreaseMap();
    redraw();
    display.circles(deathIncreases, 0, 0, 255);
  }
}
