
public class Graph {
  Map map = new Map();
  int[] unsortedData = new int[50];
  String[] states = new String[50];
  int index = 0;
  int highest = 1;
  int rectY = 0;
  int rectHeight = 0;
  PFont mono;
  int[] top5index = new int[5];

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
    System.out.println(top5index[0] + ", " + top5index[1] + ", " + top5index[2] + ", " + top5index[3] + ", " + top5index[4]);
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
