--시퀀스 생성 및 데이터 입력
--LPAD("값", "총 문자길이", "채움문자") = LPAD( , 2, 0)


-- 역할
create sequence role_seq; -- role Table 
-- role Table 더미데이터 입력
insert into role(SEQ, KEY, VALUE)
values (role_seq.nextval, 'RO01', '관리자');
insert into role(SEQ, KEY, VALUE)
values (role_seq.nextval, 'RO02', '부관리자');
insert into role(SEQ, KEY, VALUE)
values (role_seq.nextval, 'RO03', '사용자');
insert into role(SEQ, KEY, VALUE)
values (role_seq.nextval, 'RO04', '모임장');
insert into role(SEQ, KEY, VALUE)
values (role_seq.nextval, 'RO05', '운영진');
insert into role(SEQ, KEY, VALUE)
values (role_seq.nextval, 'RO06', '모임원');



-- 회원가입시 회원 정보를 넣어주는 부분
create sequence member_seq; -- member Table
-- member Table 더미데이터 입력 6개
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
values (member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, sysdate, 'test@googletest.com', 'AREA'||member_seq.currval, '010-1234-5678', 'U', sysdate, sysdate, 'PHOTO'||member_seq.currval);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
values (member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, sysdate, 'test@googletest.com', 'AREA'||member_seq.currval, '010-1234-5678', 'U', sysdate, sysdate, 'PHOTO'||member_seq.currval);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
values (member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, sysdate, 'test@googletest.com', 'AREA'||member_seq.currval, '010-1234-5678', 'U', sysdate, sysdate, 'PHOTO'||member_seq.currval);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
values (member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, sysdate, 'test@googletest.com', 'AREA'||member_seq.currval, '010-1234-5678', 'U', sysdate, sysdate, 'PHOTO'||member_seq.currval);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
values (member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, sysdate, 'test@googletest.com', 'AREA'||member_seq.currval, '010-1234-5678', 'U', sysdate, sysdate, 'PHOTO'||member_seq.currval);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
values (member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, sysdate, 'test@googletest.com', 'AREA'||member_seq.currval, '010-1234-5678', 'U', sysdate, sysdate, 'PHOTO'||member_seq.currval);

-- ++ 재귀복사로 데이터 추가
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
(select member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, BIRTHDAY, EMAIL, 'AREA'||member_seq.currval, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, 'PHOTO'||member_seq.currval from member);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
(select member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, BIRTHDAY, EMAIL, 'AREA'||member_seq.currval, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, 'PHOTO'||member_seq.currval from member);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
(select member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, BIRTHDAY, EMAIL, 'AREA'||member_seq.currval, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, 'PHOTO'||member_seq.currval from member);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
(select member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, BIRTHDAY, EMAIL, 'AREA'||member_seq.currval, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, 'PHOTO'||member_seq.currval from member);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
(select member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, BIRTHDAY, EMAIL, 'AREA'||member_seq.currval, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, 'PHOTO'||member_seq.currval from member);
insert into member(SEQ, ID, PASSWORD, NAME, BIRTHDAY, EMAIL, AREA, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, PHOTO)
(select member_seq.nextval, 'ID'||member_seq.currval, 'PASSWORD'||member_seq.currval, 'NAME'||member_seq.currval, BIRTHDAY, EMAIL, 'AREA'||member_seq.currval, PHONE_NUMBER, STATE, REGDATE, UPDATEDATE, 'PHOTO'||member_seq.currval from member);


-- member의 역할 (관리자, 부관리자, 사용자) 회원 가입시 같이 테이블에 입력해줘야 함
-- member_role 
-- 관리자
insert into member_role(MEMBER_SEQ, ROLE_SEQ)
values (1,1);

-- 부 관리자
insert into member_role(MEMBER_SEQ, ROLE_SEQ)
values (2,2);
insert into member_role(MEMBER_SEQ, ROLE_SEQ)
values (3,2);

-- 일반 사용자
insert into member_role(MEMBER_SEQ, ROLE_SEQ)
(select seq, '3' from member where seq > 3 );



-- 관리자가 관심사를 관리함
create sequence interest_seq; -- interest Table
-- interest Table 더미데이터 입력
insert into interest(SEQ, KEY, VALUE)
values (interest_seq.nextval,'IN01', '공부');
insert into interest(SEQ, KEY, VALUE)
values (interest_seq.nextval,'IN02', '오락');
insert into interest(SEQ, KEY, VALUE)
values (interest_seq.nextval,'IN03', '스포츠');
insert into interest(SEQ, KEY, VALUE)
values (interest_seq.nextval,'IN04', '여행');
insert into interest(SEQ, KEY, VALUE)
values (interest_seq.nextval,'IN05', '기타');


-- member의 관심사 (테스트 디폴트 값은 기타로 설정)
insert into member_interest(MEMBER_SEQ, INTEREST_SEQ)
(select seq, '5' from member );


