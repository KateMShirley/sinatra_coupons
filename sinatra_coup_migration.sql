CREATE DATABASE scoupons;

\c sinatra_coupons

CREATE TABLE coupons (id SERIAL PRIMARY KEY, title varchar (255), description text, product int, discount money, exp_date date);

INSERT INTO coupons (title, description, product, discount, exp_date)
VALUES
('BOGO', 'Buy one get one free', 123456, 10.00, '2015, 12, 31');

INSERT INTO coupons (title, description, product, discount, exp_date)
VALUES
('Free', 'Get your stuff for free!', 1234567, 0.00, '2020, 12, 31');


CREATE TABLE users (id SERIAL PRIMARY KEY, user_name varchar (255), user_email varchar(255), password_hash varchar (255), password_salt varchar (255));
