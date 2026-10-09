# frozen_string_literal: true

require 'discordrb'
require 'dotenv/load'

require_relative 'commands/initial_commands'
require_relative 'commands/minecraft_server/initiate_server'
require_relative 'commands/minecraft_server/stop_server'

bot = Discordrb::Bot.new token: ENV['TOKEN']
puts 'Bot ta acordando...'

TestController.setup(bot)

# to open minecraft server

InitiateServer.setup(bot)
StopServer.setup(bot)

bot.mention do |msgmention|
  MentionController.handle(msgmention)
end

at_exit { bot.stop }
bot.run
