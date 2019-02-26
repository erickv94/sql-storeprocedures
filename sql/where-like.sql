select first_name||' '||last_name as full_name from actor;		
select last_name from actor where upper(last_name)=upper('Guiness'); --filtrado de un apellido
select first_name from actor where first_name ilike '%ope' ;
select first_name from actor where first_name ilike '%pe%' ;
select first_name from actor where first_name ilike 'la%' ; --ilike upper and lowercase sensitive
