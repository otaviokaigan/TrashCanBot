# frozen_string_literal: true

require 'discordrb'
require 'dotenv/load'

require_relative 'commands/initial_commands'
require_relative 'commands/minecraft_server/initiate_server'
require_relative 'commands/minecraft_server/stop_server'
require_relative 'services/commands_utils'

bot = Discordrb::Bot.new token: ENV['TOKEN']
puts 'Bot ta acordando...'

# to update the server status to closed, the minecraft server will not remain open if the bot is offline
CommandsUtils.update_server_status(false)

# /test command
TestController.setup(bot)

# to open minecraft server
InitiateServer.setup(bot)
StopServer.setup(bot)

bot.mention do |msgmention|
  MentionController.handle(msgmention)
end

at_exit { bot.stop }
bot.run
