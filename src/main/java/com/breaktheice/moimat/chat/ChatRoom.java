package com.breaktheice.moimat.chat;

import com.breaktheice.moimat.domain.ChatMessage;
import com.breaktheice.moimat.persistence.TeamChatMapper;
import com.google.gson.Gson;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Data
public class ChatRoom {
    private Long groupId;
    private Set<WebSocketSession> sessions = new HashSet<>();

    @Autowired
    TeamChatMapper mapper;

    public static ChatRoom create(Long groupId) {
        ChatRoom room = new ChatRoom();
        room.groupId = groupId;

        return room;
    }

    public void handleMessage(WebSocketSession session, ChatMessage chatMessage) {
        ChatMessage.MessageType messageType = chatMessage.getMessageType();

        switch(messageType) {
            case ENTER:
                connect(session);
                break;
            case LEAVE:
                disconnect(session);
                break;
            case ON:
                send(chatMessage);
                break;
        }
    }

    private void connect(WebSocketSession session) {
        sessions.add(session);
    }

    private void disconnect(WebSocketSession session) {
        sessions.remove(session);
    }

    private void send(ChatMessage messageObject) {
        Gson gson = new Gson();
        TextMessage message = new TextMessage(gson.toJson(messageObject));

        for (WebSocketSession item: sessions) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
