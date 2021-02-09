package org.zerock.domain;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Random;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class upload {
	Random rd = new Random();
	
	final String firstPath = "C:\\Users\\82107\\Desktop\\Util\\eclipse-jee-2019-12-R-win32-x86_64\\eclipse\\ex\\wemeet-master\\wemeet-master\\wemeetmarket\\src\\main\\webapp\\resources\\img\\";
							
	public String uploadFileName( MultipartFile file) {
		
	long time = System.currentTimeMillis(); 
	
	SimpleDateFormat simpl = new SimpleDateFormat("yyyy-MM-dd-aa-hh-mm-ss");
		
	String simage = simpl.format(time); 
	
	
	
	return firstPath+rd.nextInt(100)+simage+file.getOriginalFilename().replace(" ","");
		
	
	}
	
	
	public String fileUpload(MultipartFile file,String path) {
	
		 try(

            InputStream in = file.getInputStream();				// ë³´ë‚´ì˜¨ íŒŒì�¼ì •ë³´ ì�½ê¸°

            FileOutputStream fos = new FileOutputStream(path)){	// íŒŒì�¼ ì–´ë””ë‹¤ ì €ìž¥í• ê±´ì§€ ì…‹íŒ…

            int readCount = 0;

            byte[] buffer = new byte[512];

            while((readCount = in.read(buffer)) != -1){			// ì¹´ìš´íŠ¸ê°€ -1ì�´ ì•„ë‹�ë•Œ ì‹¤í–‰

                fos.write(buffer,0,readCount);					// ë�°ì�´í„° ì§€ì •ë�œ ê²½ë¡œì—�ë‹¤ ì €ìž¥
            
            }

        }catch(Exception ex){

            ex.printStackTrace();

        }
	    
		
		return path;											// ì�´ë¯¸ì§€ ì €ìž¥ë�œ ê²½ë¡œë¥¼ ë¦¬í„´
		
	}
	
	
	
}
