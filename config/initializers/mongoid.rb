Mongoid.configure do |config|
  config.load_defaults 8.1
end

# GlobalID is used by ActiveJob (among other things)
# https://github.com/rails/globalid
Mongoid::Document.include GlobalID::Identification
Mongoid::Association::Proxy.include GlobalID::Identification

if defined?(Boolean)
  raise "Boolean class already defined"
end

# Alias Mongoid::Boolean to Boolean
# Mongoid 7.3 removed this alias, and access to the type must now use 'Mongoid::Boolean'
# As long as we are using mongoid this alias is useful
Boolean = Mongoid::Boolean

# this block will only run for `rails console`
Rails.application.console do
  # Make DB logs less verbose
  Mongoid.configure do |config|
    config.log_level = :info
  end

  Mongo::Logger.logger.level = :info
end
