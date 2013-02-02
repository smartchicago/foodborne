# Load the settings file, or grab them from ENV
settings_file = "#{Rails.root}/config/settings.yml"
SETTINGS = File.exist?(settings_file) ? YAML.load_file(settings_file) : ENV