
-- meet 테이블에 새로운 컬럼 추가
 ALTER TABLE meet add(member_seq NUMBER) ;

-- 외래키 설정
 ALTER TABLE meet
    ADD CONSTRAINT FK_meet_member_seq_member_seq FOREIGN KEY (member_seq)
        REFERENCES member (seq);
        
-- 추가된 테이블의 notNull 조건을 적용하기위해 null처리되어있는 임의의 값 1로 변경시켜준다
update meet 
set member_seq = 1
where member_seq is null;
-- 컬럼 not null조건 추가
Alter table meet modify (member_seq constraint NN_meet_member_seq NOT NULL);

-------------- 추가 컬럼 title, content, payment

--   title         VARCHAR2(50)     NOT NULL,  -- 정모이름
 ALTER TABLE meet add(title VARCHAR2(50)) ;
--   content       VARCHAR2(400)    NOT NULL, -- 정모 내용
 ALTER TABLE meet add(content VARCHAR2(400)) ;
--  payment       VARCHAR2(50)     NOT NULL, -- 회비
 ALTER TABLE meet add(payment VARCHAR2(50)) ;

-- 정모 테이블 null 값 공백으로 대체
update meet 
set title = ' '
where title is null;

update meet 
set content = ' '
where content is null;

update meet 
set payment = ' '
where payment is null;

-- 컬럼 not null조건 추가
Alter table meet modify (title constraint NN_meet_title NOT NULL);
Alter table meet modify (content constraint NN_meet_content NOT NULL);
Alter table meet modify (payment constraint NN_meet_payment NOT NULL);