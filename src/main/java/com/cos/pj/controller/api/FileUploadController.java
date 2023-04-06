package com.cos.pj.controller.api;

import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cos.pj.config.auth.PrincipalDetail;
import com.cos.pj.dto.ResponseDto;
import com.cos.pj.model.UploadFiles;
import com.cos.pj.service.UploadService;

@Controller
public class FileUploadController {

    @Autowired
	private UploadService uploadService;

	private String path="C:\\Users\\GREEN\\Desktop\\donators\\src\\main\\resources\\static\\images";
    //window->pref->general->workspace->refresh using hook 체크
	@RequestMapping("/uploadFiles")
    public String form()
    {
        return "uploadFiles";
    }
    
    @RequestMapping(value="/upload", method=RequestMethod.POST)//requestbody 데이터 요청  uploadfiles 테이블에 uploadFilename-원본파일 dbFilename-날짜+파일이름
    public String result(@RequestParam("proofFile") MultipartFile multi,@RequestParam("text") String text, Model model,@AuthenticationPrincipal PrincipalDetail principal)
    {
    	System.out.println("fileupload 호출");
        String url = null;
        try {
//            String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            if(!multi.isEmpty())
            {
                File file = new File(uploadpath, saveFileName);
                multi.transferTo(file);
                uploadService.업로드(saveFileName,principal.getUser(),multi);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                return "/search";
            }
        }catch(Exception e)
        {
            System.out.println(e);
        }
        return "redirect:joinForm";
    }
    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
}