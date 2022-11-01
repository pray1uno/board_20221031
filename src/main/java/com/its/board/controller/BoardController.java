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

import javax.servlet.http.HttpSession;
import java.time.temporal.ValueRange;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/board/save")
    public String savePage() {
        return "boardSave";
    }

    @PostMapping("/board/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO, Model model) {
        boolean saveResult = boardService.save(boardDTO);
        model.addAttribute("saveResult", saveResult);
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
        BoardDTO listResult = boardService.listLookup(id);
        model.addAttribute("listResult", listResult);
        return "boardDetail";
    }

    @GetMapping("/board/delete")
    public String boardDelete(@RequestParam("id") int delete, Model model) {
        int boardDelete = boardService.boardDelete(delete);
        model.addAttribute("deleteResult", boardDelete);
        return "redirect:/board/";
    }

    @GetMapping("/boardUpdate")
    public String getUpdate(@RequestParam("id") Long id, Model model) {
        BoardDTO updateResult = boardService.boardUpdate(id);
        model.addAttribute("updateResult", updateResult);
        return "boardUpdate";
    }

    @PostMapping("/boardUpdate")
    public String postUpdate(@ModelAttribute BoardDTO boardDTO) {
        System.out.println("boardDTO = " + boardDTO);
        boolean result = boardService.update(boardDTO);
        if (result) {
            return "redirect:/board?id=" + boardDTO.getId();
        } else {
            return "index";
        }

    }

}
