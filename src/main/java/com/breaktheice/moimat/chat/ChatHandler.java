package com.breaktheice.moimat.chat;

import com.breaktheice.moimat.domain.ChatMessage;
import com.breaktheice.moimat.service.TeamChatService;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Log4j
public class ChatHandler extends TextWebSocketHandler {

    private final ChatRoomManager chatRoomManager;

    @Autowired
    TeamChatService service;

    @Autowired
    public ChatHandler(ChatRoomManager manager) {
        chatRoomManager = manager;
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) {
        Gson gson = new Gson();
        String payload = message.getPayload();
        log.info("payload: " + payload);

        ChatMessage chatMessage = gson.fromJson(payload, ChatMessage.class);
        ChatRoom chatRoom = chatRoomManager.getChatRoom(chatMessage.getGroupId());
        chatRoom.handleMessage(session, chatMessage);

        if (chatMessage.getMessageType() == ChatMessage.MessageType.ON) {
            service.saveMessage(chatMessage);
        }
    }
}
