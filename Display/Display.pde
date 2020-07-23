//PFont mono;


public class MainDisplay {
  News news = new News();
  NewsDatum newsInfo = news.fetchTopNews();
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
    strokeWeight(4);
    line(0, HEIGHT*2/3, WIDTH*3/4, HEIGHT*2/3);
    line(WIDTH*3/4, 300, WIDTH, 300);//300 //50
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

  void circles(int[] positiveIncreases) {
    Map map = new Map();
    for (int i = 0; i < 50; i++) {
      fill (255, 0, 0);
      //System.out.println(i + ": " + positiveIncreases[i]);
      //circle(xValues[i], yValues[i], (float)(Math.log(positiveIncreases[i])/Math.log(1.5)));
    }
  }
  
  void graph(int[] pI) {
    Graph graph = new Graph();
    graph.initialize(pI);
    graph.display();
  }
  
  void showNews(){//51 //300 //83 spacing
    strokeWeight(1);
    line(WIDTH*3/4, 51, WIDTH, 51);
    line(WIDTH*3/4, 134, WIDTH, 134);//300 //50
    line(WIDTH*3/4, 217, WIDTH, 217);
    for(int i = 0; i < 3; i++){
      try {
        newsInfo.getArticles().get(i);
      } catch(Exception e){
        continue;
      }
      String title = newsInfo.getArticles().get(i).getTitle();
      String description = newsInfo.getArticles().get(i).getDescription();
      String author = newsInfo.getArticles().get(i).getAuthor();
      String publishedAt = newsInfo.getArticles().get(i).getPublishedAt();
      title = title.substring(0, 45) + "...";
      textSize(10);
      fill(0, 0, 255);
      text(title, 1 + WIDTH*3/4 + 3, 56 + (83*i), WIDTH, 65 + (83*i));
      fill(50, 50, 50);
      textSize(9);
      String firstDescription;
      try {
        firstDescription = description.substring(0, 55);
      } catch (Exception e){
        firstDescription = description + "...";
      }
      String secondDescription;
      try {
        secondDescription = description.substring(55, 110) + "...";
      } catch (Exception e){
        secondDescription = "";
      }
      text(firstDescription, 1 + WIDTH*3/4 + 3, 70 + (83*i), WIDTH, 80 + (83*i));
      text(secondDescription, 1 + WIDTH*3/4 + 3, 80 + (83*i), WIDTH, 90 + (83*i));
      publishedAt = "Date: " + publishedAt;
      text(publishedAt, 1 + WIDTH*3/4 + 3, 97 + (83*i), WIDTH, 107 + (83*i));
      author = "Author: " + author;
      text(author, 1 + WIDTH*3/4 + 3, 115 + (83*i), WIDTH, 125 + (83*i));
      if (!title.equals("")){
        textSize(9);
        fill(170, 170, 100);
        text("CLICK for more info", 1 + WIDTH*3/4 + 160, 120 + (83*i), WIDTH, 130 + (83*i));
      }
    }
  }
  NewsDatum getCurrentNews(){
    return newsInfo;
  }
}
