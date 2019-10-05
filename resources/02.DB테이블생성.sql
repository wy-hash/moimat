-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

--  Table Create SQL
CREATE TABLE area
(
    area_id             NUMBER          NOT NULL, 
    area_key            VARCHAR2(40)    NOT NULL, 
    area_name           VARCHAR2(40)    NOT NULL, 
    area_region_key     VARCHAR2(40)    NOT NULL, 
    area_region_name    VARCHAR2(40)    NOT NULL, 
    CONSTRAINT AREA_PK PRIMARY KEY (area_id)
);
COMMENT ON TABLE area IS '지역 관리 테이블 [ -- 약어 : area ]';
COMMENT ON COLUMN area.area_id IS 'PK';
COMMENT ON COLUMN area.area_key IS '지역의 코드';
COMMENT ON COLUMN area.area_name IS '지역의 이름';
COMMENT ON COLUMN area.area_region_key IS '상세 지역의 코드';
COMMENT ON COLUMN area.area_region_name IS '상세 지역의 이름';

ALTER TABLE area
    ADD CONSTRAINT UC_area_region_key UNIQUE (area_region_key);

--  Table Create SQL
CREATE TABLE member
(
    mem_id           NUMBER           NOT NULL, 
    mem_email        VARCHAR2(40)     NOT NULL, 
    mem_password     VARCHAR2(400)    NOT NULL, 
    mem_nickname     VARCHAR2(40)     NOT NULL, 
    mem_birthday     DATE             NOT NULL, 
    mem_gender       CHAR(1)          NOT NULL, 
    area_id          NUMBER           NOT NULL, 
    mem_regdate      DATE             NOT NULL, 
    mem_update       DATE             NOT NULL, 
    mem_lastlogin    DATE             NOT NULL, 
    mem_content      VARCHAR2(400)    NULL, 
    mem_photo        VARCHAR2(400)    NULL, 
    mem_level        NUMBER           NOT NULL, 
    mem_status       NUMBER           NOT NULL, 
    mem_int1         NUMBER           NOT NULL, 
    mem_int2         NUMBER           NOT NULL, 
    mem_int3         NUMBER           NOT NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (mem_id)
);
COMMENT ON TABLE member IS '회원 관리 테이블[ -- 약어 : mem ]';
COMMENT ON COLUMN member.mem_id IS 'PK';
COMMENT ON COLUMN member.mem_email IS '회원 이메일';
COMMENT ON COLUMN member.mem_password IS '회원 패스워드';
COMMENT ON COLUMN member.mem_nickname IS '회원 닉네임';
COMMENT ON COLUMN member.mem_birthday IS '생일';
COMMENT ON COLUMN member.mem_gender IS '성별 (female : F,  male : M)';
COMMENT ON COLUMN member.area_id IS '관심지역의 PK';
COMMENT ON COLUMN member.mem_regdate IS '회원 등록일';
COMMENT ON COLUMN member.mem_update IS '회원 최근 수정일';
COMMENT ON COLUMN member.mem_lastlogin IS '최근 로그인 시간';
COMMENT ON COLUMN member.mem_content IS '간단한 자기소개';
COMMENT ON COLUMN member.mem_photo IS '회원 이미지 경로';
COMMENT ON COLUMN member.mem_level IS '회원 등급( 9: 관리자, 8 : 부관리자, 1: 일반 사용자)';
COMMENT ON COLUMN member.mem_status IS '회원 상태 관리 1:회원,  0:탈퇴회원';
COMMENT ON COLUMN member.mem_int1 IS '관심사 1';
COMMENT ON COLUMN member.mem_int2 IS '관심사 2';
COMMENT ON COLUMN member.mem_int3 IS '관심사 3';
ALTER TABLE member
    ADD CONSTRAINT FK_member_area_id_area_area_id FOREIGN KEY (area_id)
        REFERENCES area (area_id);
ALTER TABLE member
    ADD CONSTRAINT UC_mem_email UNIQUE (mem_email);

--  Table Create SQL
CREATE TABLE interest
(
    int_id       NUMBER           NOT NULL, 
    int_key      VARCHAR2(40)     NOT NULL, 
    int_name     VARCHAR2(400)    NOT NULL, 
    int_order    NUMBER           NOT NULL, 
    int_use      CHAR(1)          NOT NULL, 
    CONSTRAINT INTEREST_PK PRIMARY KEY (int_id)
);
COMMENT ON TABLE interest IS '관심사 관리 테이블[ -- 약어 : int ]';
COMMENT ON COLUMN interest.int_id IS 'PK';
COMMENT ON COLUMN interest.int_key IS '관심사 그룹 코드';
COMMENT ON COLUMN interest.int_name IS '관심사 그룹 이름(ex: 메인/ 모임)';
COMMENT ON COLUMN interest.int_order IS '정렬 순서';
COMMENT ON COLUMN interest.int_use IS '사용 유무( 사용 :Y, 사용 안함 :N )';
ALTER TABLE interest
    ADD CONSTRAINT UC_int_key UNIQUE (int_key);

