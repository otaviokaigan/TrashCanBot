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

      return nil unless data['last_executed_at']

      Time.now.to_i - data['last_executed_at']
    else
      nil
    end
  end

  def self.server_open?
    return false unless File.exist?(FILEPATH)

    content = File.read(FILEPATH)
    data = JSON.parse(content)
    data['server_open'] == true
  end

  def self.update_server_status(is_open)
    if File.exist?(FILEPATH)
      content = File.read(FILEPATH)
      data = JSON.parse(content)
    else
      data = {}
    end

    data['server_open'] = is_open
    File.write(FILEPATH, JSON.pretty_generate(data))
    is_open
  end
end
