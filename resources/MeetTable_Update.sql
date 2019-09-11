
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
Alter table meet modify (member_seq constraint NN_meet_member_seq NOT NULL);