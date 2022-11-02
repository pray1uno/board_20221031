package com.its.board.controller;

import com.its.board.DTO.BoardDTO;
import com.its.board.Service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
// @RequestMapping(/공통주소) 이라는 것도 있음 참고
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/board/save")
    public String savePage() {
        return "boardSave";
    }

    @PostMapping("/board/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/";
    }

    @GetMapping("/board/")
    public String boardList(Model model) {
        List<BoardDTO> boardList = boardService.boardList();
        model.addAttribute("listResult", boardList);
        return "boardList";
    }

    @GetMapping("/board")
    public String listLookup(@RequestParam("id") Long id, Model model) {
        boardService.updateHits(id);
        BoardDTO listResult = boardService.listLookup(id);
        model.addAttribute("listResult", listResult);
        System.out.println("listResult = " + listResult);
        return "boardDetail";
    }
    
    @GetMapping("/board/deleteForm")
    public String deleteCheck(@RequestParam("id") Long check, Model model) {
        BoardDTO checkResult = boardService.checkPass(check);
        model.addAttribute("checkResult", checkResult);
        return "deleteCheck";
    }

    @GetMapping("/board/delete")
    public String boardDelete(@RequestParam("id") Long delete, Model model) {
        int deleteResult = boardService.boardDelete(delete);
        model.addAttribute("deleteResult", deleteResult);
        return "redirect:/board/";
    }


    @GetMapping("/boardUpdate")
    public String getUpdate(@RequestParam("id") Long id, Model model) {
        BoardDTO updateResult = boardService.boardUpdate(id);
        model.addAttribute("updateResult", updateResult);
        return "boardUpdate";
    }

    @PostMapping("/boardUpdate")
    public String postUpdate(@ModelAttribute BoardDTO boardDTO, Model model) {
        System.out.println("boardDTO = " + boardDTO);
//        redirect로 상세페이지 요청 (이러면 조회수가 같이 올라가버림)
        boardService.update(boardDTO);
//        return "redirect:/board?=id" + boardDTO.getId();
        BoardDTO dto = boardService.listLookup(boardDTO.getId());
        model.addAttribute("listResult", dto);
        return "boardDetail";
    }

}
