
MainDisplay display = new MainDisplay();
Map map = new Map();
Button posIncreaseButton = new Button("Positive Increase", 675, 40, 130, 30);
Button deathIncreaseButton = new Button("Death Increase", 675, 80, 130, 30);
Button hospitalizedButton = new Button("Hospitalized", 675, 120, 130, 30);
Button totalRecoveredButton = new Button("Total Recovered", 675, 160, 130, 30);
final int WIDTH = 1100;
NewsDatum newsInfo = display.getCurrentNews();

public void settings() {
  size(1100, 700);
}

void setup() {
  background(#D6D6D6);
  display.grid();
  display.headers();
  display.baseText();
  display.usMap();
  posIncreaseButton.display(232, 232, 232);
  deathIncreaseButton.display(232, 232, 232);
  hospitalizedButton.display(232, 232, 232);
  totalRecoveredButton.display(232, 232, 232);
  map.checkSavedData();
  display.showNews();
}

void redraw() {
  background(#D6D6D6);
  display.grid();
  display.headers();
  display.baseText();
  display.usMap();
  posIncreaseButton.display(232, 232, 232);
  deathIncreaseButton.display(232, 232, 232);
  hospitalizedButton.display(232, 232, 232);
  totalRecoveredButton.display(232, 232, 232);
  display.showNews();
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
    posIncreaseButton.display(255, 0, 0);
    display.circles(positiveIncreases, 255, 0, 0);
  } else if (deathIncreaseButton.mouseIsOver()) {
    int[] deathIncreases = map.deathIncreaseMap();
    redraw();
    deathIncreaseButton.display(0, 0, 255);
    display.circles(deathIncreases, 0, 0, 255);
  } else if (hospitalizedButton.mouseIsOver()) {
    int[] hospitalized = map.hospitalizedMap();
    redraw();
    hospitalizedButton.display(0, 255, 0);
    display.circles(hospitalized, 0, 255, 0);
  } else if (totalRecoveredButton.mouseIsOver()) {
    int[] recovered = map.recoveredMap();
    redraw();
    totalRecoveredButton.display(255, 255, 0);
    display.circles(recovered, 255, 255, 0);
  } 

  if (display.feverButton.mouseIsOver()) {
    link("https://www.healthline.com/health/fever");
  } else if (display.coughButton.mouseIsOver()) {
    link("https://www.healthline.com/symptom/cough");
  } else if (display.fatigueButton.mouseIsOver()) {
    link("https://www.healthline.com/health/fatigue");
  } else if (display.breathingButton.mouseIsOver()) {
    link("https://www.healthline.com/health/breathing-difficulties");
  } else if (display.headacheButton.mouseIsOver()) {
    link("https://www.healthline.com/health/headache");
  } else if (display.lossOfTasteButton.mouseIsOver()) {
    link("https://www.healthline.com/health/taste-impaired");
  } else if (display.soreThroatButton.mouseIsOver()) {
    link("https://www.healthline.com/health/sore-throat");
  } else if (display.congestionButton.mouseIsOver()) {
    link("https://www.healthline.com/health/nasal-congestion");
  } else if (display.runnyNoseButton.mouseIsOver()) {
    link("https://www.healthline.com/health/runny-nose-causes");
  } else if (display.nauseaButton.mouseIsOver()) {
    link("https://www.healthline.com/health/nausea");
  } else if (display.vomitingButton.mouseIsOver()) {
    link("https://www.healthline.com/health/vomiting");
  } else if (display.diarrheaButton.mouseIsOver()) {
    link("https://www.healthline.com/health/diarrhea");
  }
}
