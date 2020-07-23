import java.net.*;
import java.io.*;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.io.IOException;

public class News {
  public NewsDatum fetchTopNews() {
    URL url;
    final Gson gson = new Gson();
    try {
      String a="http://newsapi.org/v2/top-headlines?q=Covid-19&country=us&sortBy=popularity&apiKey=02080297f046477fb6ca1181fab28e51";
      url = new URL(a);
      URLConnection conn = url.openConnection();

      BufferedReader br = new BufferedReader(
        new InputStreamReader(conn.getInputStream()));

      String siteContents = "";
      String inputLine = br.readLine();
      while (inputLine != null) {
        siteContents += inputLine;
        inputLine = br.readLine();
      }
      br.close();
      siteContents = siteContents.trim();
      NewsDatum request = gson.fromJson(siteContents, NewsDatum.class);
      return request;
    } 
    catch (MalformedURLException e) {
      e.printStackTrace();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
    return null;
  }
}
