package kr.ac.kopo;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/spring-mvc.xml"})
public class BoardTest {

	//service와 같은 역할
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private BoardService boardService;
	
	@Ignore
	@Test
	public void 전체게시글조회Test() throws Exception{
//		List<BoardVO> list = boardDAO.searchAll(); //여러개의 게시글. list로 조회해야힘.
		
		List<BoardVO> list = boardService.selectAllBoard();
		for(BoardVO board:list) {
			System.out.println(board);
		}
	}
	@Ignore
	@Test
	public void 게시글세부내용조회Test() throws Exception{
		//BoardVO vo = boardService.selectOneBoard();
		//System.out.println(vo);
	}
	
	public void 새글등록Test() throws Exception{
		
	}
}
