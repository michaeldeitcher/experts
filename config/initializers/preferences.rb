class Preferences
  preferences_file = File.read(File.expand_path('../../preferences.yml', __FILE__))
  data = HashWithIndifferentAccess.new(YAML.load(preferences_file))
  @@preferences = data[Rails.env]

  def self.email_limit_to_domain
    return @@preferences['email_limit_to_domain']
  end
end