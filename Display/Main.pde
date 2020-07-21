public void settings() {
  size(1100, 700);
}
final int WIDTH = 1100;
MainDisplay display = new MainDisplay();
NewsDatum newsInfo = display.getCurrentNews();
void setup() {
  Map map = new Map();
  size(1100, 700);
  display.grid();
  display.headers();
  display.baseText();
  display.californiaImage();
  //map.covidStats();
  display.circles();
  News news = new News();
  display.showNews();
  
}

void draw() {
}
void mousePressed(){
    System.out.println("hello");
    if (mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY >= 51 && mouseY <= 134){
      try{
        link(newsInfo.getArticles().get(0).getURL());
      }catch(Exception e){
      }
    }else if(mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY > 134 && mouseY <= 217){
      try{
        link(newsInfo.getArticles().get(1).getURL());
      }catch(Exception e){
      }
    }else if(mouseX >= WIDTH*3/4 && mouseX <= WIDTH && mouseY > 217 && mouseY <= 300){
      try{
        link(newsInfo.getArticles().get(2).getURL());
      }catch(Exception e){
      }
    }
  }
