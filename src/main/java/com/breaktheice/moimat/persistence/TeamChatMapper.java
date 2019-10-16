package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.ChatMessage;

import java.util.List;

public interface TeamChatMapper {

    void insertMessage(ChatMessage message);

    List<ChatMessage> selectMessages(Long teamId);
}
