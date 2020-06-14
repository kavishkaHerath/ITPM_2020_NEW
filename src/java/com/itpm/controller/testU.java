package com.itpm.controller;

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.File;


public class testU {

    public static void main(String[] args) throws IOException {
        String target_dir = "c://codeMe";
        File dir = new File(target_dir);
        File[] files = dir.listFiles();

        for (File f : files) {
            if(f.isFile()) {
                BufferedReader inputStream = null;

                try {
                    inputStream = new BufferedReader(
                                    new FileReader(f));
                    String line;

                    while ((line = inputStream.readLine()) != null) {
                        System.out.println(line);
                    }
                }
                finally {
                    if (inputStream != null) {
                        inputStream.close();
                    }
                }
            }
        }
    }

}