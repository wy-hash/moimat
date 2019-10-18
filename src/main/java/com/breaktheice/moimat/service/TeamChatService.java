package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.ChatMessage;

import java.util.List;

public interface TeamChatService {

    void saveMessage(ChatMessage message);

    List<ChatMessage> getMessages(Long teamId);
}
