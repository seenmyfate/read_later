require "em-synchrony"
require "em-synchrony/mysql2"

environment(:development) do
  config['db'] = EM::Synchrony::ConnectionPool.new(:size => 20) do
    ::Mysql2::EM::Client.new(hostname: 'localhost', username: ENV['DB_USER'],
                             password: ENV['DB_PASSWORD'], socket: nil,
                             database: 'goliath',
                             reconnect: true)
  end
end

environment(:test) do
  config['db'] = EM::Synchrony::ConnectionPool.new(:size => 20) do
    ::Mysql2::EM::Client.new(hostname: 'localhost', username: ENV['DB_USER'],
                             password: ENV['DB_PASSWORD'], socket: nil,
                             database: 'goliath',
                             reconnect: true)
  end
end
