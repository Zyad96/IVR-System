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
                  streamFile("added");

    char digit = ac.waitForDigit(5000); // Wait for a digit input for 5 seconds
System.out.println(digit);
int rate = Character.getNumericValue(digit);  
        System.out.println(rate);
        if (rate >= parsevxml().size() && rate != parsevxml().size() + 1) {
            System.out.println("select other number");
            
        } else if (rate <= parsevxml().size()) {

            System.out.println(parsevxml().get(rate-1));
            streamFile(parsevxml().get(rate-1)); 
                             ac.getData("",5000);

        } else if (rate == parsevxml().size() + 1) {
            System.out.println("call will recorded");
             LocalDateTime currentTime = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
    String formattedDateTime = currentTime.format(formatter);
    
    String fileName = "record_" + formattedDateTime ;  //The path of the record is /var/lib/asterisk/sounds
    
    ac.recordFile(fileName, "wav", "#", 30000);
            
        } else {
            System.out.println("error");
        }

    }

    public ArrayList<String> parsevxml() {
        sourceaudio = new ArrayList<String>();
        try {
            // Load the VXML file
            Document doc = (Document) Jsoup.parse(new File("/var/lib/asterisk/agi-bin/test2.vxml"), "UTF-8");
//            System.out.println("hello vxml");
            // Parse the VXML elements
            Elements prompts = doc.getElementsByTag("prompt");
//                    
//            doc.select("assign");
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


}
