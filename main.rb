require 'discordrb'
require_relative './app/controllers/initialcommands'
require 'dotenv/load'

bot = Discordrb::Bot.new token: ENV['TOKEN']
puts 'Bot ta acordando...'

TestController.setup(bot)

bot.mention do |msgmention|
    MentionController.handle(msgmention)
end

at_exit { bot.stop }
bot.run