--  Table Create SQL
CREATE TABLE team
(
    team_id               NUMBER            NOT NULL, 
    int_id                NUMBER            NOT NULL, 
    team_name             VARCHAR2(40)      NOT NULL, 
    team_short_content    VARCHAR2(4000)    NOT NULL, 
    team_content          CLOB              NOT NULL, 
    area_id               NUMBER            NOT NULL, 
    team_regdate          DATE              NOT NULL, 
    team_max              NUMBER            NOT NULL, 
    mem_id                NUMBER            NOT NULL, 
    CONSTRAINT TEAM_PK PRIMARY KEY (team_id)
);
COMMENT ON TABLE team IS '모임 관리 테이블[ -- 약어 : team ]';
COMMENT ON COLUMN team.team_id IS 'PK';
COMMENT ON COLUMN team.int_id IS '모임의 주된 관심사 PK';
COMMENT ON COLUMN team.team_name IS '모임의 이름';
COMMENT ON COLUMN team.team_short_content IS '모임의 짧은 소개글';
COMMENT ON COLUMN team.team_content IS '모임의 소개글';
COMMENT ON COLUMN team.area_id IS '모임의 주 활동 지역의 PK';
COMMENT ON COLUMN team.team_regdate IS '모임 생성일';
COMMENT ON COLUMN team.team_max IS '모임의 최대인원';
COMMENT ON COLUMN team.mem_id IS '모임 생성한 회원 PK';
ALTER TABLE team
    ADD CONSTRAINT FK_team_int_id_interest_int_id FOREIGN KEY (int_id)
        REFERENCES interest (int_id);
ALTER TABLE team
    ADD CONSTRAINT FK_team_mem_id_member_mem_id FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);
ALTER TABLE team
    ADD CONSTRAINT FK_team_area_id_area_area_id FOREIGN KEY (area_id)
        REFERENCES area (area_id);

--  Table Create SQL
CREATE TABLE team_member
(
    tmem_id           NUMBER            NOT NULL, 
    team_id           NUMBER            NOT NULL, 
    mem_id            NUMBER            NOT NULL, 
    tmem_level        NUMBER            NOT NULL, 
    tmem_content      VARCHAR2(4000)    NOT NULL, 
    tmem_nickname     VARCHAR2(40)      NOT NULL, 
    tmem_email        VARCHAR2(40)      NOT NULL, 
    tmem_lastvisit    DATE              NOT NULL, 
    tmem_regdate      DATE              NOT NULL, 
    tmem_birthday     DATE              NOT NULL, 
    tmem_gender       CHAR(1)           NOT NULL, 
    tmem_photo        VARCHAR2(400)     NOT NULL, 
    CONSTRAINT TEAM_MEMBER_PK PRIMARY KEY (tmem_id)
);
COMMENT ON TABLE team_member IS '모임에 가입한 회원 관리 테이블[ -- 약어 : tmem ]';
COMMENT ON COLUMN team_member.tmem_id IS 'PK';
COMMENT ON COLUMN team_member.team_id IS '모임의 PK';
COMMENT ON COLUMN team_member.mem_id IS '모임에 가입한 회원의 PK';
COMMENT ON COLUMN team_member.tmem_level IS '모임에서 회원의 등급';
COMMENT ON COLUMN team_member.tmem_content IS '모임에서 회원의 간단한 자기소개';
COMMENT ON COLUMN team_member.tmem_nickname IS '모임에 가입한 회원의 닉네임';
COMMENT ON COLUMN team_member.tmem_email IS '모임에 가입한 회원의 이메일';
COMMENT ON COLUMN team_member.tmem_lastvisit IS '모임 최근 방문일';
COMMENT ON COLUMN team_member.tmem_regdate IS '모임에 가입한 날짜';
COMMENT ON COLUMN team_member.tmem_birthday IS '모임에 가입한 회원의 생일';
COMMENT ON COLUMN team_member.tmem_gender IS '모임에 가입한 회원의 성별';
COMMENT ON COLUMN team_member.tmem_photo IS '모임에 가입한 회원의 사진';
ALTER TABLE team_member
    ADD CONSTRAINT FK_team_member_team_id_team_te FOREIGN KEY (team_id)
        REFERENCES team (team_id);
