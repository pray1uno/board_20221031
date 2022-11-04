package com.its.board.Repository;

import com.its.board.DTO.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(CommentDTO commentDTO) {
        sql.insert("Comment.comment", commentDTO);
    }

    public List<CommentDTO> listload(Long boardId) {
        return sql.selectList("Comment.commentList", boardId);
    }
}
