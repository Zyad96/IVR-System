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
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author hp
 */
public class MyAgiScript extends BaseAgiScript{
//    public static void main(String[] args) {
//        try {
////            ArrayList <String> sourceaudio=new ArrayList <String>();
//            // Load the VXML file
//            Document doc = (Document) Jsoup.parse(new File("/var/lib/asterisk/agi-bin/test2.vxml"), "UTF-8");
//            System.out.println("hello vxml");
//            // Parse the VXML elements
//            Elements prompts = doc.getElementsByTag("prompt");
////                    doc.select("assign");
//            for (Element promptaudio : prompts) {
//                Elements audioElements = promptaudio.getElementsByTag("audio");
//                for (Element audio : audioElements) {
//                    String src = audio.attr("src");
//                    
////                    sourceaudio.add(src);
//                    System.out.println("Audio Source: " + src);
//                }
//            }
//
//            // Add more code here to parse other VXML elements as needed
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    @Override
    public void service(AgiRequest ar, AgiChannel ac) throws AgiException {  
        
        
         try {
//            ArrayList <String> sourceaudio=new ArrayList <String>();
            // Load the VXML file
            Document doc = (Document) Jsoup.parse(new File("/var/lib/asterisk/agi-bin/test2.vxml"), "UTF-8");
            System.out.println("hello vxml");
            // Parse the VXML elements
            Elements prompts = doc.getElementsByTag("prompt");
//                    doc.select("assign");
            for (Element promptaudio : prompts) {
                Elements audioElements = promptaudio.getElementsByTag("audio");
                for (Element audio : audioElements) {
                    String src = audio.attr("src");
                    
//                    sourceaudio.add(src);
                    System.out.println("Audio Source: " + src);
                    answer();
        // ...say hello...
       
        streamFile(src);
//        ac.waitForDigit()
//ac.sayAlpha("");
            ac.recordFile("/home/aisha/" , "wav", "0", 30000);

        // ...and hangup.
         
                }
            }

            // Add more code here to parse other VXML elements as needed

        } catch (IOException e) {
            e.printStackTrace();
        }
             
            
    
    }
    
}


