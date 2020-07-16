import java.net.URL;
import java.net.HttpURLConnection;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.io.IOException;

void covidStats() {
  final Gson gson = new Gson();
  try {
    String requestURL = "curl --location --request GET 'https://api.covid19api.com/country/united-states/status/confirmed/live'";
    URL url = new URL(requestURL);
    HttpURLConnection con = (HttpURLConnection) url.openConnection();
    con.setRequestMethod("GET");
    JsonReader repoReader = Json.createReader(con.getInputStream());
    JsonObject userJSON = ((JsonObject) repoReader.read());
    con.disconnect();
    
    MapRequest request = gson.fromJson(userJSON.toString(), MapRequest.class);
    
    request.getData().getCountryCode();
    
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