ALTER TABLE team_member
    ADD CONSTRAINT FK_team_member_mem_id_member_m FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);

--  Table Create SQL
CREATE TABLE board
(
    brd_id       NUMBER           NOT NULL, 
    brd_key      VARCHAR2(40)     NOT NULL, 
    brd_name     VARCHAR2(400)    NOT NULL, 
    brd_order    NUMBER           NOT NULL, 
    brd_use      CHAR(1)          NOT NULL, 
    CONSTRAINT BOARD_PK PRIMARY KEY (brd_id)
);
COMMENT ON TABLE board IS '게시판 관리 테이블[ -- 약어 : brd ]';
COMMENT ON COLUMN board.brd_id IS 'PK';
COMMENT ON COLUMN board.brd_key IS '게시판 코드';
COMMENT ON COLUMN board.brd_name IS '게시판 이름';
COMMENT ON COLUMN board.brd_order IS '정렬 순서';
COMMENT ON COLUMN board.brd_use IS '사용 유무( 사용 :Y, 사용 안함 :N )';
ALTER TABLE board
    ADD CONSTRAINT UC_brd_key UNIQUE (brd_key);

--  Table Create SQL
CREATE TABLE post
(
    post_id          NUMBER           NOT NULL, 
    post_num         NUMBER           NULL, 
    brd_id           NUMBER           NOT NULL, 
    post_title       VARCHAR2(400)    NOT NULL, 
    post_content     CLOB             NOT NULL, 
    mem_id           NUMBER           NOT NULL, 
    post_nickname    VARCHAR2(40)     NOT NULL, 
    post_email       VARCHAR2(40)     NOT NULL, 
    post_regdate     DATE             NOT NULL, 
    post_update      DATE             NOT NULL, 
    post_hit         NUMBER           NOT NULL, 
    post_reply       CHAR(1)          NULL, 
    post_origin      NUMBER           NULL, 
    post_depth       NUMBER           NULL, 
    CONSTRAINT POST_PK PRIMARY KEY (post_id)
);
COMMENT ON TABLE post IS '게시물 관리 테이블[ -- 약어 : post ]';
COMMENT ON COLUMN post.post_id IS 'PK';
COMMENT ON COLUMN post.post_num IS '게시글 정렬을 위한 번호';
COMMENT ON COLUMN post.brd_id IS '게시판 테이블의 PK';
COMMENT ON COLUMN post.post_title IS '게시글 제목';
COMMENT ON COLUMN post.post_content IS '게시글 본문 내용';
COMMENT ON COLUMN post.mem_id IS '작성자의 PK';
COMMENT ON COLUMN post.post_nickname IS '작성자의 닉네임';
COMMENT ON COLUMN post.post_email IS '작성자의 이메일';
COMMENT ON COLUMN post.post_regdate IS '게시글 등록일';
COMMENT ON COLUMN post.post_update IS '게시글 수정일';
COMMENT ON COLUMN post.post_hit IS '게시글 조회수';
COMMENT ON COLUMN post.post_reply IS '질문답글 여부( 질문글 : Q, 답변글 A)';
COMMENT ON COLUMN post.post_origin IS '원글 번호';
COMMENT ON COLUMN post.post_depth IS '답글 이라면 1 그냥 글이라면 0';
ALTER TABLE post
    ADD CONSTRAINT FK_post_brd_id_board_brd_id FOREIGN KEY (brd_id)
        REFERENCES board (brd_id);
ALTER TABLE post
    ADD CONSTRAINT FK_post_mem_id_member_mem_id FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);

