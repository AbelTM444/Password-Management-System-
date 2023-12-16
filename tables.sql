create table security_questions
(
    question_id   int auto_increment
        primary key,
    question_text varchar(255) not null,
    constraint question_id
        unique (question_id)
);

create table user_info
(
    user_id       int auto_increment
        primary key,
    username      varchar(50)                         not null,
    first_name    varchar(50)                         not null,
    surname       varchar(50)                         not null,
    email         varchar(50)                         not null,
    register_date timestamp default CURRENT_TIMESTAMP null,
    hashpword     varchar(100)                        not null,
    constraint user_id
        unique (user_id)
);

create table accounts
(
    account_id   int auto_increment,
    user_id      int                                 not null,
    website_name varchar(100)                        null,
    username     varchar(100)                        not null,
    created_date timestamp default CURRENT_TIMESTAMP null,
    constraint account_id
        unique (account_id),
    constraint fk_assign_id
        foreign key (user_id) references user_info (user_id)
);

create table passwords
(
    password_id        int auto_increment
        primary key,
    account_id         int                                 not null,
    encrypted_password varbinary(255)                      not null,
    encryption_key     varbinary(255)                      not null,
    created_date       timestamp default CURRENT_TIMESTAMP null,
    constraint password_id
        unique (password_id),
    constraint fk_account_id
        foreign key (account_id) references accounts (account_id)
);

create table user_security_answers
(
    user_id     int          not null,
    question_id int          not null,
    answer_text varchar(255) not null,
    primary key (user_id, question_id),
    constraint fk_question_id
        foreign key (question_id) references security_questions (question_id),
    constraint fk_user_id_answer
        foreign key (user_id) references user_info (user_id)
);

create definer = root@localhost view same_website as
select `dbm1`.`user_info`.`first_name` AS `first_name`,
       `dbm1`.`user_info`.`surname`    AS `surname`,
       `dbm1`.`user_info`.`email`      AS `email`
from (`dbm1`.`user_info` join `dbm1`.`accounts` `a` on ((`dbm1`.`user_info`.`user_id` = `a`.`user_id`)))
where (`a`.`website_name` = 'NYIT');