-- 모임이 생성되면 저장될 테이블
create sequence team_seq; -- team Table
-- team Table 더미데이터 입력
insert into team(SEQ, INTEREST_SEQ, NAME, CONTENT, SHORT_CONTENT, REGDATE, AREA, MAXPERSON)
values (team_seq.nextval, 1, 'NAME'||team_seq.currval, 'CONTENT'||team_seq.currval, 'SHORT_CONTENT'||team_seq.currval, sysdate, 'AREA'||team_seq.currval, 20);
insert into team(SEQ, INTEREST_SEQ, NAME, CONTENT, SHORT_CONTENT, REGDATE, AREA, MAXPERSON)
values (team_seq.nextval, 2, 'NAME'||team_seq.currval, 'CONTENT'||team_seq.currval, 'SHORT_CONTENT'||team_seq.currval, sysdate, 'AREA'||team_seq.currval, 20);


-- 모임이 생성되면서 모임회원 테이블에도 추가(모임장)
-- team_member Table
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,1,4); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 4 : 모임장) 

--아래는 1모임에 사용자 추가내용
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,2,5); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 5 : 운영진) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,3,5); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 5 : 운영진) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,4,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,5,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,6,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,7,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (1,8,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 


insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,11,4); -- 정모번호(2), 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 4 : 모임장) 

--아래는 2모임에 사용자 추가내용
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,12,5); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 5 : 운영진) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,13,5); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 5 : 운영진) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,14,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,15,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,16,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,17,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 
insert into team_member(TEAM_SEQ, MEMBER_SEQ, ROLE_SEQ)
values (2,18,6); -- 정모번호, 사용자 번호, 역할번호 (첫 생성시 ROLE_SEQ => 6 : 모임원) 




create sequence post_type_seq; -- post_type Table
-- post_type Table 더미데이터 입력
-- 전체 
insert into post_type(SEQ, KEY, VALUE)
values (post_type_seq.nextval, 'PO01', '공지사항');
insert into post_type(SEQ, KEY, VALUE)
values (post_type_seq.nextval, 'PO02', 'FAQ');
insert into post_type(SEQ, KEY, VALUE)
values (post_type_seq.nextval, 'PO03', 'Q/A');
insert into post_type(SEQ, KEY, VALUE)
values (post_type_seq.nextval, 'PO04', '이벤트');
-- 모임
insert into post_type(SEQ, KEY, VALUE)
values (post_type_seq.nextval, 'PO21', '게시판');
insert into post_type(SEQ, KEY, VALUE)
values (post_type_seq.nextval, 'PO22', '사진첩');


create sequence message_seq; -- message Table 
-- (member_seq값이 member Table에 존재하지않으면 참조무결성조건을 위반하여 에러가 발생합니다.)
insert into message(SEQ, MEMBER_SEQ, CONTENT, FROM_MEMBER_SEQ, REGDATE, OPENDATE)
values (message_seq.nextval, 1, 'CONTENT', 2, sysdate, null);
insert into message(SEQ, MEMBER_SEQ, CONTENT, FROM_MEMBER_SEQ, REGDATE, OPENDATE)
values (message_seq.nextval, 1, 'CONTENT', 2, sysdate, null);
insert into message(SEQ, MEMBER_SEQ, CONTENT, FROM_MEMBER_SEQ, REGDATE, OPENDATE)
values (message_seq.nextval, 1, 'CONTENT', 2, sysdate, null);
insert into message(SEQ, MEMBER_SEQ, CONTENT, FROM_MEMBER_SEQ, REGDATE, OPENDATE)
values (message_seq.nextval, 1, 'CONTENT', 2, sysdate, null);
insert into message(SEQ, MEMBER_SEQ, CONTENT, FROM_MEMBER_SEQ, REGDATE, OPENDATE)
values (message_seq.nextval, 1, 'CONTENT', 2, sysdate, null);
insert into message(SEQ, MEMBER_SEQ, CONTENT, FROM_MEMBER_SEQ, REGDATE, OPENDATE)
values (message_seq.nextval, 1, 'CONTENT', 2, sysdate, null);


create sequence chat_seq; -- chat Table
-- 1 모임채팅
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 1, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 2, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 3, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 4, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 5, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 6, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 7, 1, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 8, 1, '채팅내용'||chat_seq.currval, sysdate);
-- 2 모임채팅
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 11, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 12, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 13, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 14, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 15, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 16, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 17, 2, '채팅내용'||chat_seq.currval, sysdate);
insert into chat(SEQ, MEMBER_SEQ, TEAM_SEQ, CONTENT, REGDATE)
values (chat_seq.nextval, 18, 2, '채팅내용'||chat_seq.currval, sysdate);

