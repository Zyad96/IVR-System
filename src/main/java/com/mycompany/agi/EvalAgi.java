/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.agi;

import org.asteriskjava.fastagi.*;

/**
 *
 * @author aisha
 */
public class EvalAgi extends BaseAgiScript{
    
        
  public void service(AgiRequest request, AgiChannel channel) throws AgiException
    {
    String rating = request.getParameter("rating");
    // Perform actions based on the rating value (e.g., store in a database, play a thank you message, etc.)
    streamFile("demo-thanks");
    } 
}
