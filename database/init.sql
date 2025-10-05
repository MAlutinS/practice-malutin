create database strapi_db;

create user strapi_user with password "admin";

grant all privilages on database strapi_db to strapi_user;