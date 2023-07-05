///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
package marytts;
//
///**
// *
// * @author aisha
// */
//
//
//
//
//import marytts.LocalMaryInterface;
//
//import javax.sound.sampled.*;
//import java.util.concurrent.CountDownLatch;
//import marytts.util.data.audio.AudioPlayer;
//
//public class TTS {
//    public static void main(String[] args) throws Exception {
//        // Create a MaryTTS interface
//        LocalMaryInterface maryTts = new LocalMaryInterface();
//
//        // Generate audio from text
////        String text = "Hello dear customer please rate our service from 1 to 5. 1 means the service is really bad, and 5 means the service is excellent.";
////        AudioInputStream audioStream = maryTts.generateAudio(text);
//String greeting = "Hello, dear customer!";
//
//        // Generate audio from text - Rating instructions
//        String ratingInstructions = "Please rate our service from 1 to 5. 1 means the service is really bad, and 5 means the service is excellent.";
//
//        // Generate audio for greeting and rating instructions
//        AudioInputStream audioPlayer = maryTts.generateAudio(greeting + " " + ratingInstructions);
//       
//        // Play the generated audio
//        playAudioStream(audioPlayer);
//
//        // Rest of the code here
//        System.out.println("Audio playback finished. Continuing with the rest of the code...");
//        // Add any remaining code or logic here
//    }
//
//    public static void playAudioStream(AudioInputStream audioStream) throws Exception {
//        try (Clip clip = AudioSystem.getClip()) {
//            // Register a LineListener to wait for audio playback completion
//            CountDownLatch latch = new CountDownLatch(1);
//            clip.addLineListener(event -> {
//                if (event.getType() == LineEvent.Type.STOP) {
//                    latch.countDown();
//                }
//            });
//
//            // Open and start the clip
//            clip.open(audioStream);
//            clip.start();
//
//            // Wait for audio playback to finish
//            latch.await();
//            clip.stop();
//        }
//    }
//}

import marytts.LocalMaryInterface;

import javax.sound.sampled.*;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;

public class TTS {
    public static void main(String[] args) throws Exception {
        // Create a MaryTTS interface
        LocalMaryInterface maryTts = new LocalMaryInterface();


 String greeting = " Thank you for rating our service as excellent (5)   We appreciate your positive feedback and commited to maintain the highest level of satisfaction   .";
//        String ratingInstructions = "Your feedback is valuable to us   and will take it into  consideration to improve our service .";
        // Generate audio for greeting and rating instructions
        AudioInputStream audioPlayer = maryTts.generateAudio(greeting + "  ");

        // Convert the audio stream to a compatible format
        AudioFormat format = new AudioFormat(16000, 16, 1, true, false);
        AudioInputStream convertedStream = AudioSystem.getAudioInputStream(format, audioPlayer);

        // Save the audio as a .wav file
        String filePath = "/home/aisha/Documents/press5.wav";
        saveAudioToFile(convertedStream, filePath);

        // Rest of the code here
        System.out.println("Audio saved to: " + filePath);
        // Add any remaining code or logic here
    }

    public static void saveAudioToFile(AudioInputStream audioStream, String filePath) {
        try {
            // Create the output file
            File outputFile = new File(filePath);

            // Write the audio stream to the output file
            AudioSystem.write(audioStream, AudioFileFormat.Type.WAVE, outputFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

