# TrashCan Bot

> **Status:** In development

This is a project for my personal use, an experimental bot created using **Ruby** with the [Discordrb](https://github.com/shardlab/discordrb) [gem](https://rubygems.org/gems/discordrb) to perform functions that I thought would be useful for gaming activities. So far, it only serves to open and close a Minecraft server using the CraftyController API.

The bot's language is Brazilian Portuguese (PT-BR) because, as mentioned before, it's a project for my personal use.

## Installation & Quick Start

Follow these steps to get the bot up and running:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/otaviokaigan/TrashCanBot.git](https://github.com/otaviokaigan/TrashCanBot.git)
   cd TrashCanBot
   
2. **Install [dependencies](#prerequisites--system-compatibility):**
   If you don't have [Bundler](https://bundler.io/) installed yet, run:
   ```bash
   gem install bundler
   ```
   Then install the required gems from the Gemfile:
   ```bash
   bundle install
   ```
3. Verify GitHub CLI:
   Ensure [`gh`](https://cli.github.com/) is installed and authenticated:
   ```bash
   gh auth status
4. **Set up environment variables:**
   Configure your secrets inside `app/.env` (refer to the [Environment Variables](#environment-variables) section).
5. **Run the bot:**
   Navigate into the `app/` directory (or run from root):
   ```bash
   cd app
   ruby main.rb

## Prerequisites & System Compatibility

> **Note:** This project is designed and tested for **Linux/macOS** environments (or Windows via WSL2).

The core server management commands in `ServerManager` rely on Unix-specific shell features (such as `echo` piping, `nohup`, background processes `&`, and standard file redirection `2>&1`).

To run this bot, make sure your host machine has:

* **Ruby** (v3.0 or higher)
* **GitHub CLI (`gh`)** installed and available in your system
* **Linux/macOS terminal** (or **WSL2** if running on Windows)
* **cURL** (installed by default in most Linux distributions)

## Technologies & Concepts

* **Ruby** (Main language)
* **Discordrb** (Gem for interaction with Discord API)
* **Dotenv** (Credential security)
* **CraftyController** (Interaction with CraftyController API for open and close a Minecraft server)

## Functionalities

### Commands

* 🔧 **Slash Commands (/test):** Connectivity and status check, created exclusively for testing the Slash command on Discord.

*    **/iniciar:** To open a hosted Minecraft server.
*    **/fechar:** Save and stop the Minecraft server.

### Server Status

The bot should have a function that checks if the server is open. If it is, the server should not be opened again or it can be closed. If it is closed, the server should not be closed again or it can be opened.

### Cooldown

The bot has a wait timeout function between commands to prevent spam and overloading the Minecraft server.

## Environment Variables

To run this bot, create a `.env` file inside the `app/` directory with the following keys:

| Variable | Description |
| :--- | :--- |
| `TOKEN` | Your Discord Bot Token obtained from the [Discord Developer Portal](https://discord.com/developers/applications). |
| `GHCLI` | A GitHub Personal Access Token (PAT) with permissions to authenticate the GitHub CLI (`gh`). |
| `CDNAME` | The exact name or ID of the GitHub Codespace where the Minecraft server is hosted. |
| `SERVER_ID` | The ID of the specific Minecraft server managed inside Crafty Controller. |
| `CRAFTY_TOKEN` | The API Token generated inside Crafty Controller for authentication. |

## Project Structure

The project use the Command Service Pattern structure. Previously, the project was MVC, but as I progressed with development, I realized that the MVC pattern didn't make sense for this project.

```text
TrashCanBot/
├── app/
│   ├── commands/                 # Discord application/slash commands
│   │   ├── minecraft_server/
│   │   │   ├── initiate_server.rb
│   │   │   └── stop_server.rb
│   │   └── initial_commands.rb
│   ├── services/                 # Core business logic & external integrations
│   │   ├── minecraft_server/
│   │   │   └── server_manager.rb
│   │   └── commands_utils.rb     # Cooldown and server state management utilities
│   ├── storage/                  # Persistent data storage
│   │   └── state.json            # Execution timestamps for cooldowns
│   ├── .env                      # Environment variables
│   └── main.rb                   # Bot initialization and event handlers
├── .gitignore
└── README.md
