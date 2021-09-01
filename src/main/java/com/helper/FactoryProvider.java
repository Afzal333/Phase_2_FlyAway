
package com.helper;

import org.hibernate.SessionFactory;


import org.hibernate.cfg.Configuration;

// For Getting SessionFactory

public class FactoryProvider {
    private static SessionFactory factory;
    public static SessionFactory getFactory(){
        try {
            
            //singleton design pattern
            if(factory==null){
           factory= new Configuration().configure().buildSessionFactory();}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factory;
    }
}
