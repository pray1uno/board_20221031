package com.its.board.Repository;

import com.its.board.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(BoardDTO boardDTO) {
        return sql.insert("Board.boardInsert", boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }

    public BoardDTO listLookup(Long id) {
        return sql.selectOne("Board.listLookup", id);
    }

    public int boardDelete(int delete) {
        return sql.delete("Board.boardDelete", delete);
    }

    public BoardDTO boardUpdate(Long id) {
        return sql.selectOne("Board.boardUpdate", id);
    }


    public int update(BoardDTO boardDTO) {
        return sql.update("Board.update", boardDTO);
    }
}
