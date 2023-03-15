package com.itwillbs.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.CommunityDTO;
import com.itwillbs.domain.PaymentDTO;
import com.itwillbs.domain.UserDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.CommunityService;
import com.itwillbs.service.PaymentService;
import com.itwillbs.service.ProjectInfoService;
import com.itwillbs.service.UserService;
import com.itwillbs.service.UserServiceImpl.MailSendService;

@Controller
public class AjaxController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MailSendService mailService;	// 나경
	
	@Inject
	private PaymentService paymentService;
	@Inject
	private AddressService addressService;
	@Inject
	private ProjectInfoService projectInfoService;
	@Inject
	private UserService userService;
	@Inject
	private CommunityService communityService;
	
	// 숙인
	// xml 업로드 경로(자원이름) => 변수 저장
	@Resource(name = "uploadPath") // servlet-context.xml에 있는 id
	private String uploadPath;
	
	// projectList 페이지
	@ResponseBody
	@RequestMapping(value = "/project/likePro" , method = RequestMethod. POST)
	public String like(@RequestParam(value = "PJ_IDX") String pjIdx,
							   @RequestParam(value = "USER_ID") String userId) {

		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		String result = projectInfoService.setLike(param);
		return result;
	}
	
	@RequestMapping(value = "/project/alramPro" , method = RequestMethod. POST)
	@ResponseBody
	public String alram(@RequestParam(value = "PJ_IDX") String pjIdx,
						@RequestParam(value = "USER_ID") String userId) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("PJ_IDX", pjIdx);
		param.put("USER_ID", userId);
		String result = projectInfoService.setAlram(param);
		
		return result;
	}
	
	
	// User 페이지	(나경)
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result = "";
		
		String id = request.getParameter("id");
		
		UserDTO dto = userService.getUser(id);
		if(dto != null) {
			result = "아이디 중복";
		}else {
			result = "아이디 사용가능";
		}
		
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;	
	}
	

//	[이메일 인증]
	@GetMapping("/user/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		return mailService.joinEmail(email);
			
	}
	
//	[비밀번호 찾기 이메일 인증]
	@GetMapping("/user/findPassCheck")
	@ResponseBody
	public String findPassCheck(String email) {
		System.out.println("비번찾기 이메일 인증 요청이 들어옴!");
		System.out.println("비번찾기 이메일 인증 이메일 : " + email);
		return mailService.findEmail(email);
			
	}
	
	// 민영
	@RequestMapping(value="/payment/paySuccessPro", method = RequestMethod.GET)
	public  ResponseEntity<String> paySuccess(Model model, HttpServletRequest request) throws Exception { 
		String result = "성공";
		PaymentDTO dto = new PaymentDTO();
		int pjIdx = Integer.parseInt(request.getParameter("pjIdx")); 
		String id = request.getParameter("id");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String payDate = request.getParameter("payDate");
		String status = request.getParameter("status");
		int userDona = Integer.parseInt(request.getParameter("userDona"));
		
		dto.setUserDona(userDona);
		dto.setPjIdx(pjIdx);
		dto.setId(id);
		dto.setAmount(amount);
		dto.setAddress(address);
		dto.setPhone(phone);
		dto.setDate((new Timestamp(System.currentTimeMillis())));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date payDate1 = format.parse(payDate);
		dto.setPayDate(payDate1);
		dto.setStatus(status);
		System.out.println(dto.toString());
		
		paymentService.insertPayment(dto);
	
		 ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
         return entity;
	}
	
		
		@RequestMapping(value="/payment/addressPro", method = RequestMethod.GET)
		public ResponseEntity<String> addressPro(AddressDTO addressDTO, HttpServletRequest request) { //주소 db 저장하는 메서드..
			 addressService.insertAddress(addressDTO);
			 String result = "성공";
			 System.out.println(result);
			 
			 ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
	         return entity;
		}
		

		// 숙인
//		@ResponseBody // ajax를 위한 메서드...자바 객체를 HTTP 응답 본문의 객체로 변환
		@RequestMapping(value = "/project/CommunityWriteAjax", method = RequestMethod.POST)
		public ResponseEntity<List<CommunityDTO>> CommunityWriteAjax(
										 @RequestParam(value = "idx") String pjIdx,
										 @RequestParam(value = "id") String id,
										 @RequestParam(value = "content") String content,
//										 @RequestPart(value = "file") String imgA,
//										 @RequestParam(value = "imgB") String imgB,
//										 @RequestParam(value = "imgC") String imgC,
										 @RequestParam(value = "contentLabel") String contentLabel,
										 CommunityDTO communityDTO, 
										 RedirectAttributes redirect,
										 HttpServletRequest request,
										 MultipartFile file,
										 Model model
										) throws Exception {
			
//			// 업로드 파일명 : 랜덤문자_파일이름 (파일 이름이 중복이 안되도록 하기위함)
//			UUID uuid = UUID.randomUUID();// UUID : 자바에서 랜덤으로 뽑아오기 위함
//			String filename = uuid.toString() + "_" + file.getOriginalFilename();
//			
//			// 원본파일을 복사해서 upload폴더에 붙여넣기
////			FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만든 거);
////			FileCopyUtils.copy(file.getBytes(), new File(경로, 파일이름)); //.getBytes() : 원본파일,
//			FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
//					
	//
//			communityDTO.setId(request.getParameter("id"));
//			communityDTO.setContent(request.getParameter("content"));
//			communityDTO.setIdx(Integer.parseInt(request.getParameter("idx")));
//			communityDTO.setContentLabel(request.getParameter("contentLabel"));
//			communityDTO.setImgA(request.getParameter(filename));
//			communityDTO.setImgB(request.getParameter(filename));
//			communityDTO.setImgC(request.getParameter(filename));
//			String Files = request.getParameter("allFiles");
			
			communityService.insertBoard(communityDTO);
//			redirect.addAttribute("pjIdx", request.getParameter("pjIdx"));

			System.out.println(pjIdx);
			System.out.println(id);
			System.out.println(content);
//			System.out.println(imgA);
//			System.out.println(imgB);
//			System.out.println(imgC);
			System.out.println(contentLabel);
			
			List<CommunityDTO> communityList1 = communityService.getComm1List(communityDTO);
			model.addAttribute("communityList1", communityList1);
			
//			List<CommunityDTO> communityList2 = communityService.getComm2List(communityDTO);
//			model.addAttribute("communityList2", communityList2);
//			
//			List<CommunityDTO> communityList3 = communityService.getComm3List(communityDTO);
//			model.addAttribute("communityList3", communityList3);
			
			
			// ResponseEntity에 출력결과를 담아서 리턴
			ResponseEntity<List<CommunityDTO>> entity = new ResponseEntity<List<CommunityDTO>>(communityList1, HttpStatus.OK);
			
			return entity; // 이동 주소가 아니라 결과 값을 담아서 리턴

		}

	
						
}