-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- member Table Create SQL
CREATE TABLE member
(
    seq             NUMBER           NOT NULL, 
    id              VARCHAR2(50)     NOT NULL, 
    password        VARCHAR2(100)    NOT NULL, 
    name            VARCHAR2(50)     NOT NULL, 
    birthday        DATE             NOT NULL, 
    email           VARCHAR2(100)    NOT NULL, 
    area            VARCHAR2(100)    NOT NULL, 
    phone_number    VARCHAR2(13)     NOT NULL, 
    state           char(1)          NOT NULL, 
    regdate         DATE             NOT NULL, 
    updatedate      DATE             NOT NULL, 
    photo           VARCHAR2(400)    NOT NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (seq)
);

-- member Table Create SQL
CREATE TABLE interest
(
    seq      NUMBER          NOT NULL, 
    key      VARCHAR2(50)    NOT NULL, 
    value    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT INTEREST_PK PRIMARY KEY (seq)
);

-- member Table Create SQL
CREATE TABLE team
(
    seq              NUMBER            NOT NULL, 
    interest_seq     NUMBER            NOT NULL, 
    name             VARCHAR2(50)      NOT NULL, 
    content          VARCHAR2(4000)    NOT NULL, 
    short_content    VARCHAR2(400)     NOT NULL, 
    regdate          DATE              NOT NULL, 
    area             VARCHAR2(100)     NOT NULL, 
    maxperson        NUMBER            NOT NULL, 
    CONSTRAINT TEAM_PK PRIMARY KEY (seq)
);

ALTER TABLE team
    ADD CONSTRAINT FK_team_interest_seq_interest_ FOREIGN KEY (interest_seq)
        REFERENCES interest (seq);

-- member Table Create SQL
CREATE TABLE post_type
(
    seq      NUMBER           NOT NULL, 
    key      VARCHAR2( 50)    NOT NULL, 
    value    VARCHAR2(50)     NOT NULL, 
    CONSTRAINT POST_TYPE_PK PRIMARY KEY (seq)
);

-- member Table Create SQL
CREATE TABLE post
(
    seq              NUMBER            NOT NULL, 
    post_type_seq    NUMBER            NULL, 
    title            VARCHAR2(100)     NOT NULL, 
    content          VARCHAR2(4000)    NOT NULL, 
    regdate          DATE              NOT NULL, 
    updatedate       DATE              NOT NULL, 
    count            NUMBER            NOT NULL, 
    member_seq       NUMBER            NOT NULL, 
    orgin            NUMBER            NOT NULL, 
    priority         NUMBER            NOT NULL, 
    depth            NUMBER            NOT NULL, 
    CONSTRAINT POST_PK PRIMARY KEY (seq)
);

ALTER TABLE post
    ADD CONSTRAINT FK_post_post_type_seq_post_typ FOREIGN KEY (post_type_seq)
        REFERENCES post_type (seq);

ALTER TABLE post
    ADD CONSTRAINT FK_post_member_seq_member_seq FOREIGN KEY (member_seq)
        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE reply
(
    seq           NUMBER           NOT NULL, 
    member_seq    NUMBER           NOT NULL, 
    talk          VARCHAR2(400)    NOT NULL, 
    regdate       DATE             NOT NULL, 
    updatedate    DATE             NOT NULL, 
    CONSTRAINT REPLY_PK PRIMARY KEY (seq)
);

ALTER TABLE reply
    ADD CONSTRAINT FK_reply_member_seq_member_seq FOREIGN KEY (member_seq)
        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE role
(
    seq      NUMBER          NOT NULL, 
    key      VARCHAR2(50)    NOT NULL, 
    value    VARCHAR2(50)    NOT NULL, 
    CONSTRAINT ROLE_PK PRIMARY KEY (seq)
);

