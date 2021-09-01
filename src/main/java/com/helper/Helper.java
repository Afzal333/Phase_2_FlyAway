
package com.helper;

import java.text.SimpleDateFormat;

import java.util.Date;
//import java.util.HashMap;
//import java.util.Map;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.Query;

public class Helper {
    
    // For Getting Date User Friendly Style
    public static String getOnlyDate(Date date){
    
    
      SimpleDateFormat formatter= new SimpleDateFormat("dd MMMM yyyy");
        String format = formatter.format(date);
    return format;
    }
    }
