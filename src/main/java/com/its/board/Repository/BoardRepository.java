package com.its.board.Repository;

import com.its.board.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.boardInsert", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public void saveFileName(BoardDTO boardDTO) {
        sql.insert("Board.saveFile", boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public BoardDTO listLookup(Long id) {
        BoardDTO boardDTO = sql.selectOne("Board.listLookup", id);
        if (boardDTO.getFileAttached() == 1) {
            return sql.selectOne("Board.listLookupFile", id);
        } else {
            return boardDTO;
        }
    }

    public int boardDelete(Long delete) {
        return sql.delete("Board.boardDelete", delete);
    }

    public BoardDTO boardUpdate(Long id) {
        return sql.selectOne("Board.boardUpdate", id);
    }


    public int update(BoardDTO boardDTO) {
        return sql.update("Board.update", boardDTO);
    }


    public BoardDTO checkPass(Long boardDTO) {
        return sql.selectOne("Board.checkPass", boardDTO);
    }


    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.boardCount");
    }
}