-- member Table Create SQL
CREATE TABLE meet
(
    seq           NUMBER           NOT NULL, 
    team_seq      NUMBER           NOT NULL, 
    area          VARCHAR2(100)    NOT NULL, 
    meetdate      DATE             NOT NULL, 
    regdate       DATE             NOT NULL, 
    updatedate    DATE             NOT NULL, 
    maxperson     NUMBER           NOT NULL, 
--    member_seq    NUMBER           NOT NULL,  -- 정모 주최자 -- MeetTable_Update.sql로 따로 추가
    CONSTRAINT MEET_PK PRIMARY KEY (seq)
);

ALTER TABLE meet
    ADD CONSTRAINT FK_meet_team_seq_team_seq FOREIGN KEY (team_seq)
        REFERENCES team (seq);

-- ALTER TABLE meet
--    ADD CONSTRAINT FK_meet_member_seq_member_seq FOREIGN KEY (member_seq)
--        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE member_role
(
    member_seq    NUMBER    NOT NULL, 
    role_seq      NUMBER    NOT NULL, 
    CONSTRAINT MEMBER_ROLE_PK PRIMARY KEY (member_seq, role_seq)
);

ALTER TABLE member_role
    ADD CONSTRAINT FK_member_role_role_seq_role_s FOREIGN KEY (role_seq)
        REFERENCES role (seq);

ALTER TABLE member_role
    ADD CONSTRAINT FK_member_role_member_seq_memb FOREIGN KEY (member_seq)
        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE team_post
(
    team_seq         NUMBER    NOT NULL, 
    post_type_seq    NUMBER    NOT NULL, 
    post_seq         NUMBER    NOT NULL, 
    CONSTRAINT TEAM_POST_PK PRIMARY KEY (team_seq, post_type_seq, post_seq)
);

ALTER TABLE team_post
    ADD CONSTRAINT FK_team_post_post_seq_post_seq FOREIGN KEY (post_seq)
        REFERENCES post (seq);

ALTER TABLE team_post
    ADD CONSTRAINT FK_team_post_team_seq_team_seq FOREIGN KEY (team_seq)
        REFERENCES team (seq);

ALTER TABLE team_post
    ADD CONSTRAINT FK_team_post_post_type_seq_pos FOREIGN KEY (post_type_seq)
        REFERENCES post_type (seq);

-- member Table Create SQL
CREATE TABLE chat
(
    seq           NUMBER           NOT NULL, 
    member_seq    NUMBER           NOT NULL, 
    team_seq      NUMBER           NOT NULL, 
    content       VARCHAR2(400)    NOT NULL, 
    regdate       DATE             NOT NULL, 
    CONSTRAINT CHAT_PK PRIMARY KEY (seq)
);

ALTER TABLE chat
    ADD CONSTRAINT FK_chat_team_seq_team_seq FOREIGN KEY (team_seq)
        REFERENCES team (seq);

ALTER TABLE chat
    ADD CONSTRAINT FK_chat_member_seq_member_seq FOREIGN KEY (member_seq)
        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE team_member
(
    team_seq      NUMBER    NOT NULL, 
    member_seq    NUMBER    NOT NULL, 
    role_seq      NUMBER    NOT NULL, 
    CONSTRAINT TEAM_MEMBER_PK PRIMARY KEY (team_seq, member_seq, role_seq)
);

ALTER TABLE team_member
    ADD CONSTRAINT FK_team_member_member_seq_memb FOREIGN KEY (member_seq)
        REFERENCES member (seq);

ALTER TABLE team_member
    ADD CONSTRAINT FK_team_member_team_seq_team_s FOREIGN KEY (team_seq)
        REFERENCES team (seq);

ALTER TABLE team_member
    ADD CONSTRAINT FK_team_member_role_seq_role_s FOREIGN KEY (role_seq)
        REFERENCES role (seq);

-- member Table Create SQL
CREATE TABLE message
(
    seq                NUMBER           NOT NULL, 
    member_seq         NUMBER           NOT NULL, 
    content            VARCHAR2(400)    NOT NULL, 
    from_member_seq    NUMBER           NOT NULL, 
    regdate            DATE             NOT NULL, 
    opendate           DATE             , 
    CONSTRAINT MESSAGE_PK PRIMARY KEY (seq)
);

