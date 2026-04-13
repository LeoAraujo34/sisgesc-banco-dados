#SisGESC - Sistema de Gestão Escolar

Projeto de banco de dados desenvolvido para modelar um sistema ERP voltado para uma escola de idiomas, integrando os módulos acadêmico, financeiro e de recursos humanos.


Módulos do Sistema

**Acadêmico**: alunos, turmas, matrículas, níveis e idiomas
**Financeiro**: contratos, mensalidades e pagamentos
**Recursos Humanos**: professores e alocação em turmas


Acesso ao DER Online

https://dbdiagram.io/d/DER-SisGesc-69d556f980896296843e5c3d



#Tecnologias Utilizadas

* MySQL
* dbdiagram.io


Regras de Negócio (Resumo)

* CPF único por aluno
* Matrícula vinculada a aluno e turma existentes
* Turmas obrigatoriamente vinculadas a idioma e nível
* Vínculo financeiro obrigatório para participação acadêmica
* Integridade referencial com uso de `ON DELETE CASCADE` e `ON UPDATE CASCADE`

---

Possíveis Expansões (BI e IA)

* Análise de evasão escolar
* Monitoramento de inadimplência
* Previsão de comportamento de alunos
* Recomendações de cursos com base em perfil

---

## Observações

Este projeto foi desenvolvido para fins acadêmicos, com foco em modelagem de banco de dados relacional, normalização (3FN) e integridade de dados, turma de banco de dados do curso de Ananalise e Desenvolvimento de Sistemas.

---
