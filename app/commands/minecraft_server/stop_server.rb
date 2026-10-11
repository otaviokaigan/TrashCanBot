# frozen_string_literal: true
require_relative '../../services/commands_utils'
require_relative '../../services/minecraft_server/server_manager'

# a namespace that stop the minecraft server
module StopServer
  def self.setup(bot)
    bot.register_application_command(:fechar, 'Initiate codespace server and crafty server.', server_id: '837301573670797382')
    bot.application_command(:fechar) do |stopping|
      server = stopping.server
      server_open = CommandsUtils.server_open?
      elapsed_time = CommandsUtils.verify_cooldown
      member = server.member(stopping.user)
      if member.role?(ENV['MINECRAFT_ROLE'])
        if server_open == false
          stopping.respond(content: 'O servidor ja está fechado, não é possivel fechar novamente.')

        elsif elapsed_time.nil? || elapsed_time >= 300
          # for the discord dont having timeout
          stopping.defer
          ServerManager.stop
          stopping.edit_response(content: 'Servidor foi fechado.')
          CommandsUtils.cooldown
          CommandsUtils.update_server_status(false)

        else
          minutes = (elapsed_time / 60.0).round(1)
          stopping.respond(content: "O comando não pode ser executado deis que atinja 5 minutos da ultima vez que foi executado, se passaram #{minutes} minutos.")
        end
      else
        stopping.respond(content: 'Opa, você não tem o cargo "Quadrado" no nosso discord, não é possivel abrir/fechar o servidor de Minecraft.')
      end
    end
  end
end