--  Table Create SQL
CREATE TABLE team_post
(
    post_id            NUMBER           NOT NULL, 
    post_num           NUMBER           NULL, 
    team_id            NUMBER           NOT NULL, 
    brd_id             NUMBER           NOT NULL, 
    post_title         VARCHAR2(400)    NOT NULL, 
    post_content       CLOB             NOT NULL, 
    tmem_id            NUMBER           NOT NULL, 
    post_tmem_level    NUMBER           NOT NULL, 
    post_nickname      VARCHAR2(40)     NOT NULL, 
    post_email         VARCHAR2(40)     NOT NULL, 
    post_regdate       DATE             NOT NULL, 
    post_update        DATE             NOT NULL, 
    post_hit           NUMBER           NOT NULL, 
    post_like          NUMBER           NULL, 
    post_dislike       NUMBER           NULL, 
    CONSTRAINT TEAM_POST_PK PRIMARY KEY (post_id)
);
COMMENT ON TABLE team_post IS '모임 게시물 관리 테이블[ -- 약어 : post ]';
COMMENT ON COLUMN team_post.post_id IS 'PK';
COMMENT ON COLUMN team_post.post_num IS '모임의 게시글 정렬을 위한 번호';
COMMENT ON COLUMN team_post.team_id IS '모임의 PK';
COMMENT ON COLUMN team_post.brd_id IS '모임의 게시판 테이블의 PK';
COMMENT ON COLUMN team_post.post_title IS '모임의 게시글 제목';
COMMENT ON COLUMN team_post.post_content IS '모임의 게시글 본문내용';
COMMENT ON COLUMN team_post.tmem_id IS '모임의 게시글 작성자의 PK';
COMMENT ON COLUMN team_post.post_tmem_level IS '모임의 작성자의 모임 등급';
COMMENT ON COLUMN team_post.post_nickname IS '모임의 게시글 작성자의 닉네임';
COMMENT ON COLUMN team_post.post_email IS '모임의 게시글 작성자의 이메일';
COMMENT ON COLUMN team_post.post_regdate IS '모임의 게시글 등록일';
COMMENT ON COLUMN team_post.post_update IS '모임의 게시글 수정일';
COMMENT ON COLUMN team_post.post_hit IS '모임의 게시글 조회수';
COMMENT ON COLUMN team_post.post_like IS '모임의 게시글 좋아요 수';
COMMENT ON COLUMN team_post.post_dislike IS '모임의 게시글 싫어요 수';
ALTER TABLE team_post
    ADD CONSTRAINT FK_team_post_brd_id_board_brd_ FOREIGN KEY (brd_id)
        REFERENCES board (brd_id);
ALTER TABLE team_post
    ADD CONSTRAINT FK_team_post_team_id_team_team FOREIGN KEY (team_id)
        REFERENCES team (team_id);
ALTER TABLE team_post
    ADD CONSTRAINT FK_team_post_tmem_id_team_memb FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);

--  Table Create SQL
CREATE TABLE meet
(
    meet_id          NUMBER            NOT NULL, 
    team_id          NUMBER            NOT NULL, 
    meet_title       VARCHAR2(400)     NOT NULL, 
    meet_content     CLOB              NOT NULL, 
    meet_date        DATE              NOT NULL, 
    meet_regdate     DATE              NOT NULL, 
    meet_max         NUMBER            NOT NULL, 
    meet_pay         VARCHAR2(40)      NOT NULL, 
    tmem_id          NUMBER            NOT NULL, 
    meet_nickname    VARCHAR2(40)      NOT NULL, 
    meet_email       VARCHAR2(40)      NOT NULL, 
    meet_area        VARCHAR2(400)     NOT NULL, 
    meet_photo       VARCHAR2(4000)    NOT NULL, 
    CONSTRAINT MEET_PK PRIMARY KEY (meet_id)
);
COMMENT ON TABLE meet IS '모임 정모 관리 테이블[ -- 약어 : meet ]';
COMMENT ON COLUMN meet.meet_id IS 'PK';
COMMENT ON COLUMN meet.team_id IS '정모가 열리는 모임의 PK';
COMMENT ON COLUMN meet.meet_title IS '정모 제목';
COMMENT ON COLUMN meet.meet_content IS '정모 내용';
COMMENT ON COLUMN meet.meet_date IS '정모 일자';
COMMENT ON COLUMN meet.meet_regdate IS '정모 등록일';
COMMENT ON COLUMN meet.meet_max IS '정모 최대인원';
COMMENT ON COLUMN meet.meet_pay IS '정모 회비';
COMMENT ON COLUMN meet.tmem_id IS '정모 등록한 회원의 PK';
COMMENT ON COLUMN meet.meet_nickname IS '정모 등록한 회원의 닉네임';
COMMENT ON COLUMN meet.meet_email IS '정모 등록한 회원의 이메일';
COMMENT ON COLUMN meet.meet_area IS '정모 지역';
COMMENT ON COLUMN meet.meet_photo IS '정모 등록한 회원의 사진';
ALTER TABLE meet
    ADD CONSTRAINT FK_meet_team_id_team_team_id FOREIGN KEY (team_id)
        REFERENCES team (team_id);
ALTER TABLE meet
    ADD CONSTRAINT FK_meet_tmem_id_team_member_tm FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);

