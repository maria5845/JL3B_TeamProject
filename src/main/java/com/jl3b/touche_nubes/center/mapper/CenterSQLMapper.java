package com.jl3b.touche_nubes.center.mapper;


import java.util.List;


import com.jl3b.touche_nubes.centervo.ReserveVo;
import com.jl3b.touche_nubes.centervo.CenterReviewVo;
import com.jl3b.touche_nubes.centervo.LessonVo;
import com.jl3b.touche_nubes.centervo.LessonInfoVo;
import com.jl3b.touche_nubes.membervo.CenterVo;

public interface CenterSQLMapper {
	
	//클래스 정보
	public int createCenterKey();									//파일업로드용
	public CenterVo selectCenterInfoByNo(int center_no);			//센터 보기
	public List<CenterVo> selectCenterInfoAll();					//센터 리스트
//	public void insertCenterInfo(CenterInfoVo centerInfoVo);		//클래스 정보 등록
//	public void updateCenterInfo(CenterInfoVo centerInfoVo);		//클래스 정보 수정
//	public void deleteCenterInfo(int info_no);						//클래스 정보 삭제
	
	//클래스 후기
	public void insertCenterReview(CenterReviewVo centerReviewVo);		//클래스 리뷰 등록
	public void updateCenterReview(CenterReviewVo centerReviewVo);		//클래스 리뷰 수정
	public void deleteCenterReview(int review_no);						//클래스 리뷰 삭제
	public CenterReviewVo selectCenterReviewByNo(int review_no);		//클래스 리뷰 보기
	public List<CenterReviewVo> selectCenterReviewAll(int center_no);	//클래스 리뷰 전체보기
	
	//예약
	public void insertReserve(ReserveVo reserveVo);					//프로그램 예약하기
	public void deleteReserve(ReserveVo reserveVo);						//예약 취소
	public List<ReserveVo> readmember(int lesson_no);				//예약자 확인		
	public int coutbyReserve(int lesson_no);						//예약자 수 확인selectReserverCount
	public ReserveVo checkReserve(ReserveVo reserveVo);		//예약 체크
	public List<ReserveVo> readlesson(int member_no);				//예약내역 확인
	
	//강의 정보
	public void insertlessonInfo(LessonInfoVo lessonInfoVo);							//강의 등록
	public void updateProg(LessonInfoVo progVo);							//프로그램 수정
	public void deleteProg(int prog_no);							//프로그램 삭제
	public LessonInfoVo selectlessonInfoByNo(int no);				//정보확인
	
	//강의
	public void insertlesson(LessonVo LessonVo);					//시간대 등록
	public int countbyReserve(int no);										//예약 인원수
	public int createKey();													//가상 키 생성
	public List<LessonVo> selectList(int no);								//센터 강의목록 노출
	public void updateHorsehead(int lesson_people);
	

}
	

