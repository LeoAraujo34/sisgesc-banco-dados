CREATE DATABASE escola_idiomas;
USE escola_idiomas;
CREATE TABLE tb_alunos(
 pk_aluno INT AUTO_INCREMENT PRIMARY KEY,
 nome_aluno VARCHAR(120) NOT NULL,
 cpf VARCHAR(11) NOT NULL UNIQUE,
 data_nascimento DATE NOT NULL,
 telefone VARCHAR(20) NOT NULL,
 email VARCHAR(200) NOT NULL
);
CREATE TABLE tb_idiomas(
 pk_idioma INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(20) NOT NULL
);
CREATE TABLE tb_niveis(
 pk_nivel INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(20) NOT NULL,
 ordem INT NOT NULL,
 CHECK (ordem > 0)
);
CREATE TABLE tb_turmas(
 pk_turma INT AUTO_INCREMENT PRIMARY KEY,
 nome_turma VARCHAR(50) NOT NULL,
 fk_idioma INT NOT NULL,
 fk_nivel INT NOT NULL,
 horario VARCHAR(20) NOT NULL,
 FOREIGN KEY (fk_idioma) REFERENCES tb_idiomas(pk_idioma)
 ON DELETE RESTRICT
 ON UPDATE CASCADE,
 FOREIGN KEY (fk_nivel) REFERENCES tb_niveis(pk_nivel)
 ON DELETE RESTRICT
 ON UPDATE CASCADE
);
CREATE TABLE tb_matriculas(
 pk_matricula INT AUTO_INCREMENT PRIMARY KEY,
 fk_aluno INT NOT NULL,
 fk_turma INT NOT NULL,
 data_matricula DATE NOT NULL,
 status_curso VARCHAR(20) NOT NULL DEFAULT 'ativo',
 CHECK (status_curso IN ('ativo','trancado','concluido')),
FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(pk_aluno)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE tb_professores (
pk_professor INT AUTO_INCREMENT PRIMARY KEY,
nome_professor VARCHAR(120) NOT NULL,
fk_idioma INT NOT NULL,
telefone VARCHAR(20) NOT NULL,
email VARCHAR(200) NOT NULL,
FOREIGN KEY (fk_idioma) REFERENCES tb_idiomas(pk_idioma)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE tb_professor_turma (
pk_professor_turma INT AUTO_INCREMENT PRIMARY KEY,
fk_professor INT NOT NULL,
fk_turma INT NOT NULL,
FOREIGN KEY (fk_professor) REFERENCES tb_professores(pk_professor)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE tb_contratos(
 pk_contrato INT AUTO_INCREMENT PRIMARY KEY,
 fk_aluno INT NOT NULL,
 data_contrato DATE NOT NULL,
 status_matricula VARCHAR(30) NOT NULL DEFAULT 'ativo',
 CHECK (status_matricula IN ('ativo','cancelado')),
 FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(pk_aluno)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
CREATE TABLE tb_mensalidades(
 pk_mensalidade INT AUTO_INCREMENT PRIMARY KEY,
 fk_contrato INT NOT NULL,
 valor DECIMAL(10,2) NOT NULL,
 data_vencimento DATE NOT NULL,
 status VARCHAR(30) NOT NULL DEFAULT 'pendente',
 CHECK (valor > 0),
 CHECK (status IN ('pendente','pago','atrasado')),
 FOREIGN KEY (fk_contrato) REFERENCES tb_contratos(pk_contrato)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE tb_pagamentos(
 pk_pagamento INT AUTO_INCREMENT PRIMARY KEY,
 fk_mensalidade INT NOT NULL,
 data_pagamento DATE NOT NULL,
 valor_pago DECIMAL(10,2) NOT NULL,
 forma_pagamento VARCHAR(20) NOT NULL,
CHECK (valor_pago > 0),
FOREIGN KEY (fk_mensalidade) REFERENCES tb_mensalidades(pk_mensalidade)
ON DELETE CASCADE
ON UPDATE CASCADE
);


