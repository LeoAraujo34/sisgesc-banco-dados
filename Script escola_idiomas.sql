CREATE DATABASE escola_idiomas; 
 USE escola_idiomas; 

CREATE TABLE tb_alunos( 
pk_aluno INT AUTO_INCREMENT PRIMARY KEY, 
primeiro_nome VARCHAR(60) NOT NULL, sobrenome VARCHAR(100) NOT NULL, cpf CHAR(11) NOT NULL UNIQUE, 
data_nascimento DATE NOT NULL, email VARCHAR(200) NOT NULL UNIQUE); 

CREATE TABLE tb_telefones( 
pk_telefone INT AUTO_INCREMENT PRIMARY KEY, fk_aluno INT NOT NULL, 
numero VARCHAR(20) NOT NULL, 
FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(pk_aluno) ON DELETE CASCADE); 

CREATE TABLE tb_idiomas( 
pk_idioma INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(20) NOT NULL UNIQUE); 

CREATE TABLE tb_niveis( 
pk_nivel INT AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(20) NOT NULL, 
ordem INT NOT NULL, fk_idioma INT NOT NULL, 
FOREIGN KEY (fk_idioma) REFERENCES tb_idiomas(pk_idioma) ON DELETE RESTRICT, 
UNIQUE (fk_idioma, ordem)); 

CREATE TABLE tb_turmas( 
pk_turma INT AUTO_INCREMENT PRIMARY KEY, 
nome_turma VARCHAR(50) NOT NULL, fk_nivel INT NOT NULL, 
horario VARCHAR(20) NOT NULL, 
FOREIGN KEY (fk_nivel) REFERENCES tb_niveis(pk_nivel) ON DELETE RESTRICT); 

CREATE TABLE tb_matriculas( 
fk_aluno INT NOT NULL, fk_turma INT NOT NULL, data_matricula DATE NOT NULL, 
status_curso ENUM('ativo','trancado','concluido') NOT NULL DEFAULT 'ativo', PRIMARY KEY (fk_aluno, fk_turma), 
FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(pk_aluno) ON DELETE CASCADE, FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma) ON DELETE RESTRICT); 

CREATE TABLE tb_contratos( 
pk_contrato INT AUTO_INCREMENT PRIMARY KEY, fk_aluno INT NOT NULL, 
data_contrato DATE NOT NULL, 
status_matricula ENUM('ativo','cancelado') NOT NULL DEFAULT 'ativo', FOREIGN KEY (fk_aluno) REFERENCES tb_alunos(pk_aluno) 
ON DELETE RESTRICT); 

CREATE TABLE tb_mensalidades( 
pk_mensalidade INT AUTO_INCREMENT PRIMARY KEY, fk_contrato INT NOT NULL, 
valor DECIMAL(10,2) NOT NULL, 
data_vencimento DATE NOT NULL, 
status ENUM('pendente','pago','atrasado') NOT NULL DEFAULT 'pendente', FOREIGN KEY (fk_contrato) REFERENCES tb_contratos(pk_contrato) 
ON DELETE CASCADE); 
CREATE TABLE tb_pagamentos( fk_mensalidade INT PRIMARY KEY, data_pagamento DATE NOT NULL, valor_pago DECIMAL(10,2) NOT NULL, forma_pagamento VARCHAR(20) NOT NULL, 
FOREIGN KEY (fk_mensalidade) REFERENCES tb_mensalidades(pk_mensalidade) ON DELETE RESTRICT); 

CREATE TABLE tb_professores( 
pk_professor INT AUTO_INCREMENT PRIMARY KEY, primeiro_nome VARCHAR(60) NOT NULL, sobrenome VARCHAR(100) NOT NULL, 
cpf CHAR(11) NOT NULL UNIQUE, email VARCHAR(200) NOT NULL UNIQUE); 
CREATE TABLE tb_professor_turma( fk_professor INT NOT NULL, fk_turma INT NOT NULL, 
PRIMARY KEY (fk_professor, fk_turma), 
FOREIGN KEY (fk_professor) REFERENCES tb_professores(pk_professor) ON DELETE CASCADE, 
FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma) ON DELETE RESTRICT); 

CREATE TABLE tb_professor_idioma( fk_professor INT, 
fk_idioma INT, 
PRIMARY KEY (fk_professor, fk_idioma), 
FOREIGN KEY (fk_professor) REFERENCES tb_professores(pk_professor) ON DELETE CASCADE, 
FOREIGN KEY (fk_idioma) REFERENCES tb_idiomas(pk_idioma) ON DELETE RESTRICT); 

CREATE TABLE tb_folha_pagamento( 
pk_folha INT AUTO_INCREMENT PRIMARY KEY, 
fk_professor INT NOT NULL, mes INT NOT NULL, 
ano INT NOT NULL, 
salario_base DECIMAL(10,2) NOT NULL, salario_liquido DECIMAL(10,2) NOT NULL, UNIQUE (fk_professor, mes, ano), 
FOREIGN KEY (fk_professor) REFERENCES tb_professores(pk_professor) ON DELETE RESTRICT); 

CREATE TABLE tb_aulas( 
pk_aula INT AUTO_INCREMENT PRIMARY KEY, 
fk_professor INT NOT NULL, 
fk_turma INT NOT NULL, 
data_aula DATE NOT NULL,
horas DECIMAL(4,2) NOT NULL, 
valor_hora DECIMAL(10,2) NOT NULL, 
FOREIGN KEY (fk_professor) REFERENCES tb_professores(pk_professor) ON DELETE CASCADE, 
FOREIGN KEY (fk_turma) REFERENCES tb_turmas(pk_turma) ON DELETE RESTRICT); 

CREATE TABLE tb_pagamentos_professor ( 
pk_pagamento INT AUTO_INCREMENT PRIMARY KEY, 
fk_folha INT NOT NULL, 
data_pagamento DATE NOT NULL, 
valor_pago DECIMAL(10,2) NOT NULL, 
observacao VARCHAR(200), 
FOREIGN KEY (fk_folha) 
REFERENCES tb_folha_pagamento(pk_folha)); 

 

 

 

 

 

 

 

 

 

 
