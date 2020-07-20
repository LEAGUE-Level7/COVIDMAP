import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class MapRequest {

  @SerializedName("data")
    @Expose
    private Datum data = null;

  public Datum getData() {
    return data;
  }

  public void setData(Datum data) {
    this.data = data;
  }
}
