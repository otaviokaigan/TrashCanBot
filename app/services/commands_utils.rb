# frozen_string_literal: true

require 'json'

# this cooldown is to the server not being closed before is completed initialized, for not having problems on the minecraft world
module CommandsUtils
  FILEPATH = File.expand_path('../storage/state.json', __dir__)

  def self.cooldown
    File.write(FILEPATH, { last_executed_at: Time.now.to_i }.to_json)
  end

  def self.verify_cooldown
    if File.exist?(FILEPATH)
      content = File.read(FILEPATH)
      data = JSON.parse(content)

      Time.now.to_i - data['last_executed_at']
    else
      nil
    end
  end
end
