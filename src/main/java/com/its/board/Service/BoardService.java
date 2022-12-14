package com.its.board.Service;

import com.its.board.DTO.BoardDTO;
import com.its.board.DTO.PageDTO;
import com.its.board.Repository.BoardRepository;
import com.its.board.commons.PagingConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        /*
         * 1. BoardDTO 객체에 담긴 파일을 꺼냄
         * 2. 파일의 원본 이름을 가져옴(originalFileName)
         * 3. 서버관리용 이름을 만듦(storedFileName)
         * 4. originalFileName, storedFileName 을 DTO 객체에 담음
         * 5. 파일 실제 저장 위치 지정
         * 6. 파일 저장처리
         * 7. repository 로 DTO 객체 전달
         * */
        if (!boardDTO.getBoardFile().isEmpty()) {
            System.out.println("파일있음");
            MultipartFile boardFile = boardDTO.getBoardFile(); // 1.
            String originalFilename = boardFile.getOriginalFilename(); // 2.
            System.out.println("originalFilename = " + originalFilename);
            System.out.println(System.currentTimeMillis());
            String storedFileName = System.currentTimeMillis() + "-" + originalFilename; // 3.
            System.out.println("storedFileName = " + storedFileName);
            boardDTO.setOriginalFileName(originalFilename);
            boardDTO.setStoredFileName(storedFileName); // 4.
            String savePath = "D:\\spring_img\\" + storedFileName; // 5.
            boardFile.transferTo(new File(savePath)); // 6.
            boardDTO.setFileAttached(1);
            BoardDTO saveBoard = boardRepository.save(boardDTO); // 7.
            boardRepository.saveFileName(saveBoard);
        } else {
            System.out.println("파일없음");
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        }
//        int result = boardRepository.save(boardDTO);
//        if (result > 0) {
//            return true;
//        } else {
//            return false;
//        }
    }

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public BoardDTO listLookup(Long id) {
        // 조회수 증가
//        boardRepository.updateHits(id);
        // 상세내용 가져와서 리턴
        return boardRepository.listLookup(id);
    }

    public int boardDelete(Long delete) {
        return boardRepository.boardDelete(delete);
    }

    public BoardDTO boardUpdate(Long id) {
        return boardRepository.boardUpdate(id);
    }

    public boolean update(BoardDTO boardDTO) {
        int result = boardRepository.update(boardDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public BoardDTO checkPass(Long boardDTO) {
        return boardRepository.checkPass(boardDTO);
    }


    public List<BoardDTO> pagingList(int page) {
        /*
        * page = 1, 0
        * page = 2, 3
        * page = 3, 6*/
        int pagingStart = (page-1) * PagingConst.PAGE_LIMIT;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", PagingConst.PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);
        return pagingList;
    }

    public PageDTO pagingParam(int page) {
        // 전체 글 갯수 조회
        int boardCount = boardRepository.boardCount();
        // 전체 페이지 갯수 계산
        int maxPage = (int) (Math.ceil((double) boardCount / PagingConst.PAGE_LIMIT));
        // 시작 폐이지 값 계산(1, 4, 7, 10, ~~~~)
        int startPage = (((int)(Math.ceil((double) page / PagingConst.BLOCK_LIMIT))) - 1) * PagingConst.BLOCK_LIMIT + 1;
        // 끝 페이지 값 계산 (3, 6, 9, 12, ~~~~)
        int endPage = startPage + PagingConst.BLOCK_LIMIT - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }

    public List<BoardDTO> search(String type, String q) {
        Map<String, String> searchParams = new HashMap<>();
        searchParams.put("type", type);
        searchParams.put(("q"), q);
        List<BoardDTO> searchList = boardRepository.search(searchParams);
        return searchList;
    }
}
