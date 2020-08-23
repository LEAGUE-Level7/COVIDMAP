import static javax.swing.JOptionPane.*;
import javax.imageio.ImageIO;

Button buy1;
Button buy2;
Button buy3;
final String AMAZON = "https://www.amazon.com/s?k=";

MainDisplay display = new MainDisplay(); ;
Button posIncreaseButton = new Button("Positive Increase", 675, 40, 130, 30);
Button deathIncreaseButton = new Button("Death Increase", 675, 80, 130, 30);
Button hospitalizedButton = new Button("Hospitalized", 675, 120, 130, 30);
Button totalRecoveredButton = new Button("Total Recovered", 675, 160, 130, 30);
Button nextPage = new Button("->", 750, 425, 60, 30);
Button previousPage = new Button("<-", 685, 425, 60, 30);
int currentPage = 1;
int value = 0;
int savedX = 100;
int formula = 0;
boolean mouseDragged;
final int WIDTH = 1100;
NewsDatum newsInfo;
Map map = new Map();
String[] states = {"AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", 
    "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", 
    "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", 
    "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", 
    "VA", "WA", "WV", "WI", "WY"};
Timeline timeline = new Timeline(states);
boolean hasGottenData = false;
boolean [] buttons = {false,false,false,false};

public void settings() {
  size(1100, 700);

}

void setup() {
  fill(0,0,0);
  textAlign(0);
  String[] fontList = PFont.list();
  PFont font = createFont(fontList[168], 32);
  textFont(font);
  textSize(24);
  String fetchText = "Please wait ... Process may take up to 15 seconds";
  text(fetchText, 300, 350);
}

void draw() {
  if (hasGottenData){
    updateGraphics();
  }else{
    updateData();
    hasGottenData = true;
  }
  fill(0);
  if(currentPage == 1){
  rect(100, 450,  timeline.getnumDays() * 2 , 1);
  
  }
  if(!mouseDragged  && savedX == 100 && currentPage == 1){
    rect(timeline.getnumDays() * 2 + 100,445,3, 10);
  }
  else if (currentPage == 1){
    rect(savedX ,445,3, 10);
  }
  if(currentPage == 1){
  textSize(15);
  String str = (timeline.getDate((formula))).toString();
  text("Date: " + str.charAt(4) + str.charAt(5) + "/" + str.charAt(6) +str.charAt(7) + "/" + str.charAt(0) + str.charAt(1) + str.charAt(2) + str.charAt(3) , 600, 350);
  }
}
void updateData(){
  //map.checkSavedData();
  timeline.pullAllStatesAllDates();
  newsInfo = display.getCurrentNews();
  posIncreaseButton = new Button("Positive Increase", 675, 40, 130, 30);
  deathIncreaseButton = new Button("Death Increase", 675, 80, 130, 30);
  hospitalizedButton = new Button("Hospitalized", 675, 120, 130, 30);
  totalRecoveredButton = new Button("Total Recovered", 675, 160, 130, 30);
  buy1 = new Button("Buy Masks", 675, 40, 130, 30);
  buy2 = new Button("Buy Disinfectant", 675, 80, 130, 30);
  buy3 = new Button("Buy Custom", 675, 120, 130, 30);
}

