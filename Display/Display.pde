//PFont mono;
PImage californiaMap;

final int WIDTH = 1100;
final int HEIGHT = 700;

void setup() {
  size(1100, 700);
  grid();
  headers();
  baseText();
  californiaImage();
}

void grid() {
  line(WIDTH/4, 0, WIDTH/4, HEIGHT);
  line(WIDTH*3/4, 0, WIDTH*3/4, HEIGHT);
  line(0, HEIGHT*4/5, WIDTH/4, HEIGHT*4/5);
  line(WIDTH*3/4, HEIGHT/2, WIDTH, HEIGHT/2);
}

void headers() {
  textSize(30);
  fill(179, 0, 0);
  //mono = createFont("andalemo.ttf", 32);
  //textFont(mono);
  text("Symptoms", 890, 390);
  text("Regulations", 50, 600);
  text("News Updates", 865, 40);
  text("Graphs", 80, 40);
  text("Map", 520, 40);
}

void baseText() {
  String symptoms = "~ Fever/chills\n~ Cough\n~ Difficulty breathing"
                     + "\n~ Fatigue\n~ Muscle/body aches\n~ Headache\n~ "
                     + "New loss of taste or smell\n~ Sore throat"
                     + "\n~ Congestion/runny nose\n~ Nausea/vomiting\n~ Diarrhea";
  String rules = "~ Wear a mask\n~ Wash your hands\n~ Keep your distance";
  textSize(15);
  fill(0, 0, 0);
  text(symptoms, 860, 405, 1050, 680);
  text(rules, 30, 615, 225, 680);
}

void californiaImage() {
  californiaMap = loadImage("californiaMap.png");
  image(californiaMap, 300, 60, 500, 600);
}
