module TheRole
  def self.configure(&block)
    yield @config ||= TheRole::Api::Configuration.new
  end

  def self.config
    @config
  end

  # Configuration class
  module Api
    class Configuration
      include ActiveSupport::Configurable
      config_accessor :layout,
                      :destroy_strategy,
                      :default_user_role,
                      :access_denied_method,
                      :login_required_method,
                      :first_user_should_be_admin
    end
  end

  configure do |config|
    config.layout = :application

    config.default_user_role          = nil
    config.access_denied_method       = nil
    config.first_user_should_be_admin = false
    config.login_required_method      = :authenticate_user!
    config.destroy_strategy           = :restrict_with_exception # can be nil
  end
end