void updateGraphics(){
  background(#D6D6D6);
  display.grid();
  display.showNews();
  display.headers();
  display.baseText();
  noStroke();
  if(buttons[0]){
    fill(255, 0, 0);
    int[] positiveIncreases = map.positiveIncreaseMap();
    display.graph(positiveIncreases, 0);
  }else if(buttons[1]){
    fill(0, 0, 255);
    int[] deathIncreases = map.deathIncreaseMap();
    display.graph(deathIncreases, 1);
  }else if(buttons[2]){
    fill(0, 255, 0);
    int[] hospitalized = map.hospitalizedMap();
    display.graph(hospitalized, 2);
  }else if(buttons[3]){
    fill(255, 255, 0);
    int[] recovered = map.recoveredMap();
    display.graph(recovered, 3);
  }else{
    textSize(16);
    fill(0, 0, 0);
    text("Select an option from the map pane to view a graph.", 240, 600);
  }

  if (currentPage == 1){
    textSize(25);
    fill(179, 0, 0);
    text("Map", 380, 35);
    //don't forget to reset the color and textSize
    nextPage.display(300, 300, 300);
    previousPage.display(150, 150, 150);
    display.usMap();
    posIncreaseButton.display(232, 232, 232);
    deathIncreaseButton.display(232, 232, 232);
    hospitalizedButton.display(232, 232, 232);
    totalRecoveredButton.display(232, 232, 232);
    if(buttons[0]){
      int[] positiveIncreases = map.positiveIncreaseMap(timeline.getData(timeline.getDate(formula)));
      posIncreaseButton.display(255, 0, 0);
      display.circles(positiveIncreases, 255, 0, 0);
    }else if(buttons[1]){
      //int[] deathIncreases = map.deathIncreaseMap();
      int[] deathIncreases = map.deathIncreaseMap(timeline.getData(timeline.getDate((formula))));
      deathIncreaseButton.display(0, 0, 255);
      display.circles(deathIncreases, 0, 0, 255);
    }else if(buttons[2]){
      int[] hospitalized = map.hospitalizedMap(timeline.getData(timeline.getDate((formula))));
      hospitalizedButton.display(0, 255, 0);
      display.circles(hospitalized, 0, 255, 0);
    }else if(buttons[3]){
      int[] recovered = map.recoveredMap(timeline.getData(timeline.getDate((formula))));
      totalRecoveredButton.display(255, 255, 0);
      display.circles(recovered, 255, 255, 0);   
    } else {
      textSize(16);
      fill(0, 0, 0);
      text("Select an option from the map pane to view a graph.", 240, 600);
    }
  }
  
  if (currentPage == 2){
    nextPage.display(150, 150, 150);
    previousPage.display(300, 300, 300);
    buy1.display(232, 232, 232);
    buy2.display(232, 232, 232);
    buy3.display(232, 232, 232);
  }
}
  

void mousePressed() {
  if( 410 < mouseY && 480 > mouseY && 100 < mouseX && mouseX < 100 + timeline.getnumDays() * 2 ){
     savedX = mouseX;
       formula = Math.abs(((savedX - 100)/2) - (timeline.getnumDays()-1));
      rect(mouseX,445,3, 10);
        mouseDragged = true;
  }
  else{
    mouseDragged = false;
  }
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
  if (nextPage.mouseIsOver()) {
    if(currentPage!=2){
      currentPage++;
    }
  }
  if (previousPage.mouseIsOver()) {
    if(currentPage!=1){
      currentPage--;
    }
  }

  if(mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY > 300 && mouseY <= 400){
    link("https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html");

  }
  if (posIncreaseButton.mouseIsOver()) {
    buttons[0] = true;
    buttons[1] = false;
    buttons[2] = false;
    buttons[3] = false;
  } else if (deathIncreaseButton.mouseIsOver()) {
    buttons[0] = false;
    buttons[1] = true;
    buttons[2] = false;
    buttons[3] = false;
  } else if (hospitalizedButton.mouseIsOver()) {
    buttons[0] = false;
    buttons[1] = false;
    buttons[2] = true;
    buttons[3] = false;
  } else if (totalRecoveredButton.mouseIsOver()) {
    buttons[0] = false;
    buttons[1] = false;
    buttons[2] = false;
    buttons[3] = true;
  } 
  
  if(currentPage == 2){
    if(buy1.mouseIsOver()){
      link(AMAZON + "masks");
    } else if(buy2.mouseIsOver()){
      link(AMAZON + "disinfectant");
    } else if(buy3.mouseIsOver()){
      String item = showInputDialog(null, "Please enter the item you want to buy: ", "Search for Supplies", INFORMATION_MESSAGE);
      if(item != null && !item.replaceAll(" ", "").equals("")){
        link(AMAZON + item.replace(' ', '+'));
      }
    }
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
void mouseDragged(){
    if( 410 < mouseY && 480 > mouseY && 100 < mouseX && mouseX < 100 + timeline.getnumDays() * 2 ){
      formula = Math.abs(((savedX - 100)/2) - (timeline.getnumDays() - 1) );
      rect(mouseX,445,3, 10);
      savedX = mouseX;
      mouseDragged = true;
    }
    else{
      mouseDragged = false;
      
}

}
