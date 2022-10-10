package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;

public class HelperFile {
	public static boolean deleteFile(String path) {
		boolean check = false;
		try {
			File file = new File(path);
			check = file.delete();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return check;
		
	}
	
	public static boolean saveFile(InputStream is, String path) {
		boolean check = false;
		try {
			byte b[] = new byte[is.available()];
			
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			
			fos.flush();
			
			fos.close();
			check = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("file not saved");
			e.printStackTrace();
		}
		
		return check;
		
	}
}
