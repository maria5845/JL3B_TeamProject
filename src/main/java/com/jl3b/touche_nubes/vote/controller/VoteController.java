package com.jl3b.touche_nubes.vote.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.service.MemberServiceImpl;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.vote.service.VoteService;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.votevo.CandyVo;
import com.jl3b.touche_nubes.votevo.ElectionVo;
import com.jl3b.touche_nubes.votevo.VoteVo;

@Controller
@RequestMapping("/vote/*")
@EnableScheduling
public class VoteController {
	
	@Autowired
	private VoteService voteService;
	
	
	//선거 메인
	@RequestMapping("vote_choice.do")
	public String choiceVote(Model model, HttpSession session) {
		
		voteService.gang();							//매일 상태 업데이트
		
		if(session.getAttribute("sessionCenter") != null) {
			return "./board/center_fail";
		}
		
		if(session.getAttribute("sessionUser") == null) {		//로그인 예외처리
			return "./board/board_fail";
		}
		
		
		try {
			int round = voteService.newRound();		//트라이캐치 안 쓰니까 choice페이지에서 round값 null로 못 받더라.
			model.addAttribute("round", round);		//round값을 받아줘서 항상 최신회차 출력을 위한 것.
			String status = voteService.checkStatus(round);
			model.addAttribute("status", status);
			
			int memberNo = ((MemberVo)session.getAttribute("sessionUser")).getMember_no();
			CandyVo candyVo = voteService.check(memberNo, round);
			model.addAttribute("candyVo", candyVo);
			
			ElectionVo electionVo = voteService.checkElection(round);
			model.addAttribute("electionVo", electionVo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
			
		return "vote/vote_choice";
	}
	
	//후보등록 글쓰기 페이지
	@RequestMapping("candy_write.do")
	public String writeCandy() {
		return "vote/candy_write";
	}
	@RequestMapping("candy_write_process.do")
	public String writeCandyProcess(MultipartFile [] candyFile, CandyVo candyVo, HttpSession session) {
		
		
	    String rootFolderName = "/var/storage/";
	    Date today = new Date();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	    String todayFolder = df.format(today);
	    String saveFolderName = rootFolderName + todayFolder;
	    File saveFolder = new File (saveFolderName);
        
	    if(!saveFolder.exists()){
        	saveFolder.mkdirs();
        }
		
        List<CandyImgVo> candyImgList = new ArrayList<CandyImgVo>();
        
         for(MultipartFile file : candyFile) {
        	if(file.getSize() <= 0) {
        		continue;
        	}
        	//파일명 랜덤 이름
        	String saveFileTitle = UUID.randomUUID().toString();
        	String oriFileTitle = file.getOriginalFilename();
  	      
  	      	saveFileTitle += "_" + System.currentTimeMillis();
  	      
  	      	saveFileTitle += oriFileTitle.substring(oriFileTitle.lastIndexOf("."));
  	      
	  	    String saveRealPath = saveFolderName + "/" + saveFileTitle;
	
	  	    try {
	  	    	file.transferTo(new File(saveRealPath));
	  	     }catch(IOException e) {
	  	        e.printStackTrace();
	  	     }
	  	    
	  	    CandyImgVo candyImgVo = new CandyImgVo();
	  	    candyImgVo.setCandy_img_title(todayFolder + "/" + saveFileTitle);
	  	    candyImgVo.setCandy_img_path(saveRealPath);
	  	    candyImgList.add(candyImgVo);
        }
        
        candyVo.setElection_round(voteService.newRound());
        int memberVo = ((MemberVo)session.getAttribute("sessionUser")).getMember_no();
 		candyVo.setMember_no(memberVo);
         
        CandyVo candyCheckData = voteService.checkCandy(candyVo); 
        
        //후보등록 중복방지
        if(candyCheckData == null) {
        	voteService.writeCandy(candyVo, candyImgList);
        }else {
        	return "vote/candy_fail";
        }
		
		return "redirect:./candy.do?election_round="+voteService.newRound();
	}
	
	//후보 삭제
	@RequestMapping("candy_delete_process.do")
	public String deleteCandy(int candy_no) {
		voteService.deleteCandy(candy_no);
		return "redirect:./candy.do";
	}
	
	//후보 수정
	@RequestMapping("candy_change.do")
	public String changeCandy(int candy_no, Model model) {
		model.addAttribute("readCandy", voteService.viewCandy(candy_no));
		return "vote/candy_change";
	}
	@RequestMapping("candy_change_process.do")
	public String changeCandyProcess(CandyVo candyVo) {
		
		voteService.changeCandy(candyVo);
		
		return "redirect:./vote_choice.do";
	}
	
	
	//후보 리스트 출력
	@RequestMapping("candy.do")
	public String candy(Model model, int election_round) {
		
		List<Map<String, Object>> list = voteService.candyList(election_round);
		model.addAttribute("candyList", list);
		
		return "vote/candy";
	}
	
	//투표
	@RequestMapping("vote.do")
	public String vote(VoteVo voteVo, Model model, int election_round) {
		
		List<Map<String, Object>> list = voteService.candyList(election_round);
		int round = voteService.newRound();
		
		model.addAttribute("candyList", list);
		model.addAttribute("round", round);
		return "vote/vote";
	}
	@RequestMapping("vote_process.do")
	public String voteProcess(VoteVo voteVo, HttpSession session) {
		
		int memberVo = ((MemberVo)session.getAttribute("sessionUser")).getMember_no();
		voteVo.setMember_no(memberVo);										//로그인한 no값 담아주기.

		voteVo.setElection_round(voteService.newRound());				//election_round값도 담고
		//voteVo.setElection_round(election_round);
		VoteVo voteData = voteService.checkVote(voteVo);
		
		
		//투표 중복방지
		if(voteData == null) {											
			voteService.takeVote(voteVo);								//중복 아니라면 투표 실행
			return "redirect:./vote_choice.do";
		}else {
			return "vote/vote_fail";
		}
	}
	
	//후보자 상세 페이지
	@RequestMapping("candy_read.do")
	public String readCandy(int candy_no, Model model) {
		Map<String, Object> map = voteService.viewCandy(candy_no);
		int round = voteService.newRound();
		
		model.addAttribute("readCandy", map);
		model.addAttribute("round", round);			//당회차 목록으로 이동시킬려구
		
		return "vote/candy_read";
	}
	
	//선거 개시 -> 테이블에 새로운 회차 등록됨
	@RequestMapping("vote_start.do")
	public String voteStart() {
		voteService.startElection();
		
		return "vote/vote_start";
	}
	
	//선거 득표수 보기
	@RequestMapping("vote_result.do")
	public String resultVote(Model model, int election_round) {
		List<Map<String, Object>> list = voteService.resultVote(election_round);
		model.addAttribute("voteList", list);
		
		return "/vote/vote_result";
	}
	
}
