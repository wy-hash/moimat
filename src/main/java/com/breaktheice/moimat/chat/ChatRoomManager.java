package com.breaktheice.moimat.chat;

import com.breaktheice.moimat.persistence.TeamChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class ChatRoomManager {

    private final Map<Long, ChatRoom> chatRoomManager;

    public ChatRoomManager() {
        chatRoomManager = new HashMap<>();
    }

    public ChatRoom getChatRoom(Long groupId) {

        if (chatRoomManager.containsKey(groupId)) {
            return chatRoomManager.get(groupId);
        }

        return createChatRoom(groupId);
    }

    public ChatRoom createChatRoom(Long groupId) {

        ChatRoom room = ChatRoom.create(groupId);
        chatRoomManager.put(groupId, room);

        return room;
    }
}
