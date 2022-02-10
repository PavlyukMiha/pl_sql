/*
Реализация выявления в какой день недели в сумме заработано больше, в воскресенья и или в субботу
для примера существует таблица выглядящая следующим образом
id  dat         money
1	09.09.21	10
2	10.09.21	30
3	09.09.21	5
4	10.09.21	1
5	12.09.21	20
6	12.09.21	30
7	05.09.21	40
8	11.09.21	52
9	10.09.21	9
10	10.09.21	7
11	12.09.21	6
12	01.09.21	2
13	03.09.21	8
14	12.09.21	22
15	07.09.21	11
16	02.09.21	10
создаем и применяем процедуру
*/

CREATE or replace procedure if_else1  
is
 money_s number(6);
 money_v number(6);

 cursor c1 is
 SELECT sum(money)
 FROM per
 where to_char(dat, 'D') = 6
 group by to_char(dat, 'D');
 
 cursor c2 is
 SELECT sum(money)
 FROM per
 where to_char(dat, 'D') = 7
 group by to_char(dat, 'D');

begin    
    open c1;
    fetch c1 into money_s;
    close c1;
 
    open c2;
    fetch c2 into money_v;
    close c2;
    
    if money_s > money_v then 
    DBMS_OUTPUT.put_line('çà ñóááîòû çàðàáîòàíî  áîëüøå');
    else 
    DBMS_OUTPUT.put_line('çà âîñêðåñåíüÿ çàðàáîòàíî  áîëüøå');        
    end if;    
END;


BEGIN
   if_else1();
END;


/*
получаем следующий вывод

    за воскресенья заработано  больше
*/
