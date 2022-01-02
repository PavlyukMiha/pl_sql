/*
���������� ��������� ��� ������� ������ � ������� ������ ������������ ����.
���� � �������� ������� �������� �������������

��� ������� ���������� ������� ���������� ��������� �������
id  dat
1	02.09.21
2	10.09.21
3	03.09.21
4	05.09.21
5	12.09.21

������� � ��������� ���������
*/

CREATE or replace PROCEDURE data_cleaning
(ud in date,
tob IN USER_TABLES.table_name%type
)  
is
begin
    execute immediate 
    'DELETE FROM ' || tob || ' WHERE dat < :1' using  ud;         
END;


BEGIN
   data_cleaning('09.09.21', 'per');
END;

/*
�������� ��������� �����

id  dat
2	10.09.21
5	12.09.21
*/