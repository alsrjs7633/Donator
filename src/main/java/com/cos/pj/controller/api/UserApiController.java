package com.cos.pj.controller.api;

import com.cos.pj.config.auth.PrincipalDetail;
import com.cos.pj.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cos.pj.dto.ResponseDto;
import com.cos.pj.model.Users;
import com.cos.pj.service.UserService;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Calendar;

import static org.aspectj.weaver.tools.cache.SimpleCacheFactory.path;


@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	@Autowired
	private UploadService uploadService;
	
	@PostMapping("/auth/joinProc")//회원가입 로직이 실행되는 부분
	public ResponseDto<Integer> save(@RequestBody Users user) {//save의 data가 input type=text 
		System.out.println("UserApiController호출됨");		   //-> 어떤 타입이 들어올지 모르기때문에 사용
		
		userService.회원가입(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		
	}
	@DeleteMapping("/delete/{id}")
	public ResponseDto<Integer> delete(@PathVariable int id) {
		userService.회원삭제(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}


	private String path="C:\\Users\\GREEN\\Desktop\\donators\\src\\main\\resources\\static\\images";

	@RequestMapping(value="/application", method=RequestMethod.POST)//requestbody 데이터 요청  uploadfiles 테이블에 uploadFilename-원본파일 dbFilename-날짜+파일이름
	public String result(@RequestParam("App_proofFile") MultipartFile multi,@RequestParam("userBirth") String userBirth,
						 @RequestParam("genderch") String genderch,
						 @RequestParam("area_select") String area_select, Model model, @AuthenticationPrincipal PrincipalDetail principal)
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
				uploadService.업로드2(saveFileName,principal.getUser(),multi,userBirth,genderch,area_select);

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
//	@PostMapping(value = "/upload")
//	@ResponseBody
//	public String upload(@RequestParam("file") MultipartFile file, @RequestParam("text") String text) {
//		// 파일 및 텍스트 데이터 처리 로직 추가
//		return "success";
//	}
	

	
	

    
	
}
