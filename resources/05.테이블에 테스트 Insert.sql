-- 관심사 테스트 데이터 입력 
insert into interest(INT_ID, INT_KEY, INT_NAME, INT_ORDER, INT_USE)
values(interest_seq.nextval, 'IN'||LPAD(interest_seq.currval, 2, 0), '관심사'||interest_seq.currval, 0, 'Y');

-- 게시판 테스트 데이터 입력 
insert into board(BRD_ID, BRD_KEY, BRD_NAME, BRD_ORDER, BRD_USE)
values(board_seq.nextval, 'BO'||LPAD(board_seq.currval, 2, 0), '공지사항', 0, 'Y');


-- 회원 테스트 데이터 입력
insert into member
(
MEM_ID, MEM_EMAIL, MEM_PASSWORD, MEM_NICKNAME, MEM_BIRTHDAY,
MEM_GENDER, AREA_ID, MEM_REGDATE, MEM_UPDATE, MEM_LASTLOGIN,
MEM_CONTENT, MEM_PHOTO, MEM_LEVEL, MEM_STATUS,
MEM_INT1, MEM_INT2, MEM_INT3
)
values 
(
member_seq.nextval, 'test'||member_seq.currval||'@gmail.com', 'pwd'||member_seq.currval, 'nickname', '19700101',
'M', 1, sysdate, sysdate, sysdate,
'테스트 아이디 생성합니다.', '', 1, 1,
1,2,3
);

-- 공지사항 게시물 테스트 데이터 삽입
insert into post
(
POST_ID, POST_NUM, BRD_ID, POST_TITLE, POST_CONTENT,
MEM_ID, POST_NICKNAME, POST_EMAIL, POST_REGDATE, POST_UPDATE,
POST_HIT, POST_REPLY, POST_ORIGIN, POST_DEPTH
)
values
(
POST_SEQ.nextval, 0, 1, '공지사항 제목입니다.', '공지사항 내용입니다.',
1, 'nickname', 'test1@gmail.com', sysdate, sysdate,
0, '', POST_SEQ.currval, 0
);

-- 게시글에 덧글이 달릴 경우 
INSERT INTO COMMENTS(
    CMT_ID, POST_ID, BRD_ID, CMT_NUM, CMT_CONTENT,
    MEM_ID, CMT_NICKNAME, CMT_EMAIL, CMT_REGDATE, CMT_UPDATE
)
VALUES(
    comments_seq.nextval, 1, 1, 0, '덧글 내용입니다',
    1, '덧글 작성자의 닉네임', '덧글 작성자의 이메일', sysdate, sysdate
);

-- 게시글에 파일첨부를 할 경우 
INSERT INTO POST_FILE(
   PFI_ID, POST_ID, BRD_ID, MEM_ID, PFI_ORIGINNAME,
   PFI_FILENAME, PFI_REGDATE
)
VALUES(
    post_file_seq.nextval, 1, 1, 1, '원본파일명',
    '중복방지서버저장파일명', sysdate
);

-- 모임 관리 테이블 테스트 데이터 추가
INSERT INTO team(
    TEAM_ID, INT_ID, TEAM_NAME, TEAM_SHORT_CONTENT, TEAM_CONTENT,
    AREA_ID, TEAM_REGDATE, TEAM_MAX, MEM_ID
)
VALUES(
    team_seq.nextval, 1, '모임의 이름 테스트모임', '우리모임은 ~~...', '여기에는 썸머노트로 작성한 데이터가 들어갑니다',
    1, sysdate, 10,1
);

-- 모임 회원 관리 테이블 테스트 데이터 추가
INSERT INTO team_member(
    TMEM_ID, TEAM_ID, MEM_ID, TMEM_LEVEL, TMEM_CONTENT,
    TMEM_NICKNAME, TMEM_EMAIL, TMEM_LASTVISIT, TMEM_REGDATE, TMEM_BIRTHDAY,
    TMEM_GENDER, TMEM_PHOTO
)
VALUES(
    team_member_seq.nextval, 1, 1, 1, '모임원의 짧은 자기소개',
    '모임원의 닉네임', '모임원의 이메일', sysdate, sysdate, to_date('20191008','yyyymmdd'),
    'F', ' '
);

