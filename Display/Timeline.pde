import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonArray;
import javax.json.JsonReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.io.IOException;
import java.util.*;


public class Timeline{
    boolean gettingData = false;
    final Gson gson = new Gson();
    int index = 0;
    JsonArray userJSON;
    
    HashMap data = new HashMap<Integer, String[]>();
    HashMap stateIndex = new HashMap<String, Integer>();
    int numDays; 
    Integer[] dateArray = new Integer[365];
 
    
    Timeline(String[] states) {
      for(int i = 0; i < states.length; i++) {
        stateIndex.put(states[i], i);
      }
    }
 

  void pullAllStatesAllDates(){
     JsonArray userJSON = pullData();
     gettingData = true;
     index = 0;
       
     while(true) {
       JsonObject tmp = userJSON.getJsonObject(index);
       Integer date = gson.fromJson(tmp.toString(), Datum.class).getDate();
       dateArray[numDays] = date;
       
       String[] dateData = new String[50];
       while(true) {
         JsonObject obj = userJSON.getJsonObject(index);
         Integer nextdate  = gson.fromJson(obj.toString(), Datum.class).getDate();
         String  state = gson.fromJson(obj.toString(), Datum.class).getState();
         
         if(!nextdate.equals(date))
           break;
         
         if(stateIndex.get(state) == null) {
           index++;
           if(index == userJSON.size()) {
             break;
           }
           continue;
         }
         else {
           dateData[(int)stateIndex.get(state)] = obj.toString();
           index++;
           if(index == userJSON.size()) {
             break;
           }
         }
        
       }
       data.put(date, dateData);
       numDays++;
       
       if(index == userJSON.size()) {
         break;
       }
     }
     gettingData = false;
     hasGottenData = true;
  }
     
  JsonArray pullData() {
    try {
      String requestURL;
          
          requestURL = "https://api.covidtracking.com/v1/states/daily.json";
      
      System.out.println(requestURL);
      URL url = new URL(requestURL);
      HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      JsonReader repoReader = Json.createReader(con.getInputStream());
      JsonArray userJSON = ((JsonArray) repoReader.readArray());
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
  
  String[] getData(int date) {
    return ((String[])data.get(date));
  }
  
  Integer getDate(int index) {
    return dateArray[index];
  }
  int getnumDays() {
    return numDays;
  }
}
