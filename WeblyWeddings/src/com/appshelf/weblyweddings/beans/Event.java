package com.appshelf.weblyweddings.beans;

import java.sql.Timestamp;

public class Event {
	private String eventName;
	private Timestamp eventDateTime;
	private String venue;
	
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Timestamp getEventDateTime() {
		return eventDateTime;
	}
	public void setEventDateTime(Timestamp eventDateTime) {
		this.eventDateTime = eventDateTime;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
}
