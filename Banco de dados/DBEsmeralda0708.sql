-- Apaga o banco se já existir pra evitar conflito
DROP DATABASE IF EXISTS DBEsmeralda;

-- Cria o banco de dados do projeto Esmeralda
CREATE DATABASE DBEsmeralda;

-- Seleciona o banco pra usar
USE DBEsmeralda;

-- ============================================================
-- Tabela de usuários cadastrados no sistema
-- ============================================================
CREATE TABLE CadastroUsuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT, -- id único de cada usuário
    Nome_Completo VARCHAR(150), -- nome completo
    Email VARCHAR(100) UNIQUE, -- email único (não pode repetir)
    Senha VARCHAR(255), -- senha (armazenada de forma criptografada)

    Endereco VARCHAR(255), -- endereço completo
    Data_Nascimento DATE, -- data de nascimento
    Telefone VARCHAR(20), -- telefone de contato
    Genero ENUM('Feminino', 'Masculino', 'Outro', 'Prefiro não dizer') -- gênero do usuário
);

-- ============================================================
-- Tabela de animais disponíveis para adoção
-- ============================================================
CREATE TABLE CadastroAnimal (
    ID_Animal INT PRIMARY KEY AUTO_INCREMENT, -- id único do animal
    ID_Imagem VARCHAR(255), -- caminho ou id da imagem

    -- Identificação básica
    Nome_Animal VARCHAR(100), -- nome do animal
    Especie ENUM('Cão', 'Gato', 'Outro'), -- espécie
    Outra_Especie VARCHAR(100), -- caso seja diferente
    Sexo ENUM('Macho', 'Fêmea'), -- sexo do animal
    Idade_Aproximada ENUM('Filhote', 'Jovem', 'Adulto', 'Idoso'), -- faixa etária
    Raca_Definida BOOLEAN, -- se a raça é definida ou não
    Nome_Raca VARCHAR(100), -- nome da raça (se tiver)

    -- Características físicas
    Porte ENUM('Pequeno', 'Médio', 'Grande'), -- porte do animal
    Tipo_Pelagem ENUM('Pelo curto', 'Pelo médio', 'Pelo longo', 'Hipoalergênico'), -- tipo de pelo
    Cor_Pelagem ENUM('Clara', 'Escura', 'Mesclada / Tigrada', 'Rajada / Malhada', 'Exótica / Diferente'), -- cor da pelagem
    Solta_Pelo ENUM('Sim, bastante', 'Um pouco', 'Muito pouco', 'Praticamente nada'), -- nível de queda de pelo

    -- Saúde e cuidados
    Castrado ENUM('Sim', 'Não', 'Será castrado antes da adoção'), -- castração
    Condicao_Saude ENUM('Sim', 'Não', 'Em tratamento', 'Histórico de doença já tratada'), -- condição de saúde
    Detalhe_Saude VARCHAR(255), -- detalhes de saúde
    Cuidados_Especiais BOOLEAN, -- se precisa de cuidados especiais
    Detalhe_Cuidados VARCHAR(255), -- detalhe dos cuidados
    Vacinado ENUM('Sim, com carteira atualizada', 'Parcialmente vacinado', 'Não vacinado'), -- status da vacinação

    -- Personalidade e comportamento
    Nivel_Energia ENUM('Baixo', 'Médio', 'Alto'), -- nível de energia
    Sociavel_Criancas ENUM('Sim', 'Não', 'Não testado'), -- relação com crianças
    Sociavel_Caes ENUM('Sim', 'Não', 'Não testado'), -- relação com cães
    Sociavel_Gatos ENUM('Sim', 'Não', 'Não testado'), -- relação com gatos
    Comportamento_Desconhecidos ENUM('Muito receptivo', 'Tímido no início, mas se adapta', 'Desconfiado e medroso', 'Agressivo'), -- comportamento com estranhos
    Adestramento ENUM('Sim, básico', 'Sim, avançado', 'Não', 'Em processo de adestramento'), -- nível de adestramento

    -- Comportamentos conhecidos
    Comport_LatidoExcessivo BOOLEAN, -- late demais
    Comport_MedoBarulhos BOOLEAN, -- medo de barulhos
    Comport_Foge BOOLEAN, -- tenta fugir
    Comport_Destruidor BOOLEAN, -- destrói coisas
    Comport_Higiene BOOLEAN, -- sabe fazer necessidades no lugar certo
    Comport_Carente BOOLEAN, -- é carente
    Comport_Comilao BOOLEAN, -- come muito
    Comport_Dorminhoco BOOLEAN, -- dorme demais
    Comport_Ansioso BOOLEAN, -- ansioso

    -- Outras informações
    Local_Atual ENUM('Em abrigo', 'Em lar temporário', 'Na casa do responsável', 'Outro'), -- onde está o animal
    Outro_Local VARCHAR(100), -- caso seja outro lugar
    Restricao_Lar BOOLEAN, -- se existe restrição no lar adotante
    Detalhe_Restricao VARCHAR(255), -- detalhe dessa restrição
    Observacoes TEXT -- campo livre para observações
);

-- ============================================================
-- Tabela do teste de perfil humano (adotante)
-- ============================================================
CREATE TABLE TesteHumano (
    ID_Teste INT PRIMARY KEY AUTO_INCREMENT, -- id do teste
    ID_Usuario INT, -- referência do usuário que respondeu

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

    -- relacionamento: cada teste está ligado a um usuário
    FOREIGN KEY (ID_Usuario) REFERENCES CadastroUsuario(ID_Usuario)
);