--  Table Create SQL
CREATE TABLE post_file
(
    pfi_id            NUMBER            NOT NULL, 
    post_id           NUMBER            NOT NULL, 
    brd_id            NUMBER            NOT NULL, 
    mem_id            NUMBER            NOT NULL, 
    pfi_originname    VARCHAR2(4000)    NOT NULL, 
    pfi_filename      VARCHAR2(4000)    NOT NULL, 
    pfi_filesize      NUMBER            NULL, 
    pfi_width         NUMBER            NULL, 
    pfi_height        NUMBER            NULL, 
    pfi_type          VARCHAR2(10)      NULL, 
    pfi_is_image      NUMBER            NULL, 
    pfi_regdate       DATE              NOT NULL, 
    CONSTRAINT POST_FILE_PK PRIMARY KEY (pfi_id)
);
COMMENT ON TABLE post_file IS '첨부파일 관리 테이블[ -- 약어 : pfi ]';
COMMENT ON COLUMN post_file.pfi_id IS 'PK';
COMMENT ON COLUMN post_file.post_id IS '게시물(post) 테이블의 PK';
COMMENT ON COLUMN post_file.brd_id IS '게시판(board) 테이블의 PK';
COMMENT ON COLUMN post_file.mem_id IS '파일 업로드한 회원 PK';
COMMENT ON COLUMN post_file.pfi_originname IS '파일 업로드시 원래 파일명';
COMMENT ON COLUMN post_file.pfi_filename IS '파일 업로드시 서버에 저장된 파일명';
COMMENT ON COLUMN post_file.pfi_filesize IS '파일 크기';
COMMENT ON COLUMN post_file.pfi_width IS '이미지일 경우 이미지 가로 값';
COMMENT ON COLUMN post_file.pfi_height IS '이미지일 경우 이미지 세로 값';
COMMENT ON COLUMN post_file.pfi_type IS '파일 확장자';
COMMENT ON COLUMN post_file.pfi_is_image IS '이미지 여부';
COMMENT ON COLUMN post_file.pfi_regdate IS '등록일자';
ALTER TABLE post_file
    ADD CONSTRAINT FK_post_file_brd_id_board_brd_ FOREIGN KEY (brd_id)
        REFERENCES board (brd_id);
ALTER TABLE post_file
    ADD CONSTRAINT FK_post_file_post_id_post_post FOREIGN KEY (post_id)
        REFERENCES post (post_id);
ALTER TABLE post_file
    ADD CONSTRAINT FK_post_file_mem_id_member_mem FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);

--  Table Create SQL
CREATE TABLE sns_info
(
    mem_id              NUMBER           NOT NULL, 
    sns_id              VARCHAR2(400)    NOT NULL, 
    sns_type            VARCHAR2(40)     NULL, 
    sns_name            VARCHAR2(400)    NULL, 
    sns_profile         VARCHAR2(400)    NULL, 
    sns_connect_date    DATE             NULL, 
    CONSTRAINT SNS_INFO_PK PRIMARY KEY (mem_id)
);
COMMENT ON TABLE sns_info IS '네이버 아이디로 로그인 (네아로) 사용자 정보를 저장하기 위한 테이블 https://developers.naver.com/docs/login/devguide/';
COMMENT ON COLUMN sns_info.mem_id IS 'member 테이블의 PK';
ALTER TABLE sns_info
    ADD CONSTRAINT FK_sns_info_mem_id_member_mem_ FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);
ALTER TABLE sns_info
    ADD CONSTRAINT UC_sns_id UNIQUE (sns_id);

--  Table Create SQL
CREATE TABLE comments
(
    cmt_id          NUMBER            NOT NULL, 
    post_id         NUMBER            NOT NULL, 
    brd_id          NUMBER            NOT NULL, 
    cmt_num         NUMBER            NULL, 
    cmt_content     VARCHAR2(4000)    NOT NULL, 
    mem_id          NUMBER            NOT NULL, 
    cmt_nickname    VARCHAR2(400)     NOT NULL, 
    cmt_email       VARCHAR2(400)     NOT NULL, 
    cmt_regdate     DATE              NOT NULL, 
    cmt_update      DATE              NOT NULL, 
    CONSTRAINT COMMENTS_PK PRIMARY KEY (cmt_id)
);
COMMENT ON TABLE comments IS '댓글 관리 테이블[ -- 약어 : cmt ]';
COMMENT ON COLUMN comments.cmt_id IS 'PK';
COMMENT ON COLUMN comments.post_id IS '게시물(post) 테이블의 PK';
COMMENT ON COLUMN comments.brd_id IS '게시판(board) 테이블의 PK';
COMMENT ON COLUMN comments.cmt_num IS '댓글 정렬을 위한 필드';
COMMENT ON COLUMN comments.cmt_content IS '댓글 내용';
COMMENT ON COLUMN comments.mem_id IS '댓글 입력한 회원의 PK';
COMMENT ON COLUMN comments.cmt_nickname IS '댓글 입력한 회원의 닉네임';
COMMENT ON COLUMN comments.cmt_email IS '댓글 입력한 회원의 이메일';
COMMENT ON COLUMN comments.cmt_regdate IS '댓글 등록일';
COMMENT ON COLUMN comments.cmt_update IS '댓글 수정일';
ALTER TABLE comments
    ADD CONSTRAINT FK_comments_brd_id_board_brd_i FOREIGN KEY (brd_id)
        REFERENCES board (brd_id);
