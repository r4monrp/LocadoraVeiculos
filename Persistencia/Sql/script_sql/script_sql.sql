CREATE DATABASE LOCADORA_VEICULO;

CREATE TABLE LOCADORA_VEICULO.CATEGORIA (
COD_CATEGORIA INT AUTO_INCREMENT NOT NULL,
NOME VARCHAR(100) NOT NULL,
VALOR DOUBLE NOT NULL,
PRIMARY KEY (COD_CATEGORIA)
);

CREATE TABLE LOCADORA_VEICULO.MANUTENCAO(
COD_MANUTENCAO INT AUTO_INCREMENT NOT NULL,
TIPO_MANUTENCAO INT NOT NULL,
OBSERVACAO LONGTEXT,
PRIMARY KEY (COD_MANUTENCAO)
);

CREATE TABLE LOCADORA_VEICULO.PERMISSAO(
COD_PERMISSAO INT AUTO_INCREMENT NOT NULL,
TIPO VARCHAR(1) NOT NULL,
DESCRICAO LONGTEXT,
PRIMARY KEY (COD_PERMISSAO)
);

CREATE TABLE LOCADORA_VEICULO.CHECKLIST(
COD_CHECKLIST INT AUTO_INCREMENT NOT NULL,
OBSERVACAO LONGTEXT NOT NULL,
STATUS VARCHAR(1) NOT NULL,
PRIMARY KEY (COD_CHECKLIST)
);

CREATE TABLE LOCADORA_VEICULO.CLIENTE(
COD_CLIENTE INT AUTO_INCREMENT NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PRIMARY KEY (COD_CLIENTE)
);

CREATE TABLE LOCADORA_VEICULO.USUARIO(
COD_USUARIO INT AUTO_INCREMENT NOT NULL,
NOME VARCHAR(100) NOT NULL,
RG VARCHAR(20) NOT NULL,
CPF VARCHAR(20) NOT NULL,
LOGIN VARCHAR(15) NOT NULL,
SENHA VARCHAR(15) NOT NULL,
COD_PERMISSAO INT NOT NULL,
STATUS INT(11), 
PRIMARY KEY (COD_USUARIO),
FOREIGN KEY (COD_PERMISSAO) REFERENCES LOCADORA_VEICULO.PERMISSAO (COD_PERMISSAO)
);

CREATE TABLE LOCADORA_VEICULO.VEICULO(
COD_VEICULO INT AUTO_INCREMENT NOT NULL,
MARCA VARCHAR(30) NOT NULL,
MODELO VARCHAR(30) NOT NULL,
ANO_FABRICACAO VARCHAR(30) NOT NULL,
CONDICAO VARCHAR(30) NOT NULL,
VIDRO_ELETRICO VARCHAR(1) NOT NULL,
TRAVA_ELETRICA VARCHAR(1) NOT NULL,
AUTOMATICO VARCHAR(1) NOT NULL,
QUANTIDADE_PORTAS VARCHAR(1) NOT NULL,
DIRECAO_HIDRAULICA VARCHAR(1) NOT NULL,
COR VARCHAR(1) NOT NULL,
AR_CONDICIONADO VARCHAR(1) NOT NULL,
COD_CATEGORIA INT NOT NULL,
PRIMARY KEY (COD_VEICULO),
FOREIGN KEY (COD_CATEGORIA) REFERENCES LOCADORA_VEICULO.CATEGORIA (COD_CATEGORIA)
);

CREATE TABLE LOCADORA_VEICULO.RESERVA(
NUMERO_RESERVA INT AUTO_INCREMENT NOT NULL,
DATA_RESERVA DATE NOT NULL,
FORMA_PAGAMENTO VARCHAR(5) NOT NULL,
TIPO_RETIRADA VARCHAR(5) NOT NULL,
DATA_ENTREGA DATE NOT NULL,
DATA_RETIRADA DATE NOT NULL,
SITUACAO VARCHAR(2) NOT NULL,
COD_CLIENTE INT NOT NULL,
COD_USUARIO INT NOT NULL,
COD_VEICULO INT NOT NULL,
PRIMARY KEY (NUMERO_RESERVA),
FOREIGN KEY (COD_CLIENTE) REFERENCES LOCADORA_VEICULO.CLIENTE (COD_CLIENTE),
FOREIGN KEY (COD_USUARIO) REFERENCES LOCADORA_VEICULO.USUARIO (COD_USUARIO),
FOREIGN KEY (COD_VEICULO) REFERENCES LOCADORA_VEICULO.VEICULO (COD_VEICULO)
);

CREATE TABLE LOCADORA_VEICULO.NIVEL_PERMISSAO_USUARIO(
COD_USUARIO INT NOT NULL,
NIVEL_PERMISSAO VARCHAR(50),
FOREIGN KEY (COD_USUARIO) REFERENCES LOCADORA_VEICULO.USUARIO(COD_USUARIO)
);

CREATE TABLE LOCADORA_VEICULO.TELEFONE_CLIENTE(
COD_CLIENTE INT NOT NULL,
TELEFONE VARCHAR(20),
FOREIGN KEY (COD_CLIENTE) REFERENCES LOCADORA_VEICULO.CLIENTE (COD_CLIENTE)
);