-- 모임의 정모 더미데이터
create sequence meet_seq; -- meet Table  // TEAM_SEQ 없는 번호이면 안됨.
-- 모임 1의 정모
insert into meet(SEQ, TEAM_SEQ, AREA, MEETDATE, REGDATE, UPDATEDATE, MAXPERSON)
values (meet_seq.nextval, 1, '지역이 들어갑니다', sysdate+15,sysdate,sysdate, 10);
insert into meet(SEQ, TEAM_SEQ, AREA, MEETDATE, REGDATE, UPDATEDATE, MAXPERSON)
values (meet_seq.nextval, 1, '지역이 들어갑니다', sysdate+16,sysdate,sysdate, 10);
-- 모임 2의 정모
insert into meet(SEQ, TEAM_SEQ, AREA, MEETDATE, REGDATE, UPDATEDATE, MAXPERSON)
values (meet_seq.nextval, 2, '지역이 들어갑니다', sysdate+3,sysdate,sysdate, 10);
insert into meet(SEQ, TEAM_SEQ, AREA, MEETDATE, REGDATE, UPDATEDATE, MAXPERSON)
values (meet_seq.nextval, 2, '지역이 들어갑니다', sysdate+4,sysdate,sysdate, 10);

-- 정모 참여자
-- 정모 1의 정모참여자 
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (1,1);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (1,2);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (1,3);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (1,4);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (1,5);
-- 정모 2의 정모 참여자
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (2,11);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (2,12);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (2,13);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (2,14);
insert into meet_member(MEET_SEQ, MEMBER_SEQ)
values (2,15);

-- 게시물
create sequence post_seq; -- post Table
--공지사항 더미 12개 추가
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 1, '공지사항'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);

-- 덧글/ 모임의 한줄글 작성
create sequence reply_seq; -- reply Table 
-- 1번사용자가 작성한 덧글이나 모임의 한줄글
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values(reply_seq.nextval, 1, '덧글/내용', sysdate, sysdate);
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values(reply_seq.nextval, 1, '덧글/내용', sysdate, sysdate);
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values(reply_seq.nextval, 1, '덧글/내용', sysdate, sysdate);
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values(reply_seq.nextval, 1, '덧글/내용', sysdate, sysdate);
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values(reply_seq.nextval, 1, '덧글/내용', sysdate, sysdate);

-- 모임게시물 
-- post테이블에 데이터 등록 후 team_post 참조테이블에도 등록

-- 모임 1의 게시판 등록
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 5, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 5, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 5, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 5, post_seq.currval);

-- 모임 1의 사진첩 등록
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 6, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 6, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 6, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 1, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (1, 6, post_seq.currval);

-----------------------

-- 모임 2의 게시판 등록
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 5, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 5, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 5, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 5, '게시판'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 5, post_seq.currval);

-- 모임 2의 사진첩 등록
insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 6, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 6, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 6, post_seq.currval);

insert into post(SEQ, POST_TYPE_SEQ, TITLE, CONTENT, REGDATE, UPDATEDATE, COUNT, MEMBER_SEQ, ORGIN, PRIORITY, DEPTH)
values (post_seq.nextval, 6, '사진첩'||post_seq.currval, 'CONTENT', sysdate, sysdate, 0, 11, post_seq.currval, 0, 0);
--team_post
insert into team_post(TEAM_SEQ, POST_TYPE_SEQ, POST_SEQ)
values (2, 6, post_seq.currval);



-- 모임의 한줄 글 작성
-- 모임 1의 한줄글
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
-- -- 
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
-- -- 
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
-- -- 
-- 모임 2의 한줄글
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 11, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (2, reply_seq.currval);
-- -- 
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 11, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (2, reply_seq.currval);
-- -- 
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 11, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (2, reply_seq.currval);
-- -- 
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 11, '모임 한줄글', sysdate, sysdate);

insert into team_reply(TEAM_SEQ, REPLY_SEQ)
values (2, reply_seq.currval);
-- -- 


-- 게시물의 덧글 추가
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);
insert into post_reply(POST_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);
insert into post_reply(POST_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);
insert into post_reply(POST_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);
insert into post_reply(POST_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);
insert into post_reply(POST_SEQ, REPLY_SEQ)
values (1, reply_seq.currval);
--

-- 모임 게시물의 덧글 작성

insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);

insert into team_post_reply(POST_SEQ, REPLY_SEQ)
values (5, reply_seq.currval);

--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);

insert into team_post_reply(POST_SEQ, REPLY_SEQ)
values (5, reply_seq.currval);

--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);

insert into team_post_reply(POST_SEQ, REPLY_SEQ)
values (5, reply_seq.currval);

--
insert into reply(SEQ, MEMBER_SEQ, TALK, REGDATE, UPDATEDATE)
values (reply_seq.nextval, 1, '덧글 내용', sysdate, sysdate);

insert into team_post_reply(POST_SEQ, REPLY_SEQ)
values (5, reply_seq.currval);

--