ALTER TABLE comments
    ADD CONSTRAINT FK_comments_post_id_post_post_ FOREIGN KEY (post_id)
        REFERENCES post (post_id);
ALTER TABLE comments
    ADD CONSTRAINT FK_comments_mem_id_member_mem_ FOREIGN KEY (mem_id)
        REFERENCES member (mem_id);

--  Table Create SQL
CREATE TABLE message
(
    msg_id          NUMBER            NOT NULL, 
    send_mem_id     NUMBER            NOT NULL, 
    recv_mem_id     NUMBER            NOT NULL, 
    msg_title       VARCHAR2(400)     NOT NULL, 
    msg_content     VARCHAR2(4000)    NOT NULL, 
    msg_regdate     DATE              NOT NULL, 
    msg_readdate    DATE              NULL, 
    CONSTRAINT MESSAGE_PK PRIMARY KEY (msg_id)
);
COMMENT ON TABLE message IS '메세지 관리 테이블[ -- 약어 : msg ]';
COMMENT ON COLUMN message.msg_id IS 'PK';
COMMENT ON COLUMN message.send_mem_id IS '메세지 발신 회원 PK';
COMMENT ON COLUMN message.recv_mem_id IS '메세지 수신 회원 PK';
COMMENT ON COLUMN message.msg_title IS '메세지 제목';
COMMENT ON COLUMN message.msg_content IS '메세지 내용';
COMMENT ON COLUMN message.msg_regdate IS '메세지 발신 일자';
COMMENT ON COLUMN message.msg_readdate IS '메세지 읽은 일자';
ALTER TABLE message
    ADD CONSTRAINT FK_message_send_mem_id_member_ FOREIGN KEY (send_mem_id)
        REFERENCES member (mem_id);
ALTER TABLE message
    ADD CONSTRAINT FK_message_recv_mem_id_member_ FOREIGN KEY (recv_mem_id)
        REFERENCES member (mem_id);

--  Table Create SQL
CREATE TABLE team_chat
(
    chat_id         NUMBER           NOT NULL, 
    team_id         NUMBER           NOT NULL, 
    tmem_id         NUMBER           NOT NULL, 
    chat_content    VARCHAR2(400)    NOT NULL, 
    chat_regdate    DATE             NOT NULL, 
    CONSTRAINT TEAM_CHAT_PK PRIMARY KEY (chat_id)
);
COMMENT ON TABLE team_chat IS '모임 채팅 관리 테이블[ -- 약어 : chat ]';
COMMENT ON COLUMN team_chat.chat_id IS 'PK';
COMMENT ON COLUMN team_chat.team_id IS '모임 테이블의 PK';
COMMENT ON COLUMN team_chat.tmem_id IS '채팅 작성자 PK';
COMMENT ON COLUMN team_chat.chat_content IS '채팅 내용';
COMMENT ON COLUMN team_chat.chat_regdate IS '채팅 생성일';
ALTER TABLE team_chat
    ADD CONSTRAINT FK_team_chat_team_id_team_team FOREIGN KEY (team_id)
        REFERENCES team (team_id);
ALTER TABLE team_chat
    ADD CONSTRAINT FK_team_chat_tmem_id_team_memb FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);

