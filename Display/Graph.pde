
public class Graph {
  Map map = new Map();
  int[] unsortedData = new int[50];
  String[] states = new String[50];
  int index = 0;
  int highest = 1;

  int rectY = 0;
  int rectHeight = 0;
  PFont mono;
  int sumTop5 = 1;
  int[] top5index = new int[5];
  float[] top5scale = new float[5];
  int[][] colors = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}};

  void initialize(int[] pI) {
    this.unsortedData = pI;
    this.states = map.states;
    mono = loadFont("Consolas-48.vlw");
  }

  void displayBar(int number) {
    strokeWeight(5);
    fill(0, 0, 0);
    line(5, 700, 815, 650);
    //old vertical axis...
    /*textSize(15);
     textAlign(RIGHT);
     for (int i = 0; i < 5; i++) {
     text(Integer.toString(200 - 50*i), 40, 510 + 28*(i+1));
     }
     */
    textAlign(CENTER);
    textFont(mono, 12);
    float scale = 150.0/highest;
    for (int i = 0; i < 50; i++) {
      fill(0, 0, 0);
      text(states[i].toUpperCase(), 12 + 16.25*i, 670);
      switch (number) {
        case 0:
          fill(255, 0, 0);
          break;
        case 1:
          fill(0, 0, 255);
          break;
        case 2:
          fill(0, 200, 0);
          break;
        case 3:
          fill(200, 200, 0);
          break;
      }
        rect((10 + (16.25*i)), (650 - (unsortedData[i]*scale)), 5, (unsortedData[i]*scale));
        if (i == index) {
          rectY = (int)(650 - (unsortedData[i]*scale));
          rectHeight = (int)(unsortedData[i]*scale);
        }
    }
    //y axis
    textFont(mono, 12);
    fill(0, 0, 0);
    text(unsortedData[index] + " -", 25, rectY);
    text((unsortedData[index]/2) + " -", 25, (rectY + rectHeight/2));
  }
  
  void displayTop5(int number) {
    //ellipse(150, 600, 160, 160);
    String[] fontList = PFont.list();
    PFont font = createFont(fontList[168], 16);
    textFont(font);
    fill(0, 0, 0);
    text("Top 5 States", 60, 500);
    pickColors(number);
    //highest
    fill(colors[0][0], colors[0][1], colors[0][2]);
    stroke(colors[0][0], colors[0][1], colors[0][2]);
    rect(215, 510, 15, 15);
    noStroke();
    arc(100f, 600f, 160f, 160f, 0, (2*PI*top5scale[0]), PIE);
    //2nd highest
    fill(colors[1][0], colors[1][1], colors[1][2]);
    stroke(colors[0][0], colors[0][1], colors[0][2]);
    rect(215, 550, 15, 15);
    noStroke();
    arc(100f, 600f, 160f, 160f, (2*PI*top5scale[0]), (2*PI*top5scale[1] + 2*PI*top5scale[0]), PIE);
    //3rd highest
    fill(colors[2][0], colors[2][1], colors[2][2]);
    stroke(colors[0][0], colors[0][1], colors[0][2]);
    rect(215, 590, 15, 15);
    noStroke();
    arc(100f, 600f, 160f, 160f, (2*PI*top5scale[1] + 2*PI*top5scale[0]), (2*PI*top5scale[0] + 2*PI*top5scale[1] + 2*PI*top5scale[2]), PIE);
    //4th highest
    fill(colors[3][0], colors[3][1], colors[3][2]);
    stroke(colors[0][0], colors[0][1], colors[0][2]);
    rect(215, 630, 15, 15);
    noStroke();
    arc(100f, 600f, 160f, 160f, (2*PI*top5scale[0] + 2*PI*top5scale[1] + 2*PI*top5scale[2]), (2*PI*top5scale[0] + 2*PI*top5scale[1] + 2*PI*top5scale[2] + 2*PI*top5scale[3]), PIE);
    //5th highest
    fill(colors[4][0], colors[4][1], colors[4][2]);
    stroke(colors[0][0], colors[0][1], colors[0][2]);
    rect(215, 670, 15, 15);
    noStroke();
    arc(100f, 600f, 160f, 160f, (2*PI*top5scale[0] + 2*PI*top5scale[1] + 2*PI*top5scale[2] + 2*PI*top5scale[3]), (2*PI*top5scale[0] + 2*PI*top5scale[1] + 2*PI*top5scale[2] + 2*PI*top5scale[3] + 2*PI*top5scale[4]), PIE);
    //text
    fill(0, 0, 0);
    textFont(mono, 15);
    text(states[top5index[0]].toUpperCase() + " - " + unsortedData[top5index[0]], 245, 523);
    text(states[top5index[1]].toUpperCase() + " - " + unsortedData[top5index[1]], 245, 563);
    text(states[top5index[2]].toUpperCase() + " - " + unsortedData[top5index[2]], 245, 603);
    text(states[top5index[3]].toUpperCase() + " - " + unsortedData[top5index[3]], 245, 643);
    text(states[top5index[4]].toUpperCase() + " - " + unsortedData[top5index[4]], 245, 683);
  }
  
  void pickColors(int number) {
    switch (number) {
      case 0:
        colors = new int [][]{{250, 0, 0}, {250, 25, 25}, {250, 50, 50}, {250, 75, 75}, {250, 100, 100}};
        break;
      case 1:
        colors = new int [][]{{0, 0, 250}, {30, 30, 250}, {60, 60, 250}, {90, 90, 250}, {120, 120, 250}};
        break;
      case 2:
        colors = new int [][]{{0, 200, 0}, {40, 200, 40}, {80, 200, 80}, {120, 200, 120}, {160, 200, 160}};
        break;
      case 3:
        colors = new int [][]{{250, 180, 0}, {250, 185, 50}, {250, 190, 100}, {250, 195, 150}, {250, 200, 200}};
        break;
    }
  }

  void organizeData(int[] pI) {
    int[] temp = sort(pI);
    highest = temp[temp.length-1];
    index = search(unsortedData, highest);
    //fix...
    top5index[0] = index;
    top5index[1] = search(unsortedData, temp[temp.length-2]);
    top5index[2] = search(unsortedData, temp[temp.length-3]);
    top5index[3] = search(unsortedData, temp[temp.length-4]);
    top5index[4] = search(unsortedData, temp[temp.length-5]);
    sumTop5 = temp[temp.length-1] + temp[temp.length-2] + temp[temp.length-3] + temp[temp.length-4] + temp[temp.length-5];
    if (sumTop5 == 0) {
      sumTop5 = 1;
    }
    top5scale[0] = ((float)temp[temp.length-1])/sumTop5;
    top5scale[1] = ((float)temp[temp.length-2])/sumTop5;
    top5scale[2] = ((float)temp[temp.length-3])/sumTop5;
    top5scale[3] = ((float)temp[temp.length-4])/sumTop5;
    top5scale[4] = ((float)temp[temp.length-5])/sumTop5;
}

  int[] sort(int[] array) {
    int[] returnArray = new int[array.length];
    for (int f = 0; f < array.length; f++) {
      returnArray[f] = array[f];
    }
    boolean sort = false;
    while (!sort) {
      sort = true;
      for (int i = 0; i < returnArray.length - 1; i++) {
        if (!(returnArray[i+1] >= returnArray[i])) {
          int tempHolder = returnArray[i];
          returnArray[i] = returnArray[i+1];
          returnArray[i+1] = tempHolder;
          sort = false;
        }
      }
    }
    return returnArray;
  }
  
  int search(int[] nums, int value) {
    int location = -1;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == value) {
        location = i;
      }
    }
    return location;
  }
}
