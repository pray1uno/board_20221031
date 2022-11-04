package com.its.board.controller;

import com.its.board.DTO.CommentDTO;
import com.its.board.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/comment/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO) {
        commentService.save(commentDTO);
       return null;
    }
}