-- 모임 게시물 관리 테이블 테스트 데이터 추가
INSERT INTO team_post(
    POST_ID, POST_NUM, TEAM_ID, BRD_ID, POST_TITLE,
    POST_CONTENT, TMEM_ID, POST_TMEM_LEVEL, POST_NICKNAME, POST_EMAIL,
    POST_REGDATE, POST_UPDATE, POST_HIT
)
VALUES(
    team_post_seq.nextval, 0, 1, 1, '모임 내부 게시물의 제목',
    '모임 내부 게시물의 내용', 1, 1, '모임원의 닉네임', 'test@email.com',
    sysdate, sysdate, 0
);

-- 모임 게시물 덧글 테이블 테스트 데이터 추가
INSERT INTO team_comments(
    CMT_ID, POST_ID, BRD_ID, CMT_NUM, CMT_CONTENT,
    TMEM_ID, CMT_NICKNAME, CMT_EMAIL, CMT_REGDATE, CMT_UPDATE
)
VALUES(
    team_comments_seq.nextval, 1, 1, 0, '덧글 내용을 적을게요',
    1, '덧글작성자의 닉네임', '덧글 작성자의 이메일', sysdate, sysdate
);

-- 모임 게시물 첨부파일 관리 테이블 테스트 데이터 추가
INSERT INTO team_post_file(
    PFI_ID, POST_ID, BRD_ID, TMEM_ID, PFI_ORIGINNAME,
    PFI_FILENAME, PFI_REGDATE
)
VALUES(
    team_post_file_seq.nextval, 1, 1, 1, '원본파일명',
    '중복방지서버저장파일명', sysdate
);

-- 회원 쪽지 테이블 테스트 데이터 추가
INSERT INTO message(
    MSG_ID, SEND_MEM_ID, RECV_MEM_ID, MSG_TITLE,
    MSG_CONTENT, MSG_REGDATE, MSG_READDATE
)
VALUES(
    message_seq.nextval, 1, 1, '메세지 제목',
    '메세지 내용', sysdate, null
);

-- 모임 정모 관리 테이블 테스트 데이터 추가
INSERT INTO meet(
   MEET_ID, TEAM_ID, MEET_TITLE, MEET_CONTENT, MEET_DATE,
   MEET_REGDATE, MEET_MAX, MEET_PAY, TMEM_ID, MEET_NICKNAME,
   MEET_EMAIL, MEET_AREA, MEET_PHOTO
)
VALUES(
    meet_seq.nextval, 1, '정모 이름', '정모 내용', sysdate,
    sysdate, 10, '정모 회비금액', 1, '정모 주최자 닉네임',
    '정모 주최자 이메일', '정모 지역', ' '
);

-- 모임 게시물 첨부파일 관리 테이블 테스트 데이터 추가
INSERT INTO meet_member(
   MMEM_ID, MEET_ID, TMEM_ID,
   MMEM_NICKNAME, MMEM_EMAIL, MMEM_PHOTO
)
VALUES(
    meet_member_seq.nextval, 1, 1,
    '정모참여자의 이름', '정모참여자의 이메일',' '
);

-- 모임 게시물 첨부파일 관리 테이블 테스트 데이터 추가
INSERT INTO team_note(
   TNO_ID, TEAM_ID, TNO_CONTENT, TMEM_ID,
   TNO_NICKNAME, TNO_EMAIL, TNO_REGDATE
)
VALUES(
    team_note_seq.nextval, 1, '모임 한줄평 내용', 1,
    '모임 한줄평 작성자 닉네임', '모임 한줄평 작성자 이메일', sysdate
);
