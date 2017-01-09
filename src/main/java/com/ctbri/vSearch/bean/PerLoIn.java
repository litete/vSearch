package com.ctbri.vSearch.bean;

/**
 * Created by lite on 2017/1/8.
 * person  location  institution
 */
public class PerLoIn {
    private String person;
    private String location;
    private String institution;
    private String tech;



    public String getTechnology() {
        return tech;
    }

    public void setTechnology(String tech) {
        this.tech = tech;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }
}
