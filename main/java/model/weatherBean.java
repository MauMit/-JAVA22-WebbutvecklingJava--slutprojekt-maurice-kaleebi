package model;


public class weatherBean {

	private String cityStr;

	private String countryStr;

	private String cloudsStr;
	
	private String tempStr;
	
	private String timeStr;
	
	private String[] cityArr;
	
	private String[] countyArr;


	public weatherBean(String cityStr, String countryStr) {

		this.cityStr = cityStr;
		this.countryStr = countryStr;

	}

	public String getCityStr() {
		return cityStr;
	}

	public String getCountryStr() {
		return countryStr;
	}

	public String getCloudsStr() {
		return cloudsStr;
	}

	public void setCloudsStr(String cloudsStr) {
		this.cloudsStr = cloudsStr;
	}

	public String getTempStr() {
		return tempStr;
	}

	public void setTempStr(String tempStr) {
		this.tempStr = tempStr;
	}

	public String getTimeStr() {
		return timeStr;
	}

	public void setTimeStr(String timeStr) {
		this.timeStr = timeStr;
	}

	public String[] getcityArr() {
		return cityArr;
	}

	public void setcityArr(String[] cityArr) {
		this.cityArr = cityArr;
	}

	public String[] getCountyArr() {
		return countyArr;
	}

	public void setCountyArr(String[] countyArr) {
		this.countyArr = countyArr;
	}





}