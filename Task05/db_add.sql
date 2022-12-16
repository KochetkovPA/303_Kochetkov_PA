insert into users(name, email, gender, register_date, occupation)
    select ' Pavel Kochetkov', 'KochetkovP@yandex.ru', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Margar Melkonjan', 'MelkonjanM@mail.ru', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Egor Meljakin', 'MeljakinE@gmail.com', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Maxim Negrya', 'NegryaM@moris.ru', 'male', date('now'), 'student';

insert into users(name, email, gender, register_date, occupation)
    select 'Egor Nikishkin', 'NikishkinE@mail.ru', 'male', date('now'), 'student';

insert into movies(title, year) values
('American psycho', 2000),
('Equilibrium', 2002),
('Once Upon a Time in Hollywood', 2019);

insert into movies_genres(movie_id, genre_id) select id, (select id from genres where name == 'Crime') from movies where title == 'American psycho';
insert into movies_genres(movie_id, genre_id) select id, (select id from genres where name == 'Fantasy') from movies where title == 'Equilibrium';
insert into movies_genres(movie_id, genre_id) select id, (select id from genres where name == 'Comedy') from movies where title == 'Once Upon a Time in Hollywood';


insert into tags_contents(tag) values('Unusual');
insert into tags(user_id, movie_id, tag_id, timestamp) select
                                                           (select id from users where name == 'Pavel Kochetkov'),
                                                           (select id from movies where title == 'American psycho'),
                                                           (select max(id) from tags),
                                                           strftime('%s', 'now');

insert into tags_contents(tag) values('Good looking');
insert into tags(user_id, movie_id, tag_id, timestamp) select
                                                           (select id from users where name == 'Pavel Kochetkov'),
                                                           (select id from movies where title == 'Equilibrium'),
                                                           (select max(id) from tags),
                                                           strftime('%s', 'now');

insert into tags_contents(tag) values('Funny film');
insert into tags(user_id, movie_id, tag_id, timestamp) select
                                                           (select id from users where name == 'Pavel Kochetkov'),
                                                           (select id from movies where title == 'Once Upon a Time in Hollywood'),
                                                           (select max(id) from tags),
                                                           strftime('%s', 'now');