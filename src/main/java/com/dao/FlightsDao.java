package com.dao;

import com.entities.Flights;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class FlightsDao {

    private SessionFactory factory;

    public FlightsDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Saving Flight Data to DB
    public boolean saveFlights(Flights flights) {

        boolean f = false;
        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(flights);
            tx.commit();

            s.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }

    // Fetching Flight Data As per Search Bar, Custom Input
    public List<Flights> getFlightsByData(String fromLocation, String toLocation, Date fDate, int fQuantity) {

        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Flights where fromLocation=?1 and toLocation=?2 and fDate=?3 and fQuantity>?4");
        query.setParameter(1, fromLocation);
        query.setParameter(2, toLocation);
        query.setParameter(3, fDate);
        query.setParameter(4, fQuantity);

        List<Flights> list = query.list();
        return list;

    }
    // Fetching All Flights Data

    public List<Flights> getAllFlights() {

        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Flights");

        List<Flights> list = query.list();
        return list;
    }

    // Fetching Flight data By Airline ID
    public List<Flights> getFlightById(int aid) {
        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Flights as f where f.airlines.airlinesId=:id");
        query.setParameter("id", aid);
        List<Flights> list = query.list();

        return list;
    }

    // Fetching Flight Data by Flight ID
    public List<Flights> getFlightByFId(int fid) {
        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Flights where fId=:id");
        query.setParameter("id", fid);
        List<Flights> list = query.list();

        return list;
    }
}
