import static javax.swing.JOptionPane.*;
import javax.imageio.ImageIO;

Button buy1;
Button buy2;
Button buy3;
final String AMAZON = "https://www.amazon.com/s?k=";

Button graph1;
Button graph2;
int graphType = 0;

MainDisplay display = new MainDisplay(); ;
SiteDatum siteData;

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
boolean [] buttons = {false, false, false, false};

public void settings() {
  size(1100, 700);
}

void setup() {
  fill(0, 0, 0);
  textAlign(0);
  String[] fontList = PFont.list();
  PFont font = createFont(fontList[168], 32);
  textFont(font);
  textSize(24);
  String fetchText = "Please wait ... Process may take up to 15 seconds";
  text(fetchText, 300, 350);
}

void draw() {
  if (hasGottenData) {
    updateGraphics();
  } else {
    updateData();
    hasGottenData = true;
  }
  fill(0);
  if (currentPage == 1) {
    rect(100, 450, timeline.getnumDays() * 2, 1);
  }
  if (!mouseDragged  && savedX == 100 && currentPage == 1) {
    rect(timeline.getnumDays() * 2 + 100, 445, 3, 10);
  } else if (currentPage == 1) {
    rect(savedX, 445, 3, 10);
  }
  if (currentPage == 1) {
    textSize(15);
    String str = (timeline.getDate((formula))).toString();
    text("Date: " + str.charAt(4) + str.charAt(5) + "/" + str.charAt(6) +str.charAt(7) + "/" + str.charAt(0) + str.charAt(1) + str.charAt(2) + str.charAt(3), 600, 350);
  }
}
void updateData() {
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
  graph1 = new Button("Total", 302, 478, 60, 30);
  graph2 = new Button("Top 5", 453, 477, 60, 30);
}

