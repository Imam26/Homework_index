
--5.1 
select b.id, b.book_name, b.price, b.pages, b.Date, a.firstname + ' ' +  a.lastname as author_name,
p.name as press_name
from Books b
inner join Author a on b.id_author = a.id
inner join Press p on b.id_press =  p.id
--5.2
select p.name as press_name, sum(b.pages) as page_count from Press p, Books b
where p.id = b.id_press
group by p.name  
--5.3
select * from Selling
where Date > '2018-08-05'
--5.4
select p.name as press_name, count(b.pages) as book_count from Press p, Books b
where p.id = b.id_press
group by p.name  
--5.5
select s.id, b.book_name, c.firstname + ' ' + c.lastname as costumer from Selling s
join Books b on b.id = s.id_book
join Costumers c on c.id = id_costumer
--5.6
select p.name as press_name, sum(b.pages) as book_count from Press p, Books b
where p.id = b.id_press and p.name = 'Азбука'
group by p.name 
union 
select p.name as press_name, sum(b.pages) as page_count from Press p, Books b
where p.id = b.id_press and p.name = 'Кочевники'
group by p.name  
--5.7 
select * from books
order by book_name
--5.8 
select s.id, s.Date, c.firstname + ' ' + c.lastname as costumer from Selling s
left join Costumers c on c.id = s.id_costumer
--5.9 
select * from Books
where price > (select avg(price) from Books)
--5.10
select * from Press
where name like 'А%'
--5.11 
Alter table Press
add new_column int not null default 1
--5.12
insert into Press values ('Детская литература')
select * from Press
--5.13
delete from Press where name = 'Детская литература'
--5.14 
create procedure TestProc @price int
as 
select * from books
where price = @price
go
Execute TestProc 5000
--5.15
create nonclustered index temp_idx on Selling(id_book)
go
drop index temp_idx on Selling
--5.16 update
update Press set name = 'Азбука' where name = 'Азбука2' 




