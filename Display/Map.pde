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
  String[] states = {"al", "ak", "az", "ar", "ca", "co", "ct", "de", "fl", 
    "ga", "hi", "id", "il", "in", "ia", "ks", "ky", "la", "me", "md", "ma", 
    "mi", "mn", "ms", "mo", "mt", "ne", "nv", "nh", "nj", "nm", "ny", "nc", 
    "nd", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "vt", 
    "va", "wa", "wv", "wi", "wy"};

  void pullAllStates() {
    String[] stringJsonData = new String[50];
    for (int i = 0; i < states.length; i++) {
      JsonObject userJSON = pullState(states[i]);

      Datum request = gson.fromJson(userJSON.toString(), Datum.class);
      data[i] = request;
      jsonData[i] = userJSON;
      System.out.print(i);
      //System.out.println(positiveIncreases[i]);
      stringJsonData[i] = jsonData[i].toString();
    }
    saveStrings("data.txt", stringJsonData);
  }

  JsonObject pullState(String state) {
    try {
      String requestURL = "https://covidtracking.com/api/v1/states/" + state + "/current.json";
      // System.out.println(requestURL);
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
  int[] checkSavedData() {
    Datum savedData;
    Datum apiData;
    String savedJSON;
    JsonObject apiJSON;
    boolean indexAtComma = false;
    int commaIndex = 0;

    apiJSON = pullState("al");
    savedJSON = loadState();

    apiData = gson.fromJson(apiJSON.toString(), Datum.class);
    savedData = gson.fromJson(savedJSON.toString(), Datum.class);

    if (!apiData.getDate().equals(savedData.getDate())) {
      pullAllStates();
    } else {
      int positiveIndex = 0;
      for (String c : lines) {
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
              System.out.println(positiveIncreases[positiveIndex]);
              positiveIndex++;
            }
          }
        }
      }
    }

    return positiveIncreases;
  }
}
