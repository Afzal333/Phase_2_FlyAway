package com.dao;

import com.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // For User Validation
    
    public User getUserByEmailAndPasswor(String email, String password) {

        User user = null;
        try {

            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);

            user = (User) q.uniqueResult();

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    // Saving User to DB

    public boolean saveUser(User user) {

        boolean f = false;
        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();
            s.save(user);
            tx.commit();

            s.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }

        return f;
    }
}
