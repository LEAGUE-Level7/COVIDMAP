//PFont mono;


public class MainDisplay {

  PImage californiaMap;
  final int WIDTH = 1100;
  final int HEIGHT = 700;
  int[] xValues = {456, 113, 167, 388, 84, 243, 588, 568, 527, 497, 250, 
    156, 419, 451, 371, 321, 470, 385, 608, 553, 597, 463, 360, 423, 385, 
    217, 314, 123, 592, 576, 233, 561, 541, 308, 488, 335, 103, 538, 599, 
    525, 303, 456, 312, 177, 578, 541, 121, 510, 413, 231};
  int[] yValues = {318, 372, 292, 298, 243, 236, 171, 217, 381, 316, 417, 
    155, 223, 218, 196, 246, 250, 341, 112, 212, 157, 178, 145, 322, 250,
    120, 207, 208, 141, 198, 301, 159, 270, 118, 211, 290, 141, 199, 168,
    298, 162, 280, 344, 226, 134, 239, 97, 235, 163, 178};

  public void grid() {
    line(0, HEIGHT*2/3, WIDTH*3/4, HEIGHT*2/3);
    line(WIDTH*3/4, 300, WIDTH, 300);
    line(WIDTH*3/4, 400, WIDTH, 400);
    line(WIDTH*3/4, 0, WIDTH*3/4, HEIGHT);
  }

  void headers() {
    textSize(25);
    fill(179, 0, 0);
    //mono = createFont("andalemo.ttf", 32);
    //textFont(mono);
    text("Symptoms", 900, 435);
    text("Regulations", 890, 335);
    text("News Updates", 880, 35);
    text("Map", 380, 35);
    text("Graph", 375, 500);
  }

  void baseText() {
    String symptoms = "~ Fever/chills\n~ Cough\n~ Difficulty breathing"
      + "\n~ Fatigue\n~ Muscle/body aches\n~ Headache\n~ "
      + "New loss of taste or smell\n~ Sore throat"
      + "\n~ Congestion/runny nose\n~ Nausea/vomiting\n~ Diarrhea";
    String rules = "Wear a mask. Wash your hands. Keep your distance!";
    textSize(14.5);
    fill(0, 0, 0);
    text(symptoms, 855, 445, 1050, 680);
    text(rules, 855, 345, 225, 680);
  }

  void californiaImage() {
    californiaMap = loadImage("unitedStatesMap.png");
    image(californiaMap, 40, 60, 600, 400);
  }

  void circles() {
    Map map = new Map();
    for (int i = 0; i < 50; i++) {
      fill (255, 0, 0);
     // System.out.println(map.positiveIncreases[i]);
      circle(xValues[i], yValues[i], 5);//map.positiveIncreases[i]/100);
    }
  }
}
