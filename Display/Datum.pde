import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Datum {

  @SerializedName("date")
    @Expose
    private Integer date;
  @SerializedName("state")
    @Expose
    private String state;
  @SerializedName("positive")
    @Expose
    private Integer positive;
  @SerializedName("negative")
    @Expose
    private Integer negative;
  @SerializedName("pending")
    @Expose
    private Object pending;
  @SerializedName("hospitalizedCurrently")
    @Expose
    private Integer hospitalizedCurrently;
  @SerializedName("hospitalizedCumulative")
    @Expose
    private Object hospitalizedCumulative;
  @SerializedName("inIcuCurrently")
    @Expose
    private Integer inIcuCurrently;
  @SerializedName("inIcuCumulative")
    @Expose
    private Object inIcuCumulative;
  @SerializedName("onVentilatorCurrently")
    @Expose
    private Object onVentilatorCurrently;
  @SerializedName("onVentilatorCumulative")
    @Expose
    private Object onVentilatorCumulative;
  @SerializedName("recovered")
    @Expose
    private Object recovered;
  @SerializedName("dataQualityGrade")
    @Expose
    private String dataQualityGrade;
  @SerializedName("lastUpdateEt")
    @Expose
    private String lastUpdateEt;
  @SerializedName("dateModified")
    @Expose
    private String dateModified;
  @SerializedName("checkTimeEt")
    @Expose
    private String checkTimeEt;
  @SerializedName("death")
    @Expose
    private Integer death;
  @SerializedName("hospitalized")
    @Expose
    private Object hospitalized;
  @SerializedName("dateChecked")
    @Expose
    private String dateChecked;
  @SerializedName("totalTestsViral")
    @Expose
    private Integer totalTestsViral;
  @SerializedName("positiveTestsViral")
    @Expose
    private Object positiveTestsViral;
  @SerializedName("negativeTestsViral")
    @Expose
    private Object negativeTestsViral;
  @SerializedName("positiveCasesViral")
    @Expose
    private Integer positiveCasesViral;
  @SerializedName("deathConfirmed")
    @Expose
    private Object deathConfirmed;
  @SerializedName("deathProbable")
    @Expose
    private Object deathProbable;
  @SerializedName("fips")
    @Expose
    private String fips;
  @SerializedName("positiveIncrease")
    @Expose
    private Integer positiveIncrease;
  @SerializedName("negativeIncrease")
    @Expose
    private Integer negativeIncrease;
  @SerializedName("total")
    @Expose
    private Integer total;
  @SerializedName("totalTestResults")
    @Expose
    private Integer totalTestResults;
  @SerializedName("totalTestResultsIncrease")
    @Expose
    private Integer totalTestResultsIncrease;
  @SerializedName("posNeg")
    @Expose
    private Integer posNeg;
  @SerializedName("deathIncrease")
    @Expose
    private Integer deathIncrease;
  @SerializedName("hospitalizedIncrease")
    @Expose
    private Integer hospitalizedIncrease;
  @SerializedName("hash")
    @Expose
    private String hash;
  @SerializedName("commercialScore")
    @Expose
    private Integer commercialScore;
  @SerializedName("negativeRegularScore")
    @Expose
    private Integer negativeRegularScore;
  @SerializedName("negativeScore")
    @Expose
    private Integer negativeScore;
  @SerializedName("positiveScore")
    @Expose
    private Integer positiveScore;
  @SerializedName("score")
    @Expose
    private Integer score;
  @SerializedName("grade")
    @Expose
    private String grade;

  public Integer getDate() {
    return date;
  }

  public void setDate(Integer date) {
    this.date = date;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public Integer getPositive() {
    System.out.println("pk is bae");
    return positive;
  }

  public void setPositive(Integer positive) {
    this.positive = positive;
  }

  public Integer getNegative() {
    return negative;
  }

  public void setNegative(Integer negative) {
    this.negative = negative;
  }

  public Object getPending() {
    return pending;
  }

  public void setPending(Object pending) {
    this.pending = pending;
  }

  public Integer getHospitalizedCurrently() {
    return hospitalizedCurrently;
  }

  public void setHospitalizedCurrently(Integer hospitalizedCurrently) {
    this.hospitalizedCurrently = hospitalizedCurrently;
  }

  public Object getHospitalizedCumulative() {
    return hospitalizedCumulative;
  }

  public void setHospitalizedCumulative(Object hospitalizedCumulative) {
    this.hospitalizedCumulative = hospitalizedCumulative;
  }

  public Integer getInIcuCurrently() {
    return inIcuCurrently;
  }

  public void setInIcuCurrently(Integer inIcuCurrently) {
    this.inIcuCurrently = inIcuCurrently;
  }

  public Object getInIcuCumulative() {
    return inIcuCumulative;
  }

  public void setInIcuCumulative(Object inIcuCumulative) {
    this.inIcuCumulative = inIcuCumulative;
  }

  public Object getOnVentilatorCurrently() {
    return onVentilatorCurrently;
  }

  public void setOnVentilatorCurrently(Object onVentilatorCurrently) {
    this.onVentilatorCurrently = onVentilatorCurrently;
  }

  public Object getOnVentilatorCumulative() {
    return onVentilatorCumulative;
  }

  public void setOnVentilatorCumulative(Object onVentilatorCumulative) {
    this.onVentilatorCumulative = onVentilatorCumulative;
  }

  public Object getRecovered() {
    return recovered;
  }

  public void setRecovered(Object recovered) {
    this.recovered = recovered;
  }

  public String getDataQualityGrade() {
    return dataQualityGrade;
  }

  public void setDataQualityGrade(String dataQualityGrade) {
    this.dataQualityGrade = dataQualityGrade;
  }

  public String getLastUpdateEt() {
    return lastUpdateEt;
  }

  public void setLastUpdateEt(String lastUpdateEt) {
    this.lastUpdateEt = lastUpdateEt;
  }

  public String getDateModified() {
    return dateModified;
  }

  public void setDateModified(String dateModified) {
    this.dateModified = dateModified;
  }

  public String getCheckTimeEt() {
    return checkTimeEt;
  }

  public void setCheckTimeEt(String checkTimeEt) {
    this.checkTimeEt = checkTimeEt;
  }

  public Integer getDeath() {
    return death;
  }

  public void setDeath(Integer death) {
    this.death = death;
  }

  public Object getHospitalized() {
    return hospitalized;
  }

  public void setHospitalized(Object hospitalized) {
    this.hospitalized = hospitalized;
  }

  public String getDateChecked() {
    return dateChecked;
  }

  public void setDateChecked(String dateChecked) {
    this.dateChecked = dateChecked;
  }

  public Integer getTotalTestsViral() {
    return totalTestsViral;
  }

  public void setTotalTestsViral(Integer totalTestsViral) {
    this.totalTestsViral = totalTestsViral;
  }

  public Object getPositiveTestsViral() {
    return positiveTestsViral;
  }

  public void setPositiveTestsViral(Object positiveTestsViral) {
    this.positiveTestsViral = positiveTestsViral;
  }

  public Object getNegativeTestsViral() {
    return negativeTestsViral;
  }

  public void setNegativeTestsViral(Object negativeTestsViral) {
    this.negativeTestsViral = negativeTestsViral;
  }

  public Integer getPositiveCasesViral() {
    return positiveCasesViral;
  }

  public void setPositiveCasesViral(Integer positiveCasesViral) {
    this.positiveCasesViral = positiveCasesViral;
  }

  public Object getDeathConfirmed() {
    return deathConfirmed;
  }

  public void setDeathConfirmed(Object deathConfirmed) {
    this.deathConfirmed = deathConfirmed;
  }

  public Object getDeathProbable() {
    return deathProbable;
  }

  public void setDeathProbable(Object deathProbable) {
    this.deathProbable = deathProbable;
  }

  public String getFips() {
    return fips;
  }

  public void setFips(String fips) {
    this.fips = fips;
  }

  public Integer getPositiveIncrease() {
    return positiveIncrease;
  }

  public void setPositiveIncrease(Integer positiveIncrease) {
    this.positiveIncrease = positiveIncrease;
  }

  public Integer getNegativeIncrease() {
    return negativeIncrease;
  }

  public void setNegativeIncrease(Integer negativeIncrease) {
    this.negativeIncrease = negativeIncrease;
  }

  public Integer getTotal() {
    return total;
  }

  public void setTotal(Integer total) {
    this.total = total;
  }

  public Integer getTotalTestResults() {
    return totalTestResults;
  }

  public void setTotalTestResults(Integer totalTestResults) {
    this.totalTestResults = totalTestResults;
  }

  public Integer getTotalTestResultsIncrease() {
    return totalTestResultsIncrease;
  }

  public void setTotalTestResultsIncrease(Integer totalTestResultsIncrease) {
    this.totalTestResultsIncrease = totalTestResultsIncrease;
  }

  public Integer getPosNeg() {
    return posNeg;
  }

  public void setPosNeg(Integer posNeg) {
    this.posNeg = posNeg;
  }

  public Integer getDeathIncrease() {
    return deathIncrease;
  }

  public void setDeathIncrease(Integer deathIncrease) {
    this.deathIncrease = deathIncrease;
  }

  public Integer getHospitalizedIncrease() {
    return hospitalizedIncrease;
  }

  public void setHospitalizedIncrease(Integer hospitalizedIncrease) {
    this.hospitalizedIncrease = hospitalizedIncrease;
  }

  public String getHash() {
    return hash;
  }

  public void setHash(String hash) {
    this.hash = hash;
  }

  public Integer getCommercialScore() {
    return commercialScore;
  }

  public void setCommercialScore(Integer commercialScore) {
    this.commercialScore = commercialScore;
  }

  public Integer getNegativeRegularScore() {
    return negativeRegularScore;
  }

  public void setNegativeRegularScore(Integer negativeRegularScore) {
    this.negativeRegularScore = negativeRegularScore;
  }

  public Integer getNegativeScore() {
    return negativeScore;
  }

  public void setNegativeScore(Integer negativeScore) {
    this.negativeScore = negativeScore;
  }

  public Integer getPositiveScore() {
    return positiveScore;
  }

  public void setPositiveScore(Integer positiveScore) {
    this.positiveScore = positiveScore;
  }

  public Integer getScore() {
    return score;
  }

  public void setScore(Integer score) {
    this.score = score;
  }

  public String getGrade() {
    return grade;
  }

  public void setGrade(String grade) {
    this.grade = grade;
  }
}
