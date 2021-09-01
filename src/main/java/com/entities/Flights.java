package com.entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Flights {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int fId;
    private String fName;
    private int fQuantity;
    private String fromLocation;
    private String toLocation;
    private Date fDate;
    private int fPrice;
    @ManyToOne
    private Airlines airlines;

    public Flights(int fId, String fName, int fQuantity, String fromLocation, String toLocation, Date fDate, int fPrice, Airlines airlines) {
        this.fId = fId;
        this.fName = fName;
        this.fQuantity = fQuantity;
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.fDate = fDate;
        this.fPrice = fPrice;
        this.airlines = airlines;
    }

    public Flights(String fName, int fQuantity, String fromLocation, String toLocation, Date fDate, int fPrice, Airlines airlines) {
        this.fName = fName;
        this.fQuantity = fQuantity;
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.fDate = fDate;
        this.fPrice = fPrice;
        this.airlines = airlines;
    }

    public Flights() {
    }

    public int getfId() {
        return fId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public int getfQuantity() {
        return fQuantity;
    }

    public void setfQuantity(int fQuantity) {
        this.fQuantity = fQuantity;
    }

    public String getFromLocation() {
        return fromLocation;
    }

    public void setFromLocation(String fromLocation) {
        this.fromLocation = fromLocation;
    }

    public String getToLocation() {
        return toLocation;
    }

    public void setToLocation(String toLocation) {
        this.toLocation = toLocation;
    }

    public Date getfDate() {
        return fDate;
    }

    public void setfDate(Date fDate) {
        this.fDate = fDate;
    }

    public int getfPrice() {
        return fPrice;
    }

    public void setfPrice(int fPrice) {
        this.fPrice = fPrice;
    }

    public Airlines getAirlines() {
        return airlines;
    }

    public void setAirlines(Airlines airlines) {
        this.airlines = airlines;
    }

    @Override
    public String toString() {
        return "Flights{" + "fId=" + fId + ", fName=" + fName + ", fQuantity=" + fQuantity + ", fromLocation=" + fromLocation + ", toLocation=" + toLocation + ", fDate=" + fDate + ", fPrice=" + fPrice + ", airlines=" + airlines + '}';
    }

}
