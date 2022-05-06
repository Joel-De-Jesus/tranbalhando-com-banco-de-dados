-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Maio-2022 às 16:43
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_projecto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL DEFAULT 'Não Informado',
  `localizacao` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`id`, `descricao`, `localizacao`, `created_at`, `updated_at`) VALUES
(1, 'Dep 1', '1 Andar a esquerda', '2022-05-06 12:04:45', '2022-05-06 12:04:45'),
(2, 'Dep 2', '1 Andar a direita', '2022-05-06 12:05:11', '2022-05-06 12:05:11'),
(3, 'Dep 3', '2 Andar a esquerda', '2022-05-06 12:05:45', '2022-05-06 12:05:45'),
(4, 'Dep 4', '1 Andar a direita', '2022-05-06 13:25:58', '2022-05-06 13:25:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao`
--

CREATE TABLE `funcao` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `salario` double(20,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcao`
--

INSERT INTO `funcao` (`id`, `nome`, `salario`, `created_at`, `updated_at`) VALUES
(1, 'Lenvantamento de requisitos', 4000.00, '2022-05-06 12:31:44', '2022-05-06 12:59:15'),
(2, 'Análise de requisitos', 5000.00, '2022-05-06 12:32:39', '2022-05-06 12:32:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `genero_id` int(11) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `dt_nascimento`, `genero_id`, `departamento_id`, `created_at`, `updated_at`) VALUES
(1, 'Joel L. Mandrasse', '2000-10-11', 1, 1, '2022-05-06 10:08:13', '2022-05-06 10:08:13'),
(2, 'Amós L. Mandrasse', '1982-04-07', 1, 1, '2022-05-06 10:08:44', '2022-05-06 10:08:44'),
(3, 'José Machava', '1997-08-01', 1, 1, '2022-05-06 11:34:24', '2022-05-06 11:34:24'),
(4, 'Aires Langa', '1998-07-11', 1, 2, '2022-05-06 11:35:01', '2022-05-06 11:35:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id`, `descricao`) VALUES
(1, 'Masculino'),
(2, 'Feminino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projecto`
--

CREATE TABLE `projecto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `orcamento` double(20,2) NOT NULL,
  `dt_inicio` date NOT NULL,
  `dt_prev_termino` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Extraindo dados da tabela `projecto`
--

INSERT INTO `projecto` (`id`, `nome`, `orcamento`, `dt_inicio`, `dt_prev_termino`, `created_at`, `updated_at`) VALUES
(1, 'Criação de dispositivos para a facilitação no diálogo diário entre pessoas de diferentes idiomas', 110000.00, '2022-06-10', '2023-06-10', '2022-05-06 12:25:21', '2022-05-06 12:25:21'),
(2, 'Meios de segurança contra invasores dos sistemas do governo', 91000.00, '2022-06-10', '2022-06-11', '2022-05-06 12:27:51', '2022-05-06 12:28:34'),
(3, 'Sistema de gerenciamento de equipamentos', 70000.00, '2022-08-20', '2023-07-20', '2022-05-06 14:33:05', '2022-05-06 14:33:05');

--
-- Acionadores `projecto`
--
DELIMITER $$
CREATE TRIGGER `tgr_criar_projecto` AFTER INSERT ON `projecto` FOR EACH ROW INSERT INTO situacao (situacao.projecto_id, situacao.status) VALUES (NEW.id, 'Novo projecto adicionado.')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `situacao`
--

CREATE TABLE `situacao` (
  `id` int(11) NOT NULL,
  `projecto_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `situacao`
--

INSERT INTO `situacao` (`id`, `projecto_id`, `status`) VALUES
(1, 3, 'Novo projecto adicionado.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha`
--

CREATE TABLE `trabalha` (
  `funcionario_id` int(11) NOT NULL,
  `projecto_id` int(11) NOT NULL,
  `funcao_id` int(11) NOT NULL,
  `dt_entrada` date NOT NULL,
  `dt_saida` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Extraindo dados da tabela `trabalha`
--

INSERT INTO `trabalha` (`funcionario_id`, `projecto_id`, `funcao_id`, `dt_entrada`, `dt_saida`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-06-20', '2022-07-20', '2022-05-06 10:36:47', '2022-05-06 10:36:47'),
(1, 2, 1, '2022-06-20', '2022-07-20', '2022-05-06 10:37:45', '2022-05-06 10:37:45'),
(2, 1, 2, '2022-06-20', '2022-07-20', '2022-05-06 10:38:11', '2022-05-06 10:57:57');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcao`
--
ALTER TABLE `funcao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_departamento_funcionario` (`departamento_id`),
  ADD KEY `fk_genero_funcionario` (`genero_id`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `projecto`
--
ALTER TABLE `projecto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `situacao`
--
ALTER TABLE `situacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_projecto_situacao` (`projecto_id`);

--
-- Índices para tabela `trabalha`
--
ALTER TABLE `trabalha`
  ADD PRIMARY KEY (`funcionario_id`,`projecto_id`),
  ADD KEY `fk_projecto_trabalha` (`projecto_id`),
  ADD KEY `fk_funcao_trabalha` (`funcao_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `projecto`
--
ALTER TABLE `projecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `situacao`
--
ALTER TABLE `situacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_departamento_funcionario` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`),
  ADD CONSTRAINT `fk_genero_funcionario` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `situacao`
--
ALTER TABLE `situacao`
  ADD CONSTRAINT `fk_projecto_situacao` FOREIGN KEY (`projecto_id`) REFERENCES `projecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `trabalha`
--
ALTER TABLE `trabalha`
  ADD CONSTRAINT `fk_funcao_trabalha` FOREIGN KEY (`funcao_id`) REFERENCES `funcao` (`id`),
  ADD CONSTRAINT `fk_funcionario_trabalha` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`),
  ADD CONSTRAINT `fk_projecto_trabalha` FOREIGN KEY (`projecto_id`) REFERENCES `projecto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
