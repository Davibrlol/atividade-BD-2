-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



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
);

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
