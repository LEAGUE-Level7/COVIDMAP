
public class Graph {
  Map map = new Map();
  int[] positiveIncreases = new int[50];
  String[] states = new String[50];
  int[] sortedData = new int[50];
  String[] sortedStates = new String[50];
  PFont mono;
  
  void initialize(int[] pI) {
    this.positiveIncreases = pI;
    this.states = map.states;
    mono = loadFont("Consolas-48.vlw");
  }
  
  void display() {
    for (int i: positiveIncreases) {
      System.out.println(i);
    }
    strokeWeight(2);
    fill(0, 0, 0);
    //line(50, 525, 50, 650);
    line(5, 650, 815, 650);
    //old vertical axis...
    /*textSize(15);
    textAlign(RIGHT);
    for (int i = 0; i < 5; i++) {
      text(Integer.toString(200 - 50*i), 40, 510 + 28*(i+1));
    }
    */
    textAlign(CENTER);
    textFont(mono, 12);
    for (int i = 0; i < 50; i++) {
      text(states[i].toUpperCase(), 12 + 16.25*i, 670);
      rect((10 + (16.25*i)), (650 - (positiveIncreases[i]*0.0125)), 5, (positiveIncreases[i]*0.0125));
    }
  }
  
  void organizeData() { //also need to sort the states (technically)
    sortedData = sort(positiveIncreases);
  }
  
  int[] sort(int[] array) {
    int[] returnArray = new int[array.length];
    boolean sort = false;
    while(!sort) {
      sort = true;
      for (int i = 0; i < array.length - 1; i++) {
        if (!(array[i+1] >= array[i])) {
          int tempHolder = array[i];
          array[i] = array[i+1];
          array[i+1] = tempHolder;
          sort = false;
        }
      }
    }
    returnArray = array;
    return returnArray;
  }
}
