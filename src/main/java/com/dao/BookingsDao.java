package com.dao;

import com.entities.Bookings;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class BookingsDao {

    private SessionFactory factory;

    public BookingsDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Save Booking Data to DB
    public boolean saveBookings(Bookings bookings) {

        boolean f = false;
        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(bookings);
            tx.commit();

            s.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }

    // Fetching booking data by user id
    public List<Bookings> getBookingsByUid(int uid) {
        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Bookings as b where b.user.userId=:id");
        query.setParameter("id", uid);
        List<Bookings> list = query.list();

        return list;
    }

    // Fetching All Booking Data 
    public List<Bookings> getAllBookings() {

        Session openSession = this.factory.openSession();
        Query query = openSession.createQuery("from Bookings");

        List<Bookings> list = query.list();
        return list;
    }
}
