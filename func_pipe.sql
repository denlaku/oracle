CREATE TYPE ty_str IS TABLE OF VARCHAR2(200);
CREATE TYPE ty_user_obj AS OBJECT (
ID INTEGER,
NAME VARCHAR2(200),
age INTEGER
);
CREATE TYPE ty_user IS TABLE OF ty_user_obj;

CREATE OR REPLACE FUNCTION fn_pipe_01 RETURN ty_str PIPELINED AS
BEGIN
  FOR v IN 1..10 LOOP
    PIPE ROW('item_'||v);
  END LOOP;
END;

CREATE OR REPLACE FUNCTION fn_pipe_02 RETURN ty_user PIPELINED AS
tuo ty_user_obj := ty_user_obj(NULL,NULL,NULL);
BEGIN
  FOR v IN 1..10 LOOP
    tuo.id := v;
    tuo.name := 'item_'||v;
    tuo.age := v+10;
    PIPE ROW(tuo);
  END LOOP;
END;

SELECT T.* FROM TABLE(fn_pipe_01) T; 


