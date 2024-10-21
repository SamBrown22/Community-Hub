package com.group22.hub.Model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "event")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "User_ID")
    private User organiser;
    //maybe try and format these a little more
    private String title;
    private String description;
    private long date;
    private String location;


    //this is used for the inpput field in the JSP transient should prevent it being put in database
    @Transient
    private String stringDate;
    //this is to make inputting times easier for user
    @Transient
    private  String stringTime;


    public int getId() {
        return id;
    }



    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateTime() {
        Date d = new Date(getDate());
        return d;
    }
    public long getDate() {
        return date;
    }
    public void setDate(long date) {
        this.date = date;
    }


    public User getOrganiser() {
        return organiser;
    }
    public void setOrganiser(User organiser) {
        this.organiser = organiser;
    }


    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }


    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }


    public String getStringDate() {
        return stringDate;
    }
    public void setStringDate(String stringDate) {
        this.stringDate = stringDate;
    }


    public String getStringTime() {
        return stringTime;
    }
    public void setStringTime(String stringTime) {
        this.stringTime = stringTime;
    }
}
