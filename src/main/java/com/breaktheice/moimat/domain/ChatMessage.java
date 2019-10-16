package com.breaktheice.moimat.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class ChatMessage {

    public enum MessageType {
        ENTER, LEAVE, ON
    }

    private MessageType messageType;
    private Long groupId;
    private String sender;
    private Long senderId;
    private String message;
    private String sendTime;
    private String profilePhoto;
}
