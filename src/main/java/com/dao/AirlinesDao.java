package com.dao;

import com.entities.Airlines;


import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AirlinesDao {

    private SessionFactory factory;

    public AirlinesDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Save Airlines to DB
    public int saveAirlines(Airlines aline) {

        Session openSession = this.factory.openSession();
        Transaction tx = openSession.beginTransaction();
        int airlinesId = (int) openSession.save(aline);
        tx.commit();
        openSession.close();
        return airlinesId;

    }

    // Fetching all Airlines
    public List<Airlines> getAirlines() {
        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Airlines");
        List<Airlines> list = query.list();
        return list;

    }

    // Fetching Airlines data by Id
    public Airlines getAirlinesById(int airlinesId) {
        Airlines aline = null;
        try {
            Session s = this.factory.openSession();
            aline = s.get(Airlines.class, airlinesId);

        } catch (Exception e) {
        }
        return aline;
    }
}
