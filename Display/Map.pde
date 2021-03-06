import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.io.IOException;

public class Map { 
  JsonObject[] jsonData = new JsonObject[50];
  Datum[] data = new Datum[50];
  final Gson gson = new Gson();
  String[] lines = new String[50];
  int[] positiveIncreases = new int[50];
  int[] deathIncreases = new int[50];
  int[] hospitalized = new int[50];
  int[] recovered = new int[50];
  String[] states = {"al", "ak", "az", "ar", "ca", "co", "ct", "de", "fl", 
    "ga", "hi", "id", "il", "in", "ia", "ks", "ky", "la", "me", "md", "ma", 
    "mi", "mn", "ms", "mo", "mt", "ne", "nv", "nh", "nj", "nm", "ny", "nc", 
    "nd", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "vt", 
    "va", "wa", "wv", "wi", "wy"};
  void pullAllStates() {
    //text("Retrieving data...", 530, 350);
    String[] stringJsonData = new String[50];
    for (int i = 0; i < states.length; i++) {
      JsonObject userJSON = pullState(states[i]);

      Datum request = gson.fromJson(userJSON.toString(), Datum.class);
      data[i] = request;
      jsonData[i] = userJSON;
      stringJsonData[i] = jsonData[i].toString();
    }
    println(stringJsonData[0]);
    saveStrings("data1.txt", stringJsonData);
    lines = loadStrings("data1.txt");
  }

  JsonObject pullState(String state) {
    try {
      String requestURL;
      requestURL = "https://covidtracking.com/api/v1/states/" + state + "/current.json";
         
      URL url = new URL(requestURL);
      HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      JsonReader repoReader = Json.createReader(con.getInputStream());
      JsonObject userJSON = ((JsonObject) repoReader.read());
      con.disconnect();

      return userJSON;
    } 
    catch (MalformedURLException e) {
      e.printStackTrace();
    } 
    catch (ProtocolException e) {
      e.printStackTrace();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }

  String loadState() {
    lines = loadStrings("data.txt");

    return lines[0];
  }
  void checkSavedData() {
    Datum savedData;
    Datum apiData;
    String savedJSON;
    JsonObject apiJSON;

    apiJSON = pullState("al");
    savedJSON = loadState();

    apiData = gson.fromJson(apiJSON.toString(), Datum.class);
    savedData = gson.fromJson(savedJSON.toString(), Datum.class);
    try{
      if (!apiData.getDate().equals(savedData.getDate())) {
        pullAllStates();
      }
    } catch(NullPointerException e) {
       pullAllStates();
    }
  } 

  int[] positiveIncreaseMap(String[] inputLines) {
    boolean indexAtComma = false;
    int commaIndex = 0;
    int positiveIndex = 0;
    for (String c : inputLines) {
      if(c == null)
      {
        positiveIncreases[positiveIndex] = 0;
        positiveIndex++;
        continue;
      }
      for (int i = 0; i < c.length(); i++) {
        if (i <= c.length()-16) {
          if (c.substring(i, i+16).equals("positiveIncrease")) {
            commaIndex = i+17;
            while (!indexAtComma) {
              if (c.charAt(commaIndex) == ',') {
                break;
              }
              commaIndex++;
            }
            positiveIncreases[positiveIndex] = Integer.parseInt(c.substring(i+18, commaIndex));
            positiveIndex++;
          }
        }
      }

    }
    return positiveIncreases;
  }


  int[] deathIncreaseMap(String[] inputLines) {
    boolean indexAtComma = false;
    int commaIndex = 0;
    int positiveIndex = 0;

    for (String c : inputLines) {
        if(c == null)
      {
        deathIncreases[positiveIndex] = 0;
        positiveIndex++;
        continue;
      }
      for (int i = 0; i < c.length(); i++) {
        if (i <= c.length()-13) {
          if (c.substring(i, i+13).equals("deathIncrease")) {
            commaIndex = i+14;
            while (!indexAtComma) {
              if (c.charAt(commaIndex) == ',') {
                break;
              }
              commaIndex++;
            }
            deathIncreases[positiveIndex] = (Integer.parseInt(c.substring(i+15, commaIndex))) * 10;
            positiveIndex++;
          }
        }
      }
    }

    return deathIncreases;
  }

  int[] hospitalizedMap(String[] inputLines) {
    boolean indexAtComma = false;
    int commaIndex = 0;
    int positiveIndex = 0;

    for (String c : inputLines) {
        if(c == null)
      {
        hospitalized[positiveIndex] = 0;
        positiveIndex++;
        continue;
      }
      for (int i = 0; i < c.length(); i++) {
        if (i <= c.length()-21) {
          if (c.substring(i, i+21).equals("hospitalizedCurrently")) {
            commaIndex = i+22;
            while (!indexAtComma) {
              if (c.charAt(commaIndex) == ',') {
                break;
              }
              commaIndex++;
            }
            if (!c.substring(i+23, commaIndex).equals("null")) {
              hospitalized[positiveIndex] = Integer.parseInt(c.substring(i+23, commaIndex));
            } else {
              hospitalized[positiveIndex] = 0;
            }
            positiveIndex++;
          }
        }
      }
    }

    return hospitalized;
  }

  int[] recoveredMap(String[] inputLines) {
    boolean indexAtComma = false;
    int commaIndex = 0;
    int positiveIndex = 0;

    for (String c : inputLines) {
       if(c == null)
      {
        recovered[positiveIndex] = 0;
        positiveIndex++;
        continue;
      }
      for (int i = 0; i < c.length(); i++) {
        if (i <= c.length()-9) {
          if (c.substring(i, i+9).equals("recovered")) {
            commaIndex = i+10;
            while (!indexAtComma) {
              if (c.charAt(commaIndex) == ',') {
                break;
              }
              commaIndex++;
            }
            if (!c.substring(i+11, commaIndex).equals("null")) {
              recovered[positiveIndex] = (Integer.parseInt(c.substring(i+11, commaIndex)))/25;
            } else {
              recovered[positiveIndex] = 0;
            }
            positiveIndex++;
          }
        }
      }
    }
    return recovered;
  }
  
  String[] getData()
  {
    return lines;
  }
  
  String[] getStates()
  {
    return states;
  }
}
