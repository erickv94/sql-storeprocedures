select * from temp_tbl ;
delete from temp_tbl where film_id=753; --delete rush goodfellas
update temp_tbl set title='Shrek' , description='Papeh' where film_id = 311;
insert into temp_tbl values(2222, 'ok');
insert into temp_tbl(film_id,title,description) values(2,'asasas','asasasadescripction');
delete from temp_tbl where film_id is null;