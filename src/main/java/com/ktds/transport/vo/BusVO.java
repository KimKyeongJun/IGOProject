package com.ktds.transport.vo;

public class BusVO {

	private String busId;
	private String lineId;
	private String busName;
	private int num;
	private String sectionId;
	private String busstopId;
	private String busstopName;
	private String latitude;
	private String longitude;

	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

	public String getLineId() {
		return lineId;
	}

	public void setLineId(String lineId) {
		this.lineId = lineId;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSectionId() {
		return sectionId;
	}

	public void setSectionId(String sectionId) {
		this.sectionId = sectionId;
	}

	public String getBusstopId() {
		return busstopId;
	}

	public void setBusstopId(String busstopId) {
		this.busstopId = busstopId;
	}

	public String getBusstopName() {
		return busstopName;
	}

	public void setBusstopName(String busstopName) {
		this.busstopName = busstopName;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "BusVO [busId=" + busId + ", lineId=" + lineId + ", busName=" + busName + ", num=" + num + ", sectionId="
				+ sectionId + ", busstopId=" + busstopId + ", busstopName=" + busstopName + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}

}