--  Table Create SQL
CREATE TABLE meet_member
(
    mmem_id          NUMBER           NOT NULL, 
    meet_id          NUMBER           NOT NULL, 
    tmem_id          NUMBER           NOT NULL, 
    mmem_nickname    VARCHAR2(40)     NOT NULL, 
    mmem_email       VARCHAR2(40)     NOT NULL, 
    mmem_photo       VARCHAR2(400)    NOT NULL, 
    CONSTRAINT MEET_MEMBER_PK PRIMARY KEY (mmem_id)
);
COMMENT ON TABLE meet_member IS '정모에 참여하는 모임원 관리 테이블[ -- 약어 : mmem ]';
COMMENT ON COLUMN meet_member.mmem_id IS 'PK';
COMMENT ON COLUMN meet_member.meet_id IS '정모의 PK';
COMMENT ON COLUMN meet_member.tmem_id IS '정모 참여하는 모임원의 PK';
COMMENT ON COLUMN meet_member.mmem_nickname IS '정모 참여하는 모임원의 닉네임';
COMMENT ON COLUMN meet_member.mmem_email IS '정모 참여하는 모임원의 이메일';
COMMENT ON COLUMN meet_member.mmem_photo IS '정모 참여하는 모임원의 사진';
ALTER TABLE meet_member
    ADD CONSTRAINT FK_meet_member_meet_id_meet_me FOREIGN KEY (meet_id)
        REFERENCES meet (meet_id);
ALTER TABLE meet_member
    ADD CONSTRAINT FK_meet_member_tmem_id_team_me FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);
-- meet_member Table -> (정모 PK, 모임원의 PK) Unique 제약조건 추가 (동일한 정모에 한하여 같은 모임원 등록 불가하도록) 
ALTER TABLE meet_member
    ADD CONSTRAINT UC_meet_id_tmem_id UNIQUE (meet_id, tmem_id);

--  Table Create SQL
CREATE TABLE team_post_file
(
    pfi_id            NUMBER            NOT NULL, 
    post_id           NUMBER            NOT NULL, 
    brd_id            NUMBER            NOT NULL, 
    tmem_id           NUMBER            NOT NULL, 
    pfi_originname    VARCHAR2(4000)    NOT NULL, 
    pfi_filename      VARCHAR2(4000)    NOT NULL, 
    pfi_filesize      NUMBER            NULL, 
    pfi_width         NUMBER            NULL, 
    pfi_height        NUMBER            NULL, 
    pfi_type          VARCHAR2(10)      NULL, 
    pfi_is_image      NUMBER            NULL, 
    pfi_regdate       DATE              NOT NULL, 
    CONSTRAINT TEAM_POST_FILE_PK PRIMARY KEY (pfi_id)
);
COMMENT ON TABLE team_post_file IS '첨부파일 관리 테이블[ -- 약어 : pfi ]';
COMMENT ON COLUMN team_post_file.pfi_id IS 'PK';
COMMENT ON COLUMN team_post_file.post_id IS '게시물(post) 테이블의 PK';
COMMENT ON COLUMN team_post_file.brd_id IS '게시판(board) 테이블의 PK';
COMMENT ON COLUMN team_post_file.tmem_id IS '파일 업로드한 회원 PK';
COMMENT ON COLUMN team_post_file.pfi_originname IS '파일 업로드시 원래 파일명';
COMMENT ON COLUMN team_post_file.pfi_filename IS '파일 업로드시 서버에 저장된 파일명';
COMMENT ON COLUMN team_post_file.pfi_filesize IS '파일 크기';
COMMENT ON COLUMN team_post_file.pfi_width IS '이미지일 경우 이미지 가로 값';
COMMENT ON COLUMN team_post_file.pfi_height IS '이미지일 경우 이미지 세로 값';
COMMENT ON COLUMN team_post_file.pfi_type IS '파일 확장자';
COMMENT ON COLUMN team_post_file.pfi_is_image IS '이미지 여부';
COMMENT ON COLUMN team_post_file.pfi_regdate IS '등록일자';
ALTER TABLE team_post_file
    ADD CONSTRAINT FK_team_post_file_post_id_team FOREIGN KEY (post_id)
        REFERENCES team_post (post_id);
ALTER TABLE team_post_file
    ADD CONSTRAINT FK_team_post_file_brd_id_board FOREIGN KEY (brd_id)
        REFERENCES board (brd_id);
ALTER TABLE team_post_file
    ADD CONSTRAINT FK_team_post_file_tmem_id_team FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);

