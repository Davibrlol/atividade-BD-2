-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

create database Davi;
use Davi;

CREATE TABLE midia (
titulo_midia varchar(100) not null,
caminho_midia varchar(250),
cod_midia int auto_increment PRIMARY KEY,
cod_postagem int not null
);

CREATE TABLE comenta (
cod_postagem int not null,
cod_usuario int not null,
dathora_coment timestamp default current_timestamp(),
texto_coment varchar(250) not null
);

CREATE TABLE voluntario (
cod_ong int not null,
cod_usuario int not null,
dt_voluntario date
);

CREATE TABLE curtir (
cod_postagem int not null,
cod_usuario int not null,
dathora_curtir timestamp default current_timestamp()
);

CREATE TABLE tipo_usuario (
cod_tipuser int auto_increment PRIMARY KEY,
desc_tipuser varchar(250) not null
);

CREATE TABLE postagem (
titulo_postagem varchar(100),
categoria varchar(100),
cod_postagem int auto_increment PRIMARY KEY,
texto_postagem varchar(1000) not null,
cod_usuario int not null,
cod_ong int not null
);

CREATE TABLE usuario (
idade int not null,
nome varchar(250) not null,
email varchar(250) not null unique ,
cod_usuario int auto_increment PRIMARY KEY,
telefone varchar(14) not null,
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

CREATE TABLE doacao (
cod_ong int not null,
cod_usuario int not null,
dt_doacao date,
valor_doacao decimal(10,2) not null,
FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario)
);

CREATE TABLE ong (
email_ong varchar(250) not null unique ,
telefone_ong varchar(14) not null,
nome_ong varchar(100) not null,
cod_ong int auto_increment PRIMARY KEY
);lucasoli

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE comenta ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE comenta ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE curtir ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE curtir ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE postagem ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE postagem ADD FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong);
ALTER TABLE doacao ADD FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong);


insert into tipo_usuario (desc_tipuser) values
('Comum'),
('Administrador');

insert into usuario (nome, email, telefone, idade, cod_tipuser) values
("José Henrique", "josehenri@gmail.com", "(11)96887-4330", "20", 2),
("Lucas Oliveira", "lucasoli@gmail.com", "(47)86217-2370", "32", 1),
("Vinicius Souza", "vinisou@gmail.com", "(47)76231-4270", "51", 1),
("João Pedro", "joaopedro@gmail.com", "(27)92257-4770", "62", 1),
("Marisa Silva", "marisilva@gmail.com", "(37)96417-0970", "25", 2),
("Joana Olivia", "joanaolivia.com", "(47)91217-2312", "40", 2),
("Larissa Cristina", "laricris@gmail.com", "(12)92211-3570", "30", 1),
("Ana Souza", "aninhasouza@gmail.com", "(54)65217-2321", "24", 2),
("Bruna Silva", "brusilva@gmail.com", "(27)86312-3170", "29", 1),
("Heloisa Duarte", "heloduarte@gmail.com", "(47)83217-2370", "36", 2);

insert into ong (email_ong, telefone_ong, nome_ong) values
('cachorrinhostristes@gmail.com', '(11)96027-2530', 'Cachorrinhos Solitários'),
('floresdojardim@gmail.com', '(48)90123-4341', 'Flores do Jardim'),
('engenheiroscomfronteiras@gmail.com', '(31)94953-3096', 'Engenheiros com Fronteiras'),
('bibirecordacoes@gmail.com', '(81)91981-3925', 'Bibi Recordações'),
('progsemlimites@gmail.com', '(83)93206-2383', 'Programação sem limites'),
('onepiece@gmail.com', '(65)90883-5414', 'One Piece '),
('carrosadoidados@gmail.com', '(88)92414-6047', 'Carros Adoidados'),
('amazoniasegura@gmail.com', '(92)95504-6399', 'Amazônia Segura'),
('localsafe@gmail.com', '(21)93171-3863', 'Locas Safe'),
('bancofuturo@gmail.com', '(91)99648-4399', 'Banco Futuro');