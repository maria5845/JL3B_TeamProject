package com.jl3b.touche_nubes.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jl3b.touche_nubes.boardvo.BoardLikeVo;
import com.jl3b.touche_nubes.boardvo.BoardVo;
import com.jl3b.touche_nubes.horseheadvo.HorseheadVo;
import com.jl3b.touche_nubes.ideavo.IdeaLikeVo;
import com.jl3b.touche_nubes.ideavo.IdeaVo;
import com.jl3b.touche_nubes.noticevo.NoticeVo;

public interface BoardSQLMapper {
	
	/////////////////////공지사항
	public void insertNotice(NoticeVo noticeVo);		//글쓰기
	public NoticeVo selectNoticeByNo(int no);			//글보기
	public int selectNoticeAllCount();					//게시글 개수
	public void deleteNoticeByNo(int no);				//글삭제
	public void updateNoticeByNo(NoticeVo noticeVo);	//글수정
	public void updateNoticeReadCount(int no);			//조회수
	public List<NoticeVo> selectNoticeAll(int currentPage);		//전체 글 리스트
	public List<NoticeVo> selectNoticeByKeyword(@Param("searchOption") String searchOption, 
			@Param("keyword") String keyword, @Param("currentPage") int currentPage);		//옵션별 검색
	public int selectNoticeByKeywordCount(@Param("searchOption") String searchOption, @Param("keyword") String keyword);//검색 시 게시글 수
	
	
	//////////////////////////자게
	public int createBoardKey();
	public void insertBoard(BoardVo boardVo);
    public BoardVo selectBoardByNo(int no);
    public List<BoardVo> selectBoardAll(int currPage);
    public void deleteBoardByNo (int no);
    public void updateBoard(BoardVo boardVo);	
    public void updateBoardReadCount(int no);
    public int selectBoardAllCount(); 
    public int selectBoardByKeywordCount(@Param("searchOption") String searchOption, @Param("keyword") String keyword);	//검색 시 게시글 수
    public List<BoardVo> selectBoardByKeyword(@Param("searchOption") String searchOption, 
    		@Param("keyword") String keyword, @Param("currentPage") int currentPage);	//검색
    public List<NoticeVo> selectNoticeFix();					//상단 고정 공지
    public void updateHot();									//인기글로~
    public List<BoardVo> selectHotFix();						//인기글 출력 
    //추천
    public void insertBoardLike(BoardLikeVo boardLikeVo);		//추천, 비추 입력
    public BoardLikeVo selectLikeByNo(BoardLikeVo boardLikeVo);	//중복방지 본인확인
    public int selectLikeUpCount(int boardNo);					//좋아요 개수
    public int selectLikeDownCount(int boardNo);				//싫어요 개수
    public void deleteBoardLike(BoardLikeVo boardLikeVo);		//추천 취소
    
    
    
    /////////////////////////////청원입니당~
	public int createIdeaKey();							//파일업로드시 필요(시퀀스 미리 만들어서 넣는 용도)
	public void insertIdea(IdeaVo ideaVo);				//글쓰기
	public IdeaVo selectIdeaByNo(int idea_no);			//글보기
	public List<IdeaVo> selectIdeaAll(int currPage);	//전체 글 리스트
	public List<NoticeVo> selectNoticeIdeaFix();		//공지사항 상단 고정
	public void insertIdeaAnswer(IdeaVo ideaVo);		//답글쓰기
	public void updateIdeaReadCount(int no);			//조회수
	public int selectIdeaAllCount();					//게시글 개수
	public void deleteIdeaByNo(int idea_no);			//글삭제
	public void updateIdea(IdeaVo ideaVo);				//글수정
	public void updateHorsehead();						//답변 달리면 말머리 수정
	public List<IdeaVo> selectIdeaByKeyword(@Param("searchOption") String searchOption, 
			@Param("keyword") String keyword, @Param("currentPage") int currentPage);	//검색
	public int selectIdeaByKeywordCount(@Param("searchOption") String searchOption, @Param("keyword") String keyword);	//검색 시 게시글 수
	//추천
	public void insertIdeaLike(IdeaLikeVo ideaLikeVo); // 추천, 비추
	public IdeaLikeVo selectIdeaLikeByNo(IdeaLikeVo ideaLikeVo); // 중복방지 본인확인
	public int selectIdeaLikeUpCount(int idea_no); // 좋아요 개수
	public void deleteIdeaLike(IdeaLikeVo ideaLikeVo);	//추천 취소
}
