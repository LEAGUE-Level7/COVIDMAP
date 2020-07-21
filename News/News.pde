import java.net.*;
import java.io.*;
//02080297f046477fb6ca1181fab28e51
void setup() {
  URL url;

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

    println(siteContents);
    
  } 
  catch (MalformedURLException e) {
    e.printStackTrace();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
