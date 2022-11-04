package com.its.board.Service;

import com.its.board.DTO.CommentDTO;
import com.its.board.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }


    public List<CommentDTO> listload(Long boardId) {
        return commentRepository.listload(boardId);
    }
}
