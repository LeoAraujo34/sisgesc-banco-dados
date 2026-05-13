# SisGESC - Sistema de Gestão Escolar

Projeto de banco de dados desenvolvido para modelar um sistema ERP voltado para uma escola de idiomas, integrando os módulos acadêmico, financeiro e de recursos humanos.


# Objetivo do Projeto

O sistema foi desenvolvido com foco em:

* Modelagem de banco de dados relacional
* Aplicação de normalização até a 3FN
* Integridade referencial
* Separação modular do sistema
* Regras de negócio acadêmicas e financeiras
* Estrutura preparada para expansão futura com BI e IA


# Módulos do Sistema

## Acadêmico

* Cadastro de alunos
* Telefones dos alunos
* Idiomas
* Níveis de ensino
* Turmas
* Matrículas

## Financeiro

* Contratos
* Mensalidades
* Pagamentos
* Controle de inadimplência

## Recursos Humanos

* Cadastro de professores
* Professores por idioma
* Professores por turma
* Controle de aulas
* Folha de pagamento
* Registro de pagamentos aos professores

# Acesso ao DER Online

https://dbdiagram.io/d/DER-SisGesc-69d556f980896296843e5c3d


# Possíveis Expansões Futuras (BI e IA)

* Análise de evasão escolar
* Monitoramento de inadimplência
* Dashboards gerenciais
* Previsão de comportamento de alunos
* Recomendação de cursos por perfil
* Indicadores financeiros e acadêmicos

# Observações

Este projeto foi desenvolvido para fins acadêmicos na disciplina de Banco de Dados do curso de Análise e Desenvolvimento de Sistemas.

## Como Executar o Projeto

### Requisitos

- MySQL Server
- MySQL Workbench

### Passo a Passo

1. Baixe o arquivo `.sql` disponível neste repositório do GitHub.

2. Abra o MySQL Workbench.

3. Conecte-se ao seu servidor MySQL local.

4. Abra o arquivo `.sql` do projeto:

- Vá em `File > Open SQL Script`
- Selecione o arquivo SQL do projeto

5. Execute o script:

- Clique no ícone de raio ⚡ ou pressione:
  `Ctrl + Shift + Enter`