void updateGraphics() {
  background(#D6D6D6);
  display.grid();
  display.showNews();
  display.headers();
  display.baseText();
  noStroke();
  if (buttons[0]) {
    fill(255, 0, 0);
    int[] positiveIncreases = map.positiveIncreaseMap(timeline.getData(timeline.getDate(formula)));
    display.graph(positiveIncreases, 0, graphType);
  }else if(buttons[1]){
    fill(0, 0, 255);
    int[] deathIncreases = map.deathIncreaseMap(timeline.getData(timeline.getDate(formula)));
    display.graph(deathIncreases, 1, graphType);
  }else if(buttons[2]){
    fill(0, 255, 0);
    int[] hospitalized = map.hospitalizedMap(timeline.getData(timeline.getDate(formula)));
    display.graph(hospitalized, 2, graphType);
  }else if(buttons[3]){
    fill(255, 255, 0);
    int[] recovered = map.recoveredMap(timeline.getData(timeline.getDate(formula)));
    display.graph(recovered, 3, graphType);
  }else{
    textSize(16);
    fill(0, 0, 0);
    text("Select an option from the map pane to view a graph.", 240, 600);
  }

  if (currentPage == 1) {
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
    graph1.display(232, 232, 232);
    graph2.display(232, 232, 232);
    if(buttons[0]){
      int[] positiveIncreases = map.positiveIncreaseMap(timeline.getData(timeline.getDate(formula)));
      posIncreaseButton.display(255, 0, 0);
      display.circles(positiveIncreases, 255, 0, 0);
    } else if (buttons[1]) {
      //int[] deathIncreases = map.deathIncreaseMap();
      int[] deathIncreases = map.deathIncreaseMap(timeline.getData(timeline.getDate((formula))));
      deathIncreaseButton.display(0, 0, 255);
      display.circles(deathIncreases, 0, 0, 255);
    } else if (buttons[2]) {
      int[] hospitalized = map.hospitalizedMap(timeline.getData(timeline.getDate((formula))));
      hospitalizedButton.display(0, 255, 0);
      display.circles(hospitalized, 0, 255, 0);
    } else if (buttons[3]) {
      int[] recovered = map.recoveredMap(timeline.getData(timeline.getDate((formula))));
      totalRecoveredButton.display(255, 255, 0);
      display.circles(recovered, 255, 255, 0);
    } else {
      textSize(16);
      fill(0, 0, 0);
      text("Select an option from the map pane to view a graph.", 240, 600);
    }
  }

  if (currentPage == 2) {
    nextPage.display(150, 150, 150);
    previousPage.display(300, 300, 300);
    display.testingLocations();

    buy1.display(232, 232, 232);
    buy2.display(232, 232, 232);
    buy3.display(232, 232, 232);
  }
}


void mousePressed() {
  if ( 410 < mouseY && 480 > mouseY && 100 < mouseX && mouseX < 100 + timeline.getnumDays() * 2 ) {
    savedX = mouseX;
    formula = Math.abs(((savedX - 100)/2) - (timeline.getnumDays()-1));
    rect(mouseX, 445, 3, 10);
    mouseDragged = true;
  } else {
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
    if (currentPage!=2) {
      currentPage++;
    }
  }
  if (previousPage.mouseIsOver()) {
    if (currentPage!=1) {
      currentPage--;
    }
  }

  if (mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY > 300 && mouseY <= 400) {
    link("https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html");
  }


  if (currentPage == 1) {
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
  }

  if (currentPage == 2) {
    if (buy1.mouseIsOver()) {
      link(AMAZON + "masks");
    } else if (buy2.mouseIsOver()) {
      link(AMAZON + "disinfectant");
    } else if (buy3.mouseIsOver()) {
      String item = showInputDialog(null, "Please enter the item you want to buy: ", "Search for Supplies", INFORMATION_MESSAGE);
      if (item != null && !item.replaceAll(" ", "").equals("")) {
        link(AMAZON + item.replace(' ', '+'));
      }
    }
  }
  
  if(currentPage == 1) {
     if(graph1.mouseIsOver()) {
       graphType = 0;
       graph1.display(300, 300, 300);
       graph2.display(232, 232, 232);
     } else if (graph2.mouseIsOver()) {
       graphType = 1;
       graph2.display(300, 300, 300);
       graph1.display(232, 232, 232);
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

  loadTestingLocations();
  if (display.stAnthonyButton.mouseIsOver()) {
    String monday = siteData.getStAnthony().getMonday();
    String tuesday = siteData.getStAnthony().getTuesday();
    String wednesday = siteData.getStAnthony().getWednesday();
    String thursday = siteData.getStAnthony().getThursday();
    String friday = siteData.getStAnthony().getFriday();
    String saturday = siteData.getStAnthony().getSaturday();
    String sunday = siteData.getStAnthony().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  } else if (display.tubmanChavezButton.mouseIsOver()) {
    String monday = siteData.getTubmanChavez().getMonday();
    String tuesday = siteData.getTubmanChavez().getTuesday();
    String wednesday = siteData.getTubmanChavez().getWednesday();
    String thursday = siteData.getTubmanChavez().getThursday();
    String friday = siteData.getTubmanChavez().getFriday();
    String saturday = siteData.getTubmanChavez().getSaturday();
    String sunday = siteData.getTubmanChavez().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  } else if (display.aquaticaButton.mouseIsOver()) {
    String monday = siteData.getAquatica().getMonday();
    String tuesday = siteData.getAquatica().getTuesday();
    String wednesday = siteData.getAquatica().getWednesday();
    String thursday = siteData.getAquatica().getThursday();
    String friday = siteData.getAquatica().getFriday();
    String saturday = siteData.getAquatica().getSaturday();
    String sunday = siteData.getAquatica().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  } else if (display.sycuanButton.mouseIsOver()) {
   String monday = siteData.getSycuan().getMonday();
    String tuesday = siteData.getSycuan().getTuesday();
    String wednesday = siteData.getSycuan().getWednesday();
    String thursday = siteData.getSycuan().getThursday();
    String friday = siteData.getSycuan().getFriday();
    String saturday = siteData.getSycuan().getSaturday();
    String sunday = siteData.getSycuan().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.marVistaButton.mouseIsOver()) {
    String monday = siteData.getMarVista().getMonday();
    String tuesday = siteData.getMarVista().getTuesday();
    String wednesday = siteData.getMarVista().getWednesday();
    String thursday = siteData.getMarVista().getThursday();
    String friday = siteData.getMarVista().getFriday();
    String saturday = siteData.getMarVista().getSaturday();
    String sunday = siteData.getMarVista().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.northCoastalButton.mouseIsOver()) {
    String monday = siteData.getNorthCoastal().getMonday();
    String tuesday = siteData.getNorthCoastal().getTuesday();
    String wednesday = siteData.getNorthCoastal().getWednesday();
    String thursday = siteData.getNorthCoastal().getThursday();
    String friday = siteData.getNorthCoastal().getFriday();
    String saturday = siteData.getNorthCoastal().getSaturday();
    String sunday = siteData.getNorthCoastal().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.lgbtButton.mouseIsOver()) {
    String monday = siteData.getLgbtCenter().getMonday();
    String tuesday = siteData.getLgbtCenter().getTuesday();
    String wednesday = siteData.getLgbtCenter().getWednesday();
    String thursday = siteData.getLgbtCenter().getThursday();
    String friday = siteData.getLgbtCenter().getFriday();
    String saturday = siteData.getLgbtCenter().getSaturday();
    String sunday = siteData.getLgbtCenter().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.euclidButton.mouseIsOver()) {
    String monday = siteData.getEuclidCenter().getMonday();
    String tuesday = siteData.getEuclidCenter().getTuesday();
    String wednesday = siteData.getEuclidCenter().getWednesday();
    String thursday = siteData.getEuclidCenter().getThursday();
    String friday = siteData.getEuclidCenter().getFriday();
    String saturday = siteData.getEuclidCenter().getSaturday();
    String sunday = siteData.getEuclidCenter().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.sdStateButton.mouseIsOver()) {
    String monday = siteData.getSdState().getMonday();
    String tuesday = siteData.getSdState().getTuesday();
    String wednesday = siteData.getSdState().getWednesday();
    String thursday = siteData.getSdState().getThursday();
    String friday = siteData.getSdState().getFriday();
    String saturday = siteData.getSdState().getSaturday();
    String sunday = siteData.getSdState().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.usdLotButton.mouseIsOver()) {
    String monday = siteData.getUsdLot().getMonday();
    String tuesday = siteData.getUsdLot().getTuesday();
    String wednesday = siteData.getUsdLot().getWednesday();
    String thursday = siteData.getUsdLot().getThursday();
    String friday = siteData.getUsdLot().getFriday();
    String saturday = siteData.getUsdLot().getSaturday();
    String sunday = siteData.getUsdLot().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.searsButton.mouseIsOver()) {
    String monday = siteData.getSears().getMonday();
    String tuesday = siteData.getSears().getTuesday();
    String wednesday = siteData.getSears().getWednesday();
    String thursday = siteData.getSears().getThursday();
    String friday = siteData.getSears().getFriday();
    String saturday = siteData.getSears().getSaturday();
    String sunday = siteData.getSears().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.assessorRecorderButton.mouseIsOver()) {
    String monday = siteData.getAssessorRecorder().getMonday();
    String tuesday = siteData.getAssessorRecorder().getTuesday();
    String wednesday = siteData.getAssessorRecorder().getWednesday();
    String thursday = siteData.getAssessorRecorder().getThursday();
    String friday = siteData.getAssessorRecorder().getFriday();
    String saturday = siteData.getAssessorRecorder().getSaturday();
    String sunday = siteData.getAssessorRecorder().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.escondidoTheaterButton.mouseIsOver()) {
   String monday = siteData.getArtsCenter().getMonday();
    String tuesday = siteData.getArtsCenter().getTuesday();
    String wednesday = siteData.getArtsCenter().getWednesday();
    String thursday = siteData.getArtsCenter().getThursday();
    String friday = siteData.getArtsCenter().getFriday();
    String saturday = siteData.getArtsCenter().getSaturday();
    String sunday = siteData.getArtsCenter().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.kimballButton.mouseIsOver()) {
    String monday = siteData.getKimballCenter().getMonday();
    String tuesday = siteData.getKimballCenter().getTuesday();
    String wednesday = siteData.getKimballCenter().getWednesday();
    String thursday = siteData.getKimballCenter().getThursday();
    String friday = siteData.getKimballCenter().getFriday();
    String saturday = siteData.getKimballCenter().getSaturday();
    String sunday = siteData.getKimballCenter().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.sanYsidroButton.mouseIsOver()) {
    String monday = siteData.getSanYsidro().getMonday();
    String tuesday = siteData.getSanYsidro().getTuesday();
    String wednesday = siteData.getSanYsidro().getWednesday();
    String thursday = siteData.getSanYsidro().getThursday();
    String friday = siteData.getSanYsidro().getFriday();
    String saturday = siteData.getSanYsidro().getSaturday();
    String sunday = siteData.getSanYsidro().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  } else if (display.miraMesaButton.mouseIsOver()) {
   String monday = siteData.getMiraMesa().getMonday();
    String tuesday = siteData.getMiraMesa().getTuesday();
    String wednesday = siteData.getMiraMesa().getWednesday();
    String thursday = siteData.getMiraMesa().getThursday();
    String friday = siteData.getMiraMesa().getFriday();
    String saturday = siteData.getMiraMesa().getSaturday();
    String sunday = siteData.getMiraMesa().getSunday();
    showMessageDialog(null, "Sunday: " + sunday + "\nMonday: " + monday + "\nTuesday: " + tuesday + "\nWednesday: " + wednesday + "\nThursday: " + thursday + "\nFriday: " + friday + "\nSaturday: " + saturday);
  
  }
}

void loadTestingLocations() {
  siteData = map.gson.fromJson(arrayToString(loadStrings("testingData.txt")), SiteDatum.class);
}

String arrayToString(String[] array) {
  String finalString = "";
  for (String s : array) {
    finalString += s;
  }
  
  return finalString;
}

void mouseDragged() {
  if ( 410 < mouseY && 480 > mouseY && 100 < mouseX && mouseX < 100 + timeline.getnumDays() * 2 ) {
    formula = Math.abs(((savedX - 100)/2) - (timeline.getnumDays() - 1) );
    rect(mouseX, 445, 3, 10);
    savedX = mouseX;
    mouseDragged = true;
  } else {
    mouseDragged = false;
  }
}
