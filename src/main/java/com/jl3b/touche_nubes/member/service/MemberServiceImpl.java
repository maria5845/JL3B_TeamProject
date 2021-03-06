package com.jl3b.touche_nubes.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.center.mapper.CenterImgSQLMapper;
import com.jl3b.touche_nubes.center.mapper.CenterSQLMapper;
import com.jl3b.touche_nubes.centervo.CenterImgVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.member.mapper.MemberSQLMapper;
import com.jl3b.touche_nubes.member.mapper.NpkiSQLMapper;
import com.jl3b.touche_nubes.membervo.NpkiVo;
import com.jl3b.touche_nubes.membervo.MemberVo;
import com.jl3b.touche_nubes.votevo.CandyImgVo;
import com.jl3b.touche_nubes.membervo.CenterAuthVo;
import com.jl3b.touche_nubes.membervo.CenterVo;
import com.jl3b.touche_nubes.membervo.MemberAuthVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private NpkiSQLMapper npkiSQLMapper;
	@Autowired
	private CenterSQLMapper centerSQLMapper;
	@Autowired
	private CenterImgSQLMapper centerImgSQLMapper;
	
	//입주민 회원가입
	public void joinMember(MemberVo memberVo, MemberAuthVo memberAuthVo) {
		
		if(npkiSQLMapper.selectNpki(memberVo.getNpki_key()) == null) {
	         return;
	    }else {
	    	 //비밀번호 암호화 
	    	 String hashCode = MemberMessageDigest.digest(memberVo.getMember_pw());
	         memberVo.setMember_pw(hashCode);
	         
	         int member_key = memberSQLMapper.creatKey();   
	         
	         memberVo.setMember_no(member_key);
	         
	         memberSQLMapper.insertMember(memberVo);    
	         //인증
	         memberAuthVo.setMember_no(member_key);
	         memberSQLMapper.insertAuth(memberAuthVo);
	      }
	}
	
	//인증번호가 맞는지 확인
	public String checkNpki(String npki_key) {			
		return npkiSQLMapper.selectNpki(npki_key);
		
	}
	
	//인증번호 중복 확인
	public MemberVo checkNpkiDupl(String npki_key) {			
		return memberSQLMapper.selectMemberByNpki(npki_key);
	}
	
	//입주민 로그인
	public MemberVo loginMember(MemberVo memberVo) {   
		
       String hashCode = MemberMessageDigest.digest(memberVo.getMember_pw());
       memberVo.setMember_pw(hashCode);
       
       return memberSQLMapper.selectMemberByIdAndPw(memberVo);
	}
	
	// 아이디 찾기
	public String get_searchId(String member_rname, String npki_key) {
      return memberSQLMapper.searchMemberId(member_rname,npki_key);
	}
	
	public void certification(String key) {
	       memberSQLMapper.updateAuth(key);	
	}
	
	//마이페이지 비밀번호 확인
	public MemberVo confirmMemberPw(MemberVo membervo) {
      
		String hashCode = MemberMessageDigest.digest(membervo.getMember_pw());
		membervo.setMember_pw(hashCode);
      
		return memberSQLMapper.confirmMemberPw(membervo);
    }
	
	//센터 비밀번호 확인
	public CenterVo confirmCenterPw(CenterVo centerVo) {
		
		String hashCode = MemberMessageDigest.digest(centerVo.getCenter_pw());
		centerVo.setCenter_pw(hashCode);
		
		return memberSQLMapper.confirmCenterPw(centerVo);
	}
	   
	//마이페이지 정보 수정
	public void updateMember(MemberVo membervo) {
		memberSQLMapper.updateMember(membervo);
	}
	
	//센터 정보 수정
	public void updateCenter(CenterVo centerVo) {
		memberSQLMapper.updateCenter(centerVo);
	}
	
	//멤버no 받아오는거
	public MemberVo updateSession(int member_no) {
		return memberSQLMapper.selectMemberByNo(member_no);
	}
	
	//센터 no 받아오기
	public CenterVo updateCenterSession(int center_no) {
		return memberSQLMapper.selectCenterByNo(center_no);
	}
   
	//비밀번호 변경 
	public void updatePw(MemberVo membervo) {
        String hashCode = MemberMessageDigest.digest(membervo.getMember_pw());
        membervo.setMember_pw(hashCode);
        memberSQLMapper.updatePw(membervo);
	}
	
	//센터 비밀번호 변경
	public void updateCenterPw(CenterVo centerVo) {
		String hashCode = MemberMessageDigest.digest(centerVo.getCenter_pw());
		centerVo.setCenter_pw(hashCode);
		memberSQLMapper.updateCenterPw(centerVo);
	}
	
	//비밀번호 찾기
	public String get_searchPw(String member_id,String member_mail) {
		return memberSQLMapper.conditionMemberPw(member_id, member_mail);
	}
	
	//임시 비밀번호 생성 
	public void get_changePw(String member_pw,String member_id, String member_mail) {
	    String hashCode = MemberMessageDigest.digest(member_pw);
		memberSQLMapper.updateMemberPw(hashCode, member_id, member_mail);
	}
	
	   //내가 쓴 글 내역(자게)
   public List<Map<String,Object>> getMyBoard(int member_no) {
      List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
      List<BoardVo> boardList = memberSQLMapper.selectMyBoard(member_no) ;
       
      
      for(BoardVo boardVo : boardList) {
         MemberVo memberVo = memberSQLMapper.selectMemberByNo(boardVo.getMember_no());
            Map<String,Object> map = new HashMap<String, Object>();
      
            map.put("memberVo",memberVo);
            map.put("boardVo",boardVo);
            list.add(map);
      }
      return list;
   }

   // 내가 쓴글(청원)  
   public List<Map<String,Object>> getMyIdea(int member_no){
	   List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	   List<IdeaVo> IdeaList = memberSQLMapper.selectMyIdea(member_no);
	   
	   for(IdeaVo ideaVo : IdeaList) {
		   MemberVo memberVo = memberSQLMapper.selectMemberByNo(ideaVo.getMember_no());
		    Map<String,Object> map = new HashMap<String, Object>();
		    map.put("memberVo",memberVo);
		    map.put("ideaVo",ideaVo);
		    list.add(map);
	   } 
	   return list;
   }
   
   
   //회원 탈퇴
   public void memberDrop(int member_no) {
	   memberSQLMapper.memberDrop(member_no);
   }
   
   //센터 회원 탈퇴
   public void centerDrop(int center_no) {
	   memberSQLMapper.centerDrop(center_no);
   }
	
	
	
	////////////////////////////////////////////////센터
   //센터 로그인
   public CenterVo loginCenter(CenterVo centerVo) {
	   String center_HashCode = MemberMessageDigest.digest(centerVo.getCenter_pw());
	   centerVo.setCenter_pw(center_HashCode);
	   return memberSQLMapper.selectCenterByIdAndPw(centerVo);
   }
	
	//센터 회원가입
	public void joinCenter(CenterVo centerVo, List<CenterImgVo> centerImgList, CenterAuthVo centerAuthVo) {
		
		int centerKey = centerSQLMapper.createCenterKey();
		System.out.println(centerKey);
	
		centerVo.setCenter_no(centerKey);
		
	
		if(npkiSQLMapper.selectNpki(centerVo.getNpki_key()) == null) {
			return;
		}else {
			//센터 비밀번호 암호화 
			String centerHashCode = MemberMessageDigest.digest(centerVo.getCenter_pw());
			centerVo.setCenter_pw(centerHashCode);
			centerAuthVo.setCenter_no(centerKey);
			
          
           	memberSQLMapper.insertCenterAuth(centerAuthVo);		 //센터인증
			memberSQLMapper.insertCenter(centerVo);
		}
		
		for(CenterImgVo centerImgVo : centerImgList) {			//이미지 등록
			centerImgVo.setCenter_no(centerKey);
			centerImgSQLMapper.insertCenterInfoImg(centerImgVo);
		}
	}
	
	// 센터 회원가입 인증
	public void certification_Center(String key) {
	       memberSQLMapper.updateCenterAuth(key);	
	}
	
	
	
	//아이디 중복검사
	public boolean confrimId(String id) {
		if (memberSQLMapper.selectMemberById(id) == null) {
			return true;
		} else {
			return false;
		}

	}
	
	//인증번호 유효성검사
   public boolean confirmNpki(String npki_key) {
      if (memberSQLMapper.selectMemberByNpki(npki_key)==null) {
         return true;
      } else {
         return false;
      }
   }
   
   //인증번호 중복검사
   public boolean onlyNpki(String npki_key) {
      if (memberSQLMapper.existNpki(npki_key)!=null) {
         return true;
      } else {
         return false;
      }
   }
   
   //이메일 확인
   public boolean confirmEmail(String member_mail) {
      if(memberSQLMapper.existEmail(member_mail)== null) {
         return true;
      } else {
         return false;
      }   
	}
   
   // 센터 아이디 중복확인
   public boolean confirmCenterId(String center_id) {
      if (memberSQLMapper.selectCenterById(center_id) == null) {
         return true;
      } else {
         return false;
      }
   }

   // 센터 인증키 확인
   public boolean confirmCenterNpki(String npki_key) {
      if (memberSQLMapper.selectCenterByNpki(npki_key) == null) {
         return true;
      } else {
         return false;
      }
   }
   // 센터 이메일 확인
   public boolean confirmCenterEmail(String center_mail) {
      if (memberSQLMapper.selectCenterById(center_mail) == null) {
         return true;
      } else {
         return false;
      }
   }
   
   //날짜~~
   public String getMemberDate(int member_no) {
	   return memberSQLMapper.selectMemberDate(member_no);
   }
   public String getCenterDate(int center_no) {
	   return memberSQLMapper.selectCenterDate(center_no);
   }
   
   // 나의 센터내역 가져오기
   public List<Map<String,Object>> getMyCenter(int member_no) {
	  
	  List<Map<String,Object>> myCenterList = memberSQLMapper.selectMyCenter(member_no);
      return myCenterList;
	}

   // 나의 센터예약 취소하기 
   public void deleteReserve(int[] lesson_no, int member_no, int[] lesson_people) {
	   
	  int count = lesson_no.length;
	   
	  for(int i = 0; i < count; i++) {
		  ReserveVo reserveVo = new ReserveVo();
		  
		  reserveVo.setLesson_no(lesson_no[i]);
		  reserveVo.setMember_no(member_no);
		  
		  memberSQLMapper.deleteReserve(reserveVo);
	  }
   }
   
}
