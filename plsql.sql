DECLARE
v_name VARCHAR2(200);
v_money DOUBLE PRECISION;
v_weight DEC;
v_age BINARY_INTEGER;
v_good BOOLEAN;
const_pi CONSTANT NUMBER := 3.14;
TYPE ty_user IS RECORD (
  v_id INTEGER,
  v_name VARCHAR2(200),
  v_age INTEGER
);
v_user ty_user;
CURSOR cur_user(p_age INTEGER) IS SELECT T.* FROM t_user T WHERE t.age < p_age; 
BEGIN
  v_name := 'adsdsd';
  v_money := 1234.4545;
  v_weight := 60.33;
  v_age := 20;
  v_good := TRUE;
  dbms_output.put_line('v_name: '|| v_name);
  dbms_output.put_line('v_money: '||v_money);
  dbms_output.put_line('v_weight: '||v_weight);
  dbms_output.put_line('v_age: '||v_age);
  dbms_output.put_line('const_pi: '||const_pi);
  IF v_good THEN 
    dbms_output.put_line('v_good');
  END IF;
  SELECT * INTO v_user FROM t_user WHERE ROWNUM = 1;
  dbms_output.put_line('v_user_age: '||v_user.v_age);
  CASE  WHEN v_age > 20 THEN 
    dbms_output.put_line('age大于');
  WHEN v_age = 20 THEN 
    dbms_output.put_line('age等于');
  ELSE 
    dbms_output.put_line('age大于');
  END CASE;
  FOR v_for IN REVERSE 1..10 LOOP
    dbms_output.put_line('v_for: '|| v_for);
  END LOOP;
  FOR v_user IN cur_user(25) LOOP
    dbms_output.put_line('v_user: '|| v_user.name);
  END LOOP;
  --DELETE FROM t_user WHERE ROWNUM = 1;
  IF SQL%NOTFOUND THEN
    dbms_output.put_line('没有删除任何数据');
  ELSE
    dbms_output.put_line('删除了'||SQL%ROWCOUNT||'条数据');
  END IF;
  INSERT INTO t_user(ID,NAME,age) VALUES(1,'GG_go', 40);
  IF SQL%NOTFOUND THEN
    dbms_output.put_line('没有插入任何数据');
  ELSE
    dbms_output.put_line('插入了'||SQL%ROWCOUNT||'条数据');
  END IF;
  COMMIT;
END;
