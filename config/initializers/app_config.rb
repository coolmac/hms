APP_CONFIG = YAML.load_file(Rails.root.join('config', 'config.yml')).with_indifferent_access[Rails.env]
