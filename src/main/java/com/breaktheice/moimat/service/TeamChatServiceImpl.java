package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.ChatMessage;
import com.breaktheice.moimat.persistence.TeamChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamChatServiceImpl implements TeamChatService {
    @Autowired
    private TeamChatMapper mapper;

    @Override
    public void saveMessage(ChatMessage message) {
        mapper.insertMessage(message);
    }

    @Override
    public List<ChatMessage> getMessages(Long groupId) {
        return mapper.selectMessages(groupId);
    }
}
