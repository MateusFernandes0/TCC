DROP DATABASE IF EXISTS DBEsmeralda;

CREATE DATABASE DBEsmeralda;

USE DBEsmeralda;

CREATE TABLE CadastroUsuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Completo VARCHAR(150),
    Email VARCHAR(100) UNIQUE,
    Senha VARCHAR(255),

    Endereco VARCHAR(255),
    Data_Nascimento DATE,
    Telefone VARCHAR(20),
    Genero ENUM('Feminino', 'Masculino', 'Outro', 'Prefiro não dizer')
);

CREATE TABLE CadastroAnimal (
    ID_Animal INT PRIMARY KEY AUTO_INCREMENT,
    ID_Imagem VARCHAR(255), -- pode ser o caminho da imagem ou um ID se for armazenada externamente

    -- 1. Identificação básica
    Nome_Animal VARCHAR(100),
    Especie ENUM('Cão', 'Gato', 'Outro'),
    Outra_Especie VARCHAR(100),
    Sexo ENUM('Macho', 'Fêmea'),
    Idade_Aproximada ENUM('Filhote', 'Jovem', 'Adulto', 'Idoso'),
    Raca_Definida BOOLEAN,
    Nome_Raca VARCHAR(100),
    
    -- 2. Características físicas
    Porte ENUM('Pequeno', 'Médio', 'Grande'),
    Tipo_Pelagem ENUM('Pelo curto', 'Pelo médio', 'Pelo longo', 'Hipoalergênico'),
    Cor_Pelagem ENUM('Clara', 'Escura', 'Mesclada / Tigrada', 'Rajada / Malhada', 'Exótica / Diferente'),
    Solta_Pelo ENUM('Sim, bastante', 'Um pouco', 'Muito pouco', 'Praticamente nada'),

    -- 3. Saúde e cuidados
    Castrado ENUM('Sim', 'Não', 'Será castrado antes da adoção'),
    Condicao_Saude ENUM('Sim', 'Não', 'Em tratamento', 'Histórico de doença já tratada'),
    Detalhe_Saude VARCHAR(255),
    Cuidados_Especiais BOOLEAN,
    Detalhe_Cuidados VARCHAR(255),
    Vacinado ENUM('Sim, com carteira atualizada', 'Parcialmente vacinado', 'Não vacinado'),

    -- 4. Personalidade e comportamento
    Nivel_Energia ENUM('Baixo', 'Médio', 'Alto'),
    Sociavel_Criancas ENUM('Sim', 'Não', 'Não testado'),
    Sociavel_Caes ENUM('Sim', 'Não', 'Não testado'),
    Sociavel_Gatos ENUM('Sim', 'Não', 'Não testado'),
    Comportamento_Desconhecidos ENUM('Muito receptivo', 'Tímido no início, mas se adapta', 'Desconfiado e medroso', 'Agressivo'),
    Adestramento ENUM('Sim, básico', 'Sim, avançado', 'Não', 'Em processo de adestramento'),

    -- 18. Comportamentos conhecidos
    Comport_LatidoExcessivo BOOLEAN,
    Comport_MedoBarulhos BOOLEAN,
    Comport_Foge BOOLEAN,
    Comport_Destruidor BOOLEAN,
    Comport_Higiene BOOLEAN,
    Comport_Carente BOOLEAN,
    Comport_Comilao BOOLEAN,
    Comport_Dorminhoco BOOLEAN,
    Comport_Ansioso BOOLEAN,

    -- 5. Outras informações
    Local_Atual ENUM('Em abrigo', 'Em lar temporário', 'Na casa do responsável', 'Outro'),
    Outro_Local VARCHAR(100),
    Restricao_Lar BOOLEAN,
    Detalhe_Restricao VARCHAR(255),
    Observacoes TEXT
);

CREATE TABLE TesteHumano (
    ID_Teste INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    
    -- Estilo de Vida
    Estilo_Vida VARCHAR(100),
    Formato_Trabalho VARCHAR(100),
    Tempo_Disponivel VARCHAR(100),

    -- Estrutura familiar e apoio
    Rede_Apoio VARCHAR(100),
    Emergencia_Custos VARCHAR(100),
    Viagens_Opcao VARCHAR(100),

    -- Ambiente
    Info_Casa VARCHAR(100),
    Area_Pet VARCHAR(100),
    Via_Movimentada VARCHAR(100),
    Ambiente_Barulho VARCHAR(100),
    Importa_Bagunca VARCHAR(100),

    -- Expectativas com o pet
    Expectativa_Comportamento VARCHAR(100),
    Pretende_Adestrar VARCHAR(100),
    Pretende_Castrar VARCHAR(100),
    Preferencia_Porte VARCHAR(100),
    Doenca_Importa VARCHAR(100),
    Preferencia_Raca VARCHAR(100),
    Preferencia_Sexo VARCHAR(100),

    FOREIGN KEY (ID_Usuario) REFERENCES CadastroUsuario(ID_Usuario)
);