package egovframework.example.sample.board.web;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.board.service.BoardService;
import egovframework.example.sample.board.service.BoardVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class BoardController {
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	@Resource(name = "boardService")
	private BoardService boardService;
	
	public String selectLoginCheck(BoardVO searchVO) {
		return boardService.selectLoginCheck(searchVO);
	}

	@RequestMapping(value = "/login.do")
	public String login(@RequestParam("user_id") String user_id, @RequestParam("password") String password,
			ModelMap model, HttpServletRequest request) throws Exception {

		BoardVO boardVO = new BoardVO();
		boardVO.setUserId(user_id);
		boardVO.setPassword(password);
		String user_name = boardService.selectLoginCheck(boardVO);

		if(user_name != null && !"".equals(user_name)) {
			request.getSession().setAttribute("userId", user_id);
			request.getSession().setAttribute("userName", user_name);
			}else {
			request.getSession().setAttribute("userId", "");
			request.getSession().setAttribute("userName", "");
			model.addAttribute("msg", "ID 또는 비밀번호가 올바르지 않습니다.");
			return "redirect:enter.do";
			}
			return "redirect:mainList.do";
			}
	
	@RequestMapping(value = "/logout.do")
	public String logout(ModelMap model, HttpServletRequest request) throws Exception {
	request.getSession().invalidate();
	return "redirect:enter.do";
	}


	@RequestMapping(value = "/mainList.do")
	public String list(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
	/** EgovPropertyService.sample */
	/** resource -> egov -> spring -> properties.xml **/  
	boardVO.setPageUnit(propertiesService.getInt("pageUnit"));
	boardVO.setPageSize(propertiesService.getInt("pageSize"));
	/** pageing setting */
	PaginationInfo paginationInfo = new PaginationInfo(); 
	paginationInfo.setCurrentPageNo(boardVO.getPageIndex());  
	paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());  
	paginationInfo.setPageSize(boardVO.getPageSize()); 
	boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());  List<?> list = boardService.selectBoardList(boardVO);
	// resultlist에 list를 넣음
	model.addAttribute("resultList", list);
	int totCnt = boardService.selectBoardListTotCnt(boardVO);
	paginationInfo.setTotalRecordCount(totCnt);  model.addAttribute("paginationInfo", paginationInfo);  return "/board/mainList";
	}



	@RequestMapping(value = "/mgmg.do", method =RequestMethod.GET)
	public String mgmg(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, 
	HttpServletRequest request) throws Exception {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Calendar c1 = Calendar.getInstance();
	String strToday = sdf.format(c1.getTime());
	System.out.println("Today" + strToday);
	//BoardVO boardVO = new BoardVO();
	// BoardVO에 등록일 시간 설정
	boardVO.setIndate(strToday);
	boardVO.setWriter(request.getSession().getAttribute("userId").toString());
	boardVO.setWriterNm(request.getSession().getAttribute("userName").toString());
	// 서버에서 가져오기
	if(request.getAttribute("idx") != null) {
	boardVO = boardService.selectBoard(boardVO);
	model.addAttribute("boardVO", boardVO);
	}
	// 서버에서 가져온값을 화면에 맵핑
	return "/board/mgmg";
	}

	
	@RequestMapping(value = "/mgmg.do", method=RequestMethod.POST)
	public String mgmg2(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) 
	throws Exception {
	boardService.insertBoard(boardVO);
	return "redirect:/mainList.do";
	}


	@RequestMapping(value = "/view.do")
	public String view(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model) throws Exception {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Calendar c1 = Calendar.getInstance();
	String strToday = sdf.format(c1.getTime());
	System.out.println("Today" + strToday);

	boardVO = boardService.selectBoard(boardVO);
	model.addAttribute("boardVO", boardVO);
	model.addAttribute("strToday", strToday);
	boardService.updateBoardCount(boardVO);
	
	List<?> list = boardService.selectReplyList(boardVO);
	// resultlist에 list를 넣음 
	model.addAttribute("resultList", list);
	return "/board/view";
	}
	
	// 등록 수행
	@RequestMapping(value = "/reply.do",  method=RequestMethod.POST)
	public String reply(@ModelAttribute("boardVO")  BoardVO boardVO, ModelMap model) throws  Exception {
	boardService.insertReply(boardVO);
	return "redirect:/view.do?idx="+boardVO.getIdx();
	}
	
	@RequestMapping(value = "/mgmt.do", method =RequestMethod.GET)
	public String mgmt(@ModelAttribute("boardVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Calendar c1 = Calendar.getInstance();
	String strToday = sdf.format(c1.getTime());
	System.out.println("Today" + strToday);
	//BoardVO boardVO = new BoardVO();
	// BoardVO에 등록일 시간 설정
	boardVO = boardService.selectBoard(boardVO);
	
	boardVO.setIndate(strToday);
	boardVO.setWriter(request.getSession().getAttribute("userId").toString());
	boardVO.setWriterNm(request.getSession().getAttribute("userName").toString());
	// 서버에서 가져오기
//	if(request.getAttribute("idx") != null) {
	
	model.addAttribute("boardVO", boardVO);
//	}
	// 서버에서 가져온값을 화면에 맵핑
	return "/board/mgmt";
	}
	
	@RequestMapping(value = "/mgmt.do", method=RequestMethod.POST)
	public String mgmt2(@ModelAttribute("boardVO") BoardVO boardVO,
	@RequestParam("mode") String mode, ModelMap model) throws Exception {
	if( "add".equals(mode)) {
	boardService.insertBoard(boardVO);
	}else if("modify".equals(mode)) {
	boardService.updateBoard(boardVO);
	}else if("del".equals(mode)) {
	boardService.deleteBoard(boardVO);
	}
	return "redirect:/mainList.do";
	}
	
	@RequestMapping(value = "/enter.do")
	public String enter(ModelMap model) throws Exception {
		return "/board/enter";
	}
	
	@RequestMapping(value = "/join.do")
	public String join(ModelMap model) throws Exception {
		return "/board/join";
	}
	
	@RequestMapping(value = "/findId.do")
	public String findId(ModelMap model) throws Exception {
		return "/board/findId";
	}
	
	@RequestMapping(value = "/findPwd.do")
	public String findPwd(ModelMap model) throws Exception {
		return "/board/findPwd";
	}
	
	@RequestMapping(value = "/checkId.do")
	public boolean checkId(ModelMap model, @RequestParam("user_id") String userId) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setUserId(userId);
		int countId = boardService.countByUserId(boardVO);
		if(countId != 0) {
			return false;
		}
		return true;
	}

	@RequestMapping(value = "/insert.do")
	public String insert(@RequestParam("user_id") String userId,
			@RequestParam("password") String password,
			@RequestParam("user_name") String userName,
			@RequestParam("email") String email1,
			@RequestParam("email_domain") String email2
			) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setUserId(userId);
		boardVO.setPassword(password);
		boardVO.setUserName(userName);
		String email = email1 + "@" + email2;
		boardVO.setEmail(email);
		boardService.insertUser(boardVO);
		return "redirect:/enter.do";
	}
	
	@RequestMapping(value = "/findId2.do")
	public String findId2(@RequestParam("user_name") String userName,
			@RequestParam("email") String email1,
			@RequestParam("email_domain") String email2, 
					ModelMap model) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setUserName(userName);
		String email = email1 + "@" + email2;
		boardVO.setEmail(email);
		String user_id = boardService.findByUserName(boardVO);
		String message = "ID는_"+user_id+"입니다.";
		message = java.net.URLDecoder.decode(message, "UTF-8");
		model.addAttribute("msg", message);
		return "redirect:/enter.do";
	}
	
	@RequestMapping(value = "/graph.do")
	public String graph(ModelMap model) throws Exception {
		return "/board/graph";
	}
}