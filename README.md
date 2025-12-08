# 🗑️ TrashCan Bot

> **Status:** Em Desenvolvimento 🚧

Um bot experimental para Discord desenvolvido em **Ruby**, focado no aprendizado da sintaxe da linguagem e na implementação de uma **Arquitetura MVC (Model-View-Controller)** adaptada para bots.

## 💻 Tecnologias e Conceitos

* **Ruby** (Linguagem Principal)
* **Discordrb** (Gem para interação com a API do Discord)
* **Dotenv** (Segurança de credenciais)
* **Padrão MVC:** Estrutura de pastas organizada separando responsabilidades, preparada para escalabilidade futura.

## ⚙️ Funcionalidades

O bot atua como um laboratório de testes para interações:

* 🔧 **Slash Commands (/test):** Verificação de conectividade e status. O comando testa se o bot está recebendo e respondendo corretamente às interações da API do Discord.
* 🛡️ **Detector de Menções:** Lógica condicional (`Controllers`) que processa mensagens naturais e responde baseando-se no contexto (saudações, reações, etc).

## 📂 Estrutura do Projeto

O projeto segue uma organização MVC para facilitar a manutenção:

```text
TrashCanBot/
├── app/
│   ├── controllers/    # Lógica de comandos e respostas (Ativo)
│   ├── models/         # Estrutura preparada para Banco de Dados (Futuro)
│   └── views/          # Estrutura preparada para Templates de Resposta (Futuro)
├── .env                # Token (Seguro/Não versionado)
├── main.rb             # Arquivo de entrada (Execução)