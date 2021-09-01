package com.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Airlines {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int airlinesId;
    private String airlinesTitle;
    @OneToMany(mappedBy = "airlines")
    private List<Flights> flights = new ArrayList<>();

    public Airlines(int airlinesId, String airlinesTitle) {
        this.airlinesId = airlinesId;
        this.airlinesTitle = airlinesTitle;
    }

    public Airlines() {
    }

    public Airlines(String airlinesTitle, List<Flights> flights) {
        this.airlinesTitle = airlinesTitle;
        this.flights = flights;
    }

    public int getAirlinesId() {
        return airlinesId;
    }

    public void setAirlinesId(int airlinesId) {
        this.airlinesId = airlinesId;
    }

    public String getAirlinesTitle() {
        return airlinesTitle;
    }

    public void setAirlinesTitle(String airlinesTitle) {
        this.airlinesTitle = airlinesTitle;
    }

    public List<Flights> getFlights() {
        return flights;
    }

    public void setFlights(List<Flights> flights) {
        this.flights = flights;
    }

    @Override
    public String toString() {
        return "Airlines{" + "airlinesId=" + airlinesId + ", airlinesTitle=" + airlinesTitle + ", flights=" + flights + '}';
    }

}