--  Table Create SQL
CREATE TABLE team_comments
(
    cmt_id          NUMBER            NOT NULL, 
    post_id         NUMBER            NOT NULL, 
    brd_id          NUMBER            NOT NULL, 
    cmt_num         NUMBER            NULL, 
    cmt_content     VARCHAR2(4000)    NOT NULL, 
    tmem_id         NUMBER            NOT NULL, 
    cmt_nickname    VARCHAR2(40)      NOT NULL, 
    cmt_email       VARCHAR2(40)      NOT NULL, 
    cmt_regdate     DATE              NOT NULL, 
    cmt_update      DATE              NOT NULL, 
    cmt_like        NUMBER            NULL, 
    cmt_dislike     NUMBER            NULL, 
    CONSTRAINT TEAM_COMMENTS_PK PRIMARY KEY (cmt_id)
);
COMMENT ON TABLE team_comments IS '댓글 관리 테이블[ -- 약어 : cmt ]';
COMMENT ON COLUMN team_comments.cmt_id IS 'PK';
COMMENT ON COLUMN team_comments.post_id IS '게시물(post) 테이블의 PK';
COMMENT ON COLUMN team_comments.brd_id IS '게시판(board) 테이블의 PK';
COMMENT ON COLUMN team_comments.cmt_num IS '댓글 정렬을 위한 필드';
COMMENT ON COLUMN team_comments.cmt_content IS '댓글 내용';
COMMENT ON COLUMN team_comments.tmem_id IS '댓글 입력한 회원의 PK';
COMMENT ON COLUMN team_comments.cmt_nickname IS '댓글 입력한 회원의 닉네임';
COMMENT ON COLUMN team_comments.cmt_email IS '댓글 입력한 회원의 이메일';
COMMENT ON COLUMN team_comments.cmt_regdate IS '댓글 등록일';
COMMENT ON COLUMN team_comments.cmt_update IS '댓글 수정일';
COMMENT ON COLUMN team_comments.cmt_like IS '댓글 좋아요 수';
COMMENT ON COLUMN team_comments.cmt_dislike IS '댓글 싫어요 수';
ALTER TABLE team_comments
    ADD CONSTRAINT FK_team_comments_post_id_team_ FOREIGN KEY (post_id)
        REFERENCES team_post (post_id);
ALTER TABLE team_comments
    ADD CONSTRAINT FK_team_comments_brd_id_board_ FOREIGN KEY (brd_id)
        REFERENCES board (brd_id);
ALTER TABLE team_comments
    ADD CONSTRAINT FK_team_comments_tmem_id_team_ FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);

--  Table Create SQL
CREATE TABLE team_note
(
    tno_id          NUMBER           NOT NULL, 
    team_id         NUMBER           NOT NULL, 
    tno_content     VARCHAR2(400)    NOT NULL, 
    tmem_id         NUMBER           NOT NULL, 
    tno_nickname    VARCHAR2(40)     NOT NULL, 
    tno_email       VARCHAR2(40)     NOT NULL, 
    tno_regdate     DATE             NOT NULL, 
    CONSTRAINT TEAM_NOTE_PK PRIMARY KEY (tno_id)
);
COMMENT ON TABLE team_note IS '모임 한줄평[ -- 약어 : tno ]';
COMMENT ON COLUMN team_note.tno_id IS 'PK';
COMMENT ON COLUMN team_note.team_id IS '모임의 PK';
COMMENT ON COLUMN team_note.tno_content IS '한줄평 내용';
COMMENT ON COLUMN team_note.tmem_id IS '한줄평 작성자의 PK';
COMMENT ON COLUMN team_note.tno_nickname IS '한줄평 작성자의 닉네임';
COMMENT ON COLUMN team_note.tno_email IS '한줄평 작성자의 이메일';
COMMENT ON COLUMN team_note.tno_regdate IS '한줄평 등록일';
ALTER TABLE team_note
    ADD CONSTRAINT FK_team_note_team_id_team_team FOREIGN KEY (team_id)
        REFERENCES team (team_id);
ALTER TABLE team_note
    ADD CONSTRAINT FK_team_note_tmem_id_team_memb FOREIGN KEY (tmem_id)
        REFERENCES team_member (tmem_id);

--  Table Create SQL
CREATE TABLE cert
(
    cert_id         NUMBER          NOT NULL, 
    cert_code       VARCHAR2(40)    NOT NULL, 
    cert_email      VARCHAR2(40)    NOT NULL, 
    cert_regdate    DATE            NOT NULL, 
    CONSTRAINT CERT_PK PRIMARY KEY (cert_id)
);
COMMENT ON TABLE cert IS '이메일 인증 관리 테이블[ -- 약어 : cert ]';
COMMENT ON COLUMN cert.cert_id IS 'PK';
COMMENT ON COLUMN cert.cert_code IS '인증코드';
COMMENT ON COLUMN cert.cert_email IS '이메일';
COMMENT ON COLUMN cert.cert_regdate IS '등록일';

