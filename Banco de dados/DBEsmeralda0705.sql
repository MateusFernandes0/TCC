DROP DATABASE IF EXISTS DBEsmeralda;

CREATE DATABASE DBEsmeralda;

USE DBEsmeralda;

CREATE TABLE Perfis (
  ID_Perfil INT PRIMARY KEY AUTO_INCREMENT,
  Energia ENUM('Baixa', 'Média', 'Alta'),
  Sociabilidade ENUM('Introvertido', 'Extrovertido', 'Neutro'),
  Independencia ENUM('Independente', 'Dependente', 'Neutro'),
  Experiencia_Necessaria BOOLEAN
);

CREATE TABLE Usuarios (
  ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
  Nome_Completo VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  Senha VARCHAR(255),
  Telefone VARCHAR(15),
  Data_Nascimento DATE,
  Genero ENUM('Masculino', 'Feminino', 'Outro'),
  Numero_RG VARCHAR(15),
  Imagem_RG VARCHAR(255),
  ID_Perfil INT,
  Status_Usuario ENUM('Ativo', 'Inativo'),
  FOREIGN KEY (ID_Perfil) REFERENCES Perfis(ID_Perfil)
);

CREATE TABLE Animais (
  ID_Animal INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255),
  Especie ENUM('Cachorro', 'Gato', 'Outro'),
  Raca VARCHAR(255),
  Idade INT,
  Sexo ENUM('Macho', 'Fêmea'),
  Castrado BOOLEAN,
  Vacinado BOOLEAN,
  Vermifugado BOOLEAN,
  Porte ENUM('Pequeno', 'Médio', 'Grande'),
  Pelagem ENUM('Curta', 'Média', 'Longa'),
  Cor VARCHAR(255),
  Observacoes TEXT,
  Status_Animal ENUM('Disponível', 'Adotado', 'Reservado'),
  ID_Usuario_Cadastrante INT,
  ID_Perfil_Animal INT,
  FOREIGN KEY (ID_Usuario_Cadastrante) REFERENCES Usuarios(ID_Usuario),
  FOREIGN KEY (ID_Perfil_Animal) REFERENCES Perfis(ID_Perfil)
);

CREATE TABLE Compatibilidades (
  ID_Compatibilidade INT PRIMARY KEY AUTO_INCREMENT,
  ID_Usuario INT,
  ID_Animal INT,
  Pontuacao_Compatibilidade DECIMAL(5,2),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
  FOREIGN KEY (ID_Animal) REFERENCES Animais(ID_Animal)
);

CREATE TABLE Mensagens (
  ID_Mensagem INT PRIMARY KEY AUTO_INCREMENT,
  ID_Usuario_Rem INT,
  ID_Usuario_Dest INT,
  Conteudo TEXT,
  Data_Hora DATETIME,
  FOREIGN KEY (ID_Usuario_Rem) REFERENCES Usuarios(ID_Usuario),
  FOREIGN KEY (ID_Usuario_Dest) REFERENCES Usuarios(ID_Usuario)
);