package com.its.board.Service;

import com.its.board.DTO.BoardDTO;
import com.its.board.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public boolean save(BoardDTO boardDTO) {
        int result = boardRepository.save(boardDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public BoardDTO listLookup(Long id) {
        return boardRepository.listLookup(id);
    }

    public int boardDelete(int delete) {
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
}
