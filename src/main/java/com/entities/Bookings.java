package com.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Bookings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bId;
    private String pName;
    private String pGender;
    private String pContact;
    private String pPaymentMode;
    private String fName;
    @ManyToOne

    private User user;

    public Bookings(String pName, String pGender, String pContact, String pPaymentMode, String fName, User user) {
        this.pName = pName;
        this.pGender = pGender;
        this.pContact = pContact;
        this.pPaymentMode = pPaymentMode;
        this.fName = fName;
        this.user = user;
    }

    public Bookings(int bId, String pName, String pGender, String pContact, String pPaymentMode, String fName, User user) {
        this.bId = bId;
        this.pName = pName;
        this.pGender = pGender;
        this.pContact = pContact;
        this.pPaymentMode = pPaymentMode;
        this.fName = fName;
        this.user = user;
    }

    public Bookings() {
    }

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpGender() {
        return pGender;
    }

    public void setpGender(String pGender) {
        this.pGender = pGender;
    }

    public String getpContact() {
        return pContact;
    }

    public void setpContact(String pContact) {
        this.pContact = pContact;
    }

    public String getpPaymentMode() {
        return pPaymentMode;
    }

    public void setpPaymentMode(String pPaymentMode) {
        this.pPaymentMode = pPaymentMode;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    @Override
    public String toString() {
        return "Bookings{" + "bId=" + bId + ", pName=" + pName + ", pGender=" + pGender + ", pContact=" + pContact + ", fName=" + fName + ", user=" + user + ", user=" + user + '}';
    }

}