ALTER TABLE message
    ADD CONSTRAINT FK_message_member_seq_member_s FOREIGN KEY (member_seq)
        REFERENCES member (seq);


-- member Table Create SQL
CREATE TABLE meet_member
(
    meet_seq      NUMBER    NOT NULL, 
    member_seq    NUMBER    NOT NULL, 
    CONSTRAINT MEET_MEMBER_PK PRIMARY KEY (meet_seq, member_seq)
);

ALTER TABLE meet_member
    ADD CONSTRAINT FK_meet_member_meet_seq_meet_s FOREIGN KEY (meet_seq)
        REFERENCES meet (seq);

ALTER TABLE meet_member
    ADD CONSTRAINT FK_meet_member_member_seq_memb FOREIGN KEY (member_seq)
        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE member_interest
(
    member_seq      NUMBER    NOT NULL, 
    interest_seq    NUMBER    NOT NULL, 
    CONSTRAINT MEMBER_INTEREST_PK PRIMARY KEY (member_seq, interest_seq)
);

ALTER TABLE member_interest
    ADD CONSTRAINT FK_member_interest_interest_se FOREIGN KEY (interest_seq)
        REFERENCES interest (seq);

ALTER TABLE member_interest
    ADD CONSTRAINT FK_member_interest_member_seq_ FOREIGN KEY (member_seq)
        REFERENCES member (seq);

-- member Table Create SQL
CREATE TABLE post_reply
(
    post_seq     NUMBER    NOT NULL, 
    reply_seq    NUMBER    NOT NULL, 
    CONSTRAINT POST_REPLY_PK PRIMARY KEY (post_seq, reply_seq)
);

ALTER TABLE post_reply
    ADD CONSTRAINT FK_post_reply_post_seq_post_se FOREIGN KEY (post_seq)
        REFERENCES post (seq);

ALTER TABLE post_reply
    ADD CONSTRAINT FK_post_reply_reply_seq_reply_ FOREIGN KEY (reply_seq)
        REFERENCES reply (seq);

-- member Table Create SQL
CREATE TABLE team_reply
(
    team_seq     NUMBER    NOT NULL, 
    reply_seq    NUMBER    NOT NULL, 
    CONSTRAINT TEAM_REPLY_PK PRIMARY KEY (team_seq, reply_seq)
);

ALTER TABLE team_reply
    ADD CONSTRAINT FK_team_reply_team_seq_team_se FOREIGN KEY (team_seq)
        REFERENCES team (seq);

ALTER TABLE team_reply
    ADD CONSTRAINT FK_team_reply_reply_seq_reply_ FOREIGN KEY (reply_seq)
        REFERENCES reply (seq);

-- member Table Create SQL
CREATE TABLE team_post_reply
(
    post_seq     NUMBER    NOT NULL, 
    reply_seq    NUMBER    NOT NULL, 
    CONSTRAINT TEAM_POST_REPLY_PK PRIMARY KEY (post_seq, reply_seq)
);

ALTER TABLE team_post_reply
    ADD CONSTRAINT FK_team_post_reply_reply_seq_r FOREIGN KEY (reply_seq)
        REFERENCES reply (seq);

ALTER TABLE team_post_reply
    ADD CONSTRAINT FK_team_post_reply_post_seq_po FOREIGN KEY (post_seq)
        REFERENCES post (seq);

-- member Table Create SQL
CREATE TABLE attach
(
    fullName    VARCHAR2(150)    NOT NULL, 
    post_seq    NUMBER           NOT NULL, 
    regdate     DATE             NOT NULL, 
    CONSTRAINT ATTACH_PK PRIMARY KEY (fullName)
);

ALTER TABLE attach
    ADD CONSTRAINT FK_attach_post_seq_post_seq FOREIGN KEY (post_seq)
        REFERENCES post (seq);