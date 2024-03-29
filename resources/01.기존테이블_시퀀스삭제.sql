-- 시퀀스 삭제
DROP SEQUENCE AREA_SEQ; 
DROP SEQUENCE BOARD_SEQ; 
DROP SEQUENCE CERT_SEQ; 
DROP SEQUENCE COMMENTS_SEQ; 
DROP SEQUENCE INTEREST_SEQ; 
DROP SEQUENCE MEET_MEMBER_SEQ; 
DROP SEQUENCE MEET_SEQ; 
DROP SEQUENCE MEMBER_SEQ; 
DROP SEQUENCE MESSAGE_SEQ; 
DROP SEQUENCE POST_FILE_SEQ; 
DROP SEQUENCE POST_SEQ;
DROP SEQUENCE SNS_INFO_SEQ; 
DROP SEQUENCE TEAM_CHAT_SEQ; 
DROP SEQUENCE TEAM_COMMENTS_SEQ; 
DROP SEQUENCE TEAM_MEMBER_SEQ; 
DROP SEQUENCE TEAM_NOTE_SEQ; 
DROP SEQUENCE TEAM_POST_FILE_SEQ; 
DROP SEQUENCE TEAM_POST_SEQ; 
DROP SEQUENCE TEAM_SEQ; 

-- 테이블 삭제

DROP TABLE "AREA" CASCADE CONSTRAINTS;
DROP TABLE "MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "INTEREST" CASCADE CONSTRAINTS;
DROP TABLE "TEAM" CASCADE CONSTRAINTS;
DROP TABLE "TEAM_MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "BOARD" CASCADE CONSTRAINTS;
DROP TABLE "POST" CASCADE CONSTRAINTS;
DROP TABLE "TEAM_POST" CASCADE CONSTRAINTS;
DROP TABLE "MEET" CASCADE CONSTRAINTS;
DROP TABLE "POST_FILE" CASCADE CONSTRAINTS;
DROP TABLE "SNS_INFO" CASCADE CONSTRAINTS;
DROP TABLE "COMMENTS" CASCADE CONSTRAINTS;
DROP TABLE "MESSAGE" CASCADE CONSTRAINTS;
DROP TABLE "TEAM_CHAT" CASCADE CONSTRAINTS;
DROP TABLE "MEET_MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "TEAM_POST_FILE" CASCADE CONSTRAINTS;
DROP TABLE "TEAM_COMMENTS" CASCADE CONSTRAINTS;
DROP TABLE "TEAM_NOTE" CASCADE CONSTRAINTS;
DROP TABLE "CERT" CASCADE CONSTRAINTS;

