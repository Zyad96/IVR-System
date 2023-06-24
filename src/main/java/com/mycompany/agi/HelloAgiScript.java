package com.mycompany.agi;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author aisha
 */
import org.asteriskjava.fastagi.*;
public class HelloAgiScript extends BaseAgiScript
{    
    public void service(AgiRequest request, AgiChannel channel)
            throws AgiException
    {
        // Answer the channel...
        answer();
        // ...say hello...
        streamFile("welcome");
        streamFile("tt-monkeys");
        // ...and hangup.
        hangup();      
        
//         String rating = request.getParameter("rating");
//    // Perform actions based on the rating value (e.g., store in a database, play a thank you message, etc.)
//    streamFile("demo-thanks");
//    }        
    }
}