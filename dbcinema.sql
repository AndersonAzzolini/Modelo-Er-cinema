
CREATE DATABASE `cinema`


CREATE TABLE `ator` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

CREATE TABLE `bilheteria` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------


CREATE TABLE `diretor` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------


CREATE TABLE `elenco` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `elenco_ator` (
  `id` int(11) NOT NULL,
  `id_ator` int(11) NOT NULL,
  `id_elenco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `filme` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `sinopse` text DEFAULT NULL,
  `id_elenco` int(11) NOT NULL,
  `id_diretor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `genero_filme` (
  `id_genero` int(11) NOT NULL,
  `id_filme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
CREATE TABLE `ingresso` (
  `id` int(11) NOT NULL,
  `preco` float DEFAULT NULL,
  `id_sessao` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `numero_cadeira` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `ingresso_bilheteria` (
  `id_ingresso` int(11) NOT NULL,
  `id_bilheteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `capacidade` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

CREATE TABLE `sessao` (
  `id` int(11) NOT NULL,
  `horario` datetime DEFAULT NULL,
  `id_filme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
ALTER TABLE `ator`
  ADD PRIMARY KEY (`id`);
--
ALTER TABLE `bilheteria`
  ADD PRIMARY KEY (`id`);
--
ALTER TABLE `diretor`
  ADD PRIMARY KEY (`id`);
--
ALTER TABLE `elenco`
  ADD PRIMARY KEY (`id`);
--
ALTER TABLE `elenco_ator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ator` (`id_ator`),
  ADD KEY `id_elenco` (`id_elenco`);
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_elenco` (`id_elenco`),
  ADD KEY `id_diretor` (`id_diretor`);
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);
--
ALTER TABLE `genero_filme`
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_filme` (`id_filme`);
--
ALTER TABLE `ingresso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sessao` (`id_sessao`),
  ADD KEY `id_sala` (`id_sala`);
--
ALTER TABLE `ingresso_bilheteria`
  ADD KEY `id_ingresso` (`id_ingresso`),
  ADD KEY `id_bilheteria` (`id_bilheteria`);
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_filme` (`id_filme`);
--
ALTER TABLE `ator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
ALTER TABLE `bilheteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
ALTER TABLE `diretor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
ALTER TABLE `elenco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
ALTER TABLE `elenco_ator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
ALTER TABLE `filme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
ALTER TABLE `ingresso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
ALTER TABLE `sessao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
ALTER TABLE `elenco_ator`
  ADD CONSTRAINT `elenco_ator_ibfk_1` FOREIGN KEY (`id_ator`) REFERENCES `ator` (`id`),
  ADD CONSTRAINT `elenco_ator_ibfk_2` FOREIGN KEY (`id_elenco`) REFERENCES `elenco` (`id`);

--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`id_elenco`) REFERENCES `elenco` (`id`),
  ADD CONSTRAINT `filme_ibfk_2` FOREIGN KEY (`id_diretor`) REFERENCES `diretor` (`id`);

--
ALTER TABLE `genero_filme`
  ADD CONSTRAINT `genero_filme_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `genero_filme_ibfk_2` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`);

--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessao` (`id`),
  ADD CONSTRAINT `ingresso_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`);

--
ALTER TABLE `ingresso_bilheteria`
  ADD CONSTRAINT `ingresso_bilheteria_ibfk_1` FOREIGN KEY (`id_ingresso`) REFERENCES `ingresso` (`id`),
  ADD CONSTRAINT `ingresso_bilheteria_ibfk_2` FOREIGN KEY (`id_bilheteria`) REFERENCES `bilheteria` (`id`);

--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`);

