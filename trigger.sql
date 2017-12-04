CREATE OR REPLACE TRIGGER tri_01 AFTER INSERT ON t_user
FOR EACH ROW 
DECLARE
  v_count INTEGER := 10;
BEGIN
  dbms_output.put_line(v_count||': count');
END;

CREATE OR REPLACE TRIGGER tri_02 INSTEAD OF INSERT
ON view_user FOR EACH ROW 
DECLARE
BEGIN
  INSERT INTO t_user VALUES (:new.id,:new.name,:new.age,:new.dept_id);
  INSERT INTO t_dept VALUES (:new.id,:new.dept_name);
END;

INSERT INTO t_user VALUES (3,'Fttt2',33);

INSERT INTO view_user VALUES (4,'GG-sd',10,3,'¹¤³Ì²¿');
