class Settings
  extend Chamber

  source Rails.root.join('config', 'settings.yml'), namespace: Rails.env, override_from_environment: true
  source Rails.root.join('config', "credentials-#{Rails.env}.yml")

  load!
end
