

public class Graph {
  int[] positiveIncreases = new int[50];
  String[] states = new String[50];
  int[] sortedData = new int[50];
  String[] sortedStates = new String[50];
  
  void initialize() {
    Map map = new Map();
    this.positiveIncreases = map.positiveIncreases;
    this.states = map.states;
  }
  
  void display() {
    organizeData();
    line(50, 525, 50, 650);
    for (int i = 0; i < 5; i++) {
      text("50", 25, 510 + 28*(i+1));
    }
  }
  
  void organizeData() {
    sortedData = sort(positiveIncreases);
    System.out.println("yikes");
    for (int i: sortedData) {
      System.out.println(i);
    }
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
