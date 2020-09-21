-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Set-2020 às 00:08
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cinema`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ator`
--

CREATE TABLE `ator` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ator`
--

INSERT INTO `ator` (`id`, `nome`) VALUES
(1, 'Leonardo DiCaprio'),
(2, 'Kate Winslet'),
(3, 'Al Pacino'),
(4, 'Marlon Brando'),
(5, 'James Caan'),
(6, 'Jonah Hill'),
(7, 'Jordan Belfort'),
(8, 'Robert De Niro'),
(9, 'Joe Pesci\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bilheteria`
--

CREATE TABLE `bilheteria` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `bilheteria`
--

INSERT INTO `bilheteria` (`id`, `nome`) VALUES
(1, 'Bilheteria 1'),
(2, 'Bilheteria 2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `diretor`
--

CREATE TABLE `diretor` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `diretor`
--

INSERT INTO `diretor` (`id`, `nome`) VALUES
(1, 'James Cameron\r\n'),
(2, 'Francis Ford Coppola\r\n'),
(3, 'Martin Scorsese');

-- --------------------------------------------------------

--
-- Estrutura da tabela `elenco`
--

CREATE TABLE `elenco` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `elenco`
--

INSERT INTO `elenco` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `elenco_ator`
--

CREATE TABLE `elenco_ator` (
  `id` int(11) NOT NULL,
  `id_ator` int(11) NOT NULL,
  `id_elenco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `elenco_ator`
--

INSERT INTO `elenco_ator` (`id`, `id_ator`, `id_elenco`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 3),
(7, 7, 3),
(8, 1, 3),
(9, 3, 4),
(10, 9, 4),
(11, 8, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `filme`
--

CREATE TABLE `filme` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `sinopse` text DEFAULT NULL,
  `id_elenco` int(11) NOT NULL,
  `id_diretor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `filme`
--

INSERT INTO `filme` (`id`, `nome`, `sinopse`, `id_elenco`, `id_diretor`) VALUES
(1, 'Titanic', 'Um artista pobre e uma jovem rica se conhecem e se apaixonam na fatídica jornada do Titanic, em 1912. Embora esteja noiva do arrogante herdeiro de uma siderúrgica, a jovem desafia sua família e amigos em busca do verdadeiro amor.\r\n', 1, 1),
(2, 'O Poderoso Chefão\r\n', 'Em 1945, Don Corleone (Marlon Brando) é o chefe de uma mafiosa família italiana de Nova York. Ele costuma apadrinhar várias pessoas, realizando importantes favores para elas, em troca de favores futuros. Porém, uma máfia rival resolve levar o tráfico de narcóticos para Nova York e Don Corleone não facilita essa entrada, nem com ajuda policial, nem política. A família Corleone passa então a sofrer atentados e seu filho Michael, um capitão da marinha muito decorado que há pouco voltou da 2ª Guerra Mundial decide ajudar seu pai protegendo seu legado.', 2, 2),
(3, 'O Lobo de Wall Street', 'Jordan Belfort é um ambicioso corretor da bolsa de valores que cria um verdadeiro império, enriquecendo de forma rápida, porém ilegal. Ele e seus amigos mergulham em um mundo de excessos, mas seus métodos ilícitos despertam a atenção da polícia.\r\n', 3, 3),
(4, 'O Irlandês', 'O Irlandês conta a história de Frank \"The Irishman\" Sheeran, um sindicalista e veterano da Segunda Guerra Mundial que se torna num assassino a soldo para a máfia.', 4, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id`, `descricao`) VALUES
(1, 'Romance'),
(2, 'Drama'),
(3, 'Terror'),
(4, 'Aventura'),
(5, 'Ação'),
(6, 'Comédia'),
(7, 'Crime'),
(8, 'Ficção policial'),
(9, 'Máfia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero_filme`
--

CREATE TABLE `genero_filme` (
  `id_genero` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `genero_filme`
--

INSERT INTO `genero_filme` (`id_genero`, `id_filme`) VALUES
(1, 1),
(2, 1),
(2, 2),
(7, 2),
(8, 3),
(6, 3),
(9, 4),
(7, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingresso`
--

CREATE TABLE `ingresso` (
  `id` int(11) NOT NULL,
  `preco` float DEFAULT NULL,
  `id_sessao` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `numero_cadeira` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ingresso`
--

INSERT INTO `ingresso` (`id`, `preco`, `id_sessao`, `id_sala`, `numero_cadeira`) VALUES
(1, 10, 1, 1, '12A'),
(2, 20, 2, 3, '5C'),
(3, 15, 3, 2, '14D'),
(4, 25, 4, 4, '8D');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingresso_bilheteria`
--

CREATE TABLE `ingresso_bilheteria` (
  `id_ingresso` int(11) NOT NULL,
  `id_bilheteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ingresso_bilheteria`
--

INSERT INTO `ingresso_bilheteria` (`id_ingresso`, `id_bilheteria`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `capacidade` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sala`
--

INSERT INTO `sala` (`id`, `nome`, `capacidade`) VALUES
(1, 'Sala 1', 50),
(2, 'Sala 2', 35),
(3, 'Sala 3', 95),
(4, 'Sala 4', 63);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessao`
--

CREATE TABLE `sessao` (
  `id` int(11) NOT NULL,
  `horario` datetime DEFAULT NULL,
  `id_filme` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sessao`
--

INSERT INTO `sessao` (`id`, `horario`, `id_filme`, `nome`) VALUES
(1, '2020-09-16 18:35:10', 1, 'Sessão 1'),
(2, '2020-10-22 18:39:29', 2, 'Sessão 2\r\n'),
(3, '2020-11-11 18:46:04', 3, 'Sessão 3'),
(4, '2020-09-21 21:30:00', 4, 'Sessão 4');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ator`
--
ALTER TABLE `ator`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `bilheteria`
--
ALTER TABLE `bilheteria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `diretor`
--
ALTER TABLE `diretor`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `elenco`
--
ALTER TABLE `elenco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `elenco_ator`
--
ALTER TABLE `elenco_ator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ator` (`id_ator`),
  ADD KEY `id_elenco` (`id_elenco`);

--
-- Índices para tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_elenco` (`id_elenco`),
  ADD KEY `id_diretor` (`id_diretor`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `genero_filme`
--
ALTER TABLE `genero_filme`
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_filme` (`id_filme`);

--
-- Índices para tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sessao` (`id_sessao`),
  ADD KEY `id_sala` (`id_sala`);

--
-- Índices para tabela `ingresso_bilheteria`
--
ALTER TABLE `ingresso_bilheteria`
  ADD KEY `id_ingresso` (`id_ingresso`),
  ADD KEY `id_bilheteria` (`id_bilheteria`);

--
-- Índices para tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_filme` (`id_filme`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ator`
--
ALTER TABLE `ator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `bilheteria`
--
ALTER TABLE `bilheteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `diretor`
--
ALTER TABLE `diretor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `elenco`
--
ALTER TABLE `elenco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `elenco_ator`
--
ALTER TABLE `elenco_ator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `ingresso`
--
ALTER TABLE `ingresso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sessao`
--
ALTER TABLE `sessao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `elenco_ator`
--
ALTER TABLE `elenco_ator`
  ADD CONSTRAINT `elenco_ator_ibfk_1` FOREIGN KEY (`id_ator`) REFERENCES `ator` (`id`),
  ADD CONSTRAINT `elenco_ator_ibfk_2` FOREIGN KEY (`id_elenco`) REFERENCES `elenco` (`id`);

--
-- Limitadores para a tabela `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_elenco`) REFERENCES `elenco` (`id`),
  ADD CONSTRAINT `filme_ibfk_2` FOREIGN KEY (`id_diretor`) REFERENCES `diretor` (`id`);

--
-- Limitadores para a tabela `genero_filme`
--
ALTER TABLE `genero_filme`
  ADD CONSTRAINT `genero_filme_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `genero_filme_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`);

--
-- Limitadores para a tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessao` (`id`),
  ADD CONSTRAINT `ingresso_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`);

--
-- Limitadores para a tabela `ingresso_bilheteria`
--
ALTER TABLE `ingresso_bilheteria`
  ADD CONSTRAINT `ingresso_bilheteria_ibfk_1` FOREIGN KEY (`id_ingresso`) REFERENCES `ingresso` (`id`),
  ADD CONSTRAINT `ingresso_bilheteria_ibfk_2` FOREIGN KEY (`id_bilheteria`) REFERENCES `bilheteria` (`id`);

--
-- Limitadores para a tabela `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
