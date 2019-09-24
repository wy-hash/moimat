# moim@

지역기반 모임 지원 웹 애플리케이션

## 클론 전

문자열 인코딩 변경
- preference -> general -> workspace에서 아래의 text file encoding을 utf-8로, new file line delimiter를 unix로 변경.
- preference -> web 아래 css, html, jsp files 에서도 인코딩 utf-8로 변경.


## use

- oracle jdk 1.8.0_221 (8u221)
- oracle xe 11g release 2
- sql developer 19.2 jdk8 included
- sts 3.9.9
- tc server v4.0 (local)
- tomcat 8.5.45
- spring 4.3.25
- servlet 3.1.0
- jsp 2.3.3
- lombok 1.18.8
- junit 4.12
- spring-test
- hikaricp 3.3.1
- mybatis 3.5.2
- mybatis-spring 2.0.2
- spring-jdbc
- spring-tx
- log4jdbc-log4j2-jdbc4 1.16
- jackson-databind 2.9.9
- jackson-dataformat-xml 2.9.9
- gson 2.8.5


## configuration


### db conf

- db에 system으로 접속 후 계정 생성
  - create user breaktheice identified by breaktheice
  default tablespace users
  temporary tablespace temp;

- 권한 설정
  grant connect, dba to breaktheice;

- db 웹 포트변경
  sys 계정에 sysdba롤로 접속
  exec dbms_xdb.sethttpport(9090); 후
  select dbms_xdb.gethttpport() from dual; 로 확인.

- 생성한 계정으로 접속 후 sample table 생성, 더미 하나 삽입
  create table sampletable ( id number(10,0), name varchar2(50), address varchar2(50));
  insert into sampletable values(123, 'test', 'test');

### include jdbc

프로젝트 오른쪽 클릭 -> build path -> configure build path 선택
오른쪽 add external jars 클릭 후 sqldeveloper가 있는 경로에서 /jdbc/lib -> ojdbc8 열기 후 apply
  eg) C:\Users\me\dev\sqldeveloper\jdbc\lib

config 왼쪽 탭에서 바로 위 deployment assembly 클릭 -> add 클릭 -> java build path entries 클릭후 next -> ojdbc8 선택 후 apply.


### publishing

이클립스 서버탭에서 서버 오른쪽 클릭 -> add and remove 클릭 -> 프로젝트 available로 이동.
서버 더블클릭 -> 프로젝트 모듈 클릭 -> 오른쪽 edit 클릭 -> 패스를 '/'로 변경후 저장.




