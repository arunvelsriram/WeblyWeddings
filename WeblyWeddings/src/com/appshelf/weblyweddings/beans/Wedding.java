package com.appshelf.weblyweddings.beans;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Wedding {
	private String weddingName;
	private String bride;
	private String brideGroom;
	private Timestamp dateTime;
	private String venue;
	private ArrayList<Photo> photos = new ArrayList<>();
	private ArrayList<Event> events = new ArrayList<>();
	
	public ArrayList<Event> getEvents() {
		return events;
	}

	public void setEvents(ArrayList<Event> events) {
		this.events = events;
	}
	public ArrayList<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(ArrayList<Photo> photos) {
		this.photos = photos;
	}
	
	public String getWeddingName() {
		return weddingName;
	}
	public void setWeddingName(String weddingName) {
		this.weddingName = weddingName;
	}
	public String getBride() {
		return bride;
	}
	public void setBride(String bride) {
		this.bride = bride;
	}
	public String getBrideGroom() {
		return brideGroom;
	}
	public void setBrideGroom(String brideGroom) {
		this.brideGroom = brideGroom;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
}
