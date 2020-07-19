import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.io.IOException;

public class Map { 
  String[] jsonData = new String[50];
  int[] positiveIncreases = new int[50];
  final Gson gson = new Gson();
  String[] states = {"al", "ak", "az", "ar", "ca", "co", "ct", "de", "fl", 
    "ga", "hi", "id", "il", "in", "ia", "ks", "ky", "la", "me", "md", "ma", 
    "mi", "mn", "ms", "mo", "mt", "ne", "nv", "nh", "nj", "nm", "ny", "nc", 
    "nd", "oh", "ok", "or", "pa", "ri", "sc", "sd", "tn", "tx", "ut", "vt", 
    "va", "wa", "wv", "wi", "wy"};
  void covidStats() {
    try {
      for (int i = 0; i < states.length; i++) {
        String requestURL = "https://covidtracking.com/api/v1/states/" + states[i] + "/current.json";
        // System.out.println(requestURL);
        URL url = new URL(requestURL);
        HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        JsonReader repoReader = Json.createReader(con.getInputStream());
        JsonObject userJSON = ((JsonObject) repoReader.read());
        con.disconnect();

        Datum request = gson.fromJson(userJSON.toString(), Datum.class);
        //jsonData[i] = request.toString();
        positiveIncreases[i] = request.getPositiveIncrease();
        //System.out.println(positiveIncreases[i]);
      }
      //saveStrings("data.txt", jsonData);
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
  }
}
