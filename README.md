# TrashCan Bot

> **Status:** In development

This is a project for my personal use, an experimental bot created using **Ruby** with the [Discordrb](https://github.com/shardlab/discordrb) [gem](https://rubygems.org/gems/discordrb) to perform functions that I thought would be useful for gaming activities. So far, it only serves to open and close a Minecraft server using the CraftyController API.

The bot's language is Brazilian Portuguese (PT-BR) because, as mentioned before, it's a project for my personal use.

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

* 🔧 **Slash Commands (/test):** Connectivity and status check, created exclusively for testing the Slash command on Discord.

*    **/iniciar:** To open a hosted Minecraft server.
*    **/fechar:** Save and stop the Minecraft server.

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
│   │   └── commands_utils.rb     # Cooldown and state management utilities
│   ├── storage/                  # Persistent data storage
│   │   └── state.json            # Execution timestamps for cooldowns
│   ├── .env                      # Environment variables
│   └── main.rb                   # Bot initialization and event handlers
├── .gitignore
└── README.md