CREATE TABLE LOCADORA_VEICULO.PESSOA_FISICA(
COD_PESSOA_FISICA INT AUTO_INCREMENT NOT NULL,
NOME VARCHAR(50) NOT NULL,
RG VARCHAR(20) NOT NULL,
CPF VARCHAR(20) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
CNH VARCHAR(20) NOT NULL,
PASSAPORTE VARCHAR(20) NOT NULL,
NATURALIDADE VARCHAR(20) NOT NULL,
COD_CLIENTE INT NOT NULL,
PRIMARY KEY (COD_PESSOA_FISICA),
FOREIGN KEY (COD_CLIENTE) REFERENCES LOCADORA_VEICULO.CLIENTE (COD_CLIENTE)
);

CREATE TABLE LOCADORA_VEICULO.PESSOA_JURIDICA(
COD_PESSOA_JURIDICA INT AUTO_INCREMENT NOT NULL,
NOME_FANTASIA VARCHAR(50) NOT NULL,
RAZAO_SOCIAL VARCHAR(20) NOT NULL,
CNPJ VARCHAR(20) NOT NULL,
INSCRICAO_ESTADUAL VARCHAR(20) NOT NULL,
COD_CLIENTE INT NOT NULL,
PRIMARY KEY (COD_PESSOA_JURIDICA),
FOREIGN KEY (COD_CLIENTE) REFERENCES LOCADORA_VEICULO.CLIENTE (COD_CLIENTE)
);

CREATE TABLE LOCADORA_VEICULO.FORNECEDOR(
COD_FORNECEDOR INT AUTO_INCREMENT NOT NULL,
COD_PESSOA_JURIDICA INT NOT NULL,
PRIMARY KEY(COD_FORNECEDOR),
FOREIGN KEY (COD_PESSOA_JURIDICA) REFERENCES LOCADORA_VEICULO.PESSOA_JURIDICA (COD_PESSOA_JURIDICA)
);

CREATE TABLE LOCADORA_VEICULO.VEICULO_TEM_CHECKLIST(
COD_VEICULO INT NOT NULL,
COD_CHECKLIST INT NOT NULL,
DATA_CHECAGEM DATE NOT NULL,
FOREIGN KEY (COD_VEICULO) REFERENCES LOCADORA_VEICULO.VEICULO (COD_VEICULO),
FOREIGN KEY (COD_CHECKLIST) REFERENCES LOCADORA_VEICULO.CHECKLIST (COD_CHECKLIST)
);

CREATE TABLE LOCADORA_VEICULO.VEICULO_TEM_MANUTENCAO(
COD_VEICULO INT NOT NULL,
COD_MANUTENCAO INT NOT NULL,
DATA_PREVISTA DATE NOT NULL,
DATA_ENTREGA DATE NOT NULL,
DATA_SAIDA DATE NOT NULL,
FOREIGN KEY (COD_VEICULO) REFERENCES LOCADORA_VEICULO.VEICULO (COD_VEICULO),
FOREIGN KEY (COD_MANUTENCAO) REFERENCES LOCADORA_VEICULO.MANUTENCAO (COD_MANUTENCAO)
);

CREATE TABLE LOCADORA_VEICULO.VEICULO_TEM_FORNECEDOR(
COD_VEICULO INT NOT NULL,
COD_FORNECEDOR INT NOT NULL,
FOREIGN KEY (COD_VEICULO) REFERENCES LOCADORA_VEICULO.VEICULO (COD_VEICULO),
FOREIGN KEY (COD_FORNECEDOR) REFERENCES LOCADORA_VEICULO.FORNECEDOR (COD_FORNECEDOR)
);

CREATE TABLE LOCADORA_VEICULO.ITEM_CONFORMIDADE(
COD_ITEM INT AUTO_INCREMENT NOT NULL,
ITEM VARCHAR(50) NOT NULL,
COD_CHECKLIST INT NOT NULL,
PRIMARY KEY (COD_ITEM),
FOREIGN KEY (COD_CHECKLIST) REFERENCES LOCADORA_VEICULO.CHECKLIST (COD_CHECKLIST)
);

CREATE TABLE LOCADORA_VEICULO.DOCUMENTO(
COD_DOCUMENTO INT AUTO_INCREMENT NOT NULL,
RENAVAM VARCHAR(20) NOT NULL,
CHASSI VARCHAR(20) NOT NULL,
DATA_LICENCIAMENTO DATE NOT NULL,
COD_VEICULO INT NOT NULL,
PRIMARY KEY (COD_DOCUMENTO),
FOREIGN KEY (COD_VEICULO) REFERENCES LOCADORA_VEICULO.VEICULO (COD_VEICULO)
);

CREATE TABLE LOCADORA_VEICULO.ENDERECO(
COD_ENDERECO INT AUTO_INCREMENT NOT NULL,
CEP VARCHAR(14) NOT NULL,
BAIRRO VARCHAR(30) NOT NULL,
NUMERO VARCHAR(20) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
ESTADO VARCHAR(50) NOT NULL,
COD_CLIENTE INT NOT NULL,
COD_FORNECEDOR INT NOT NULL,
PRIMARY KEY (COD_ENDERECO),
FOREIGN KEY (COD_CLIENTE) REFERENCES LOCADORA_VEICULO.CLIENTE (COD_CLIENTE),
FOREIGN KEY (COD_FORNECEDOR) REFERENCES LOCADORA_VEICULO.FORNECEDOR (COD_FORNECEDOR)
);
