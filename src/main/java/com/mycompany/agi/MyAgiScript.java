///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
package com.mycompany.agi;
//
///**
// *
// * @author aisha
// */

import org.asteriskjava.fastagi.*;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author hp
 */
public class MyAgiScript extends BaseAgiScript {

    ArrayList<String> sourceaudio;

    @Override
    public void service(AgiRequest ar, AgiChannel ac) throws AgiException {

        answer();
        String callerNumber = ac.getVariable("CALLERID(num)");
        System.out.println("Caller Number: " + callerNumber);


        while (true) {
            streamFile("first"); //Please enter 1 : 5 rate and 6 for record

            char digit = ac.waitForDigit(5000);
            System.out.println(digit);
            int rate = Character.getNumericValue(digit);
            System.out.println(rate);
            if (rate > (parsevxml().size() + 1)) {
                streamFile("enter_another");

            }
            if (rate<0 || rate ==0)
            {
                streamFile("enter_another");
            }

            if (rate <= parsevxml().size()) {
                System.out.println(parsevxml().get(rate - 1));
                ac.getData( "", 3000);
                streamFile(parsevxml().get(rate - 1));
                ac.getData("", 2000);
                streamFile("thankss"); //if record = 6 if no record = 0
                char rec = ac.waitForDigit(5000);
                System.out.println(rec);
                int recordFlag = Character.getNumericValue(rec);
                System.out.println(recordFlag);
                if (recordFlag == 6) {
                    System.out.println("recordingg");
                    streamFile("call_to_be_record");
                    LocalDateTime currentTime = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
                    String formattedDateTime = currentTime.format(formatter);

                    String filePath = "/home/aisha/NetBeansProjects/IVR1/records/";  // Specify the desired file path here
                    String fileName = filePath + "record_" + formattedDateTime;  // Append the file name to the file path
                    String filedb = "record_" + formattedDateTime;
                    ac.recordFile(fileName, "wav", "#", 30000);

                    inserttodatabase(callerNumber, rate, "/IVR1/records/" + filedb + ".wav");

                } else if (recordFlag == 0) {
                    inserttodatabase(callerNumber, rate, "null");

                }
                break;

            }

        }
        hangup();

    }

    public ArrayList<String> parsevxml() {
        sourceaudio = new ArrayList<String>();
        try {
            // Load the VXML file
            Document doc = (Document) Jsoup.parse(new File("/var/lib/asterisk/agi-bin/voice.vxml"), "UTF-8");

            Elements prompts = doc.getElementsByTag("prompt");

            for (Element promptaudio : prompts) {
                Elements audioElements = promptaudio.getElementsByTag("audio");
                for (Element audio : audioElements) {
                    String src = audio.attr("src");
                    sourceaudio.add(src);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
//        System.out.println(sourceaudio.size());
        return sourceaudio;
    }
    //playaudio

    public Connection getconnection() {
        Connection connect = null;
        try {
            DriverManager.registerDriver(new org.postgresql.Driver());
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/iti",
                    "postgres",
                    "139148");
            System.out.println("connected");

        } catch (Exception e) {
            System.out.println("connection faild");
            e.printStackTrace();
        }
        return connect;
    }


    
    public void inserttodatabase(String number, int rate, String path) {
        Connection con1 = getconnection();
        Statement st1, st2, st3;
        try {
            st1 = con1.createStatement();
            st2 = con1.createStatement();
            st3 = con1.createStatement();
            String check_user = "select * from ratetable where userid='" + number + "';";
            String sql_insert_into_ratetable = " insert into ratetable (userid , rate) values ('" + number + "'," + rate + ");";
            String sql_insertinto_rateurl = "insert into rateurl (userid ,url) values ('" + number + "','" + path + "');";
            boolean result_check_user = st3.execute(check_user);
            if (result_check_user) {
                System.out.println("user execist");
                int result2 = st2.executeUpdate(sql_insertinto_rateurl);
                if (result2 > 0) {
                    System.out.println("insert user recourd in database recourde table");
                } else {
                    System.out.println("error while insert into recourdes table");
                }
            } else {
                int result = st1.executeUpdate(sql_insert_into_ratetable);
                int result2 = st2.executeUpdate(sql_insertinto_rateurl);
                if (result > 0 && result2 > 0) {
                    System.out.println("success");
                } else {
                    System.out.println("failed");
                }
            }
            st1.close();
            con1.close();
        } catch (SQLException ex) {
            ex.getSQLState();
        }
    }

}


