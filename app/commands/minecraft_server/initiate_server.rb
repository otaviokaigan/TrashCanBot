# frozen_string_literal: true
require_relative '../../services/commands_utils'
require_relative '../../services/minecraft_server/server_manager'

# a namespace to initiate the minecraft server
module InitiateServer
  def self.setup(bot)
    bot.register_application_command(:iniciar, 'Initiate codespace server and crafty server.', server_id: '837301573670797382')
    bot.application_command(:iniciar) do |initializing|
      elapsed_time = CommandsUtils.verify_cooldown
      if elapsed_time.nil? || elapsed_time >= 300
        # for the discord dont having timeout
        initializing.defer
        ServerManager.start
        initializing.edit_response(content: 'Opa, verifique se o servidor de Minecraft está aberto, caso ele não esteja em até 1 minuto, mande mensagem para @Jake?')
        CommandsUtils.cooldown
      else
        minutes = (elapsed_time / 60.0).round(1)
        initializing.respond(content: "O comando não pode ser executado deis que atinja 5 minutos da ultima vez que foi executado, se passaram #{minutes} minutos.")
      end
    end
  end
end
