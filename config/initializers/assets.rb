# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( bootstrap/dist/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( font-awesome/css/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( Ionicons/css/ionicons.min.css )
Rails.application.config.assets.precompile += %w( css/AdminLTE.min.css )
Rails.application.config.assets.precompile += %w( css/skins/skin-blue.min.css )
Rails.application.config.assets.precompile += %w( jquery/dist/jquery.min.js )
Rails.application.config.assets.precompile += %w( bootstrap/dist/js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( js/adminlte.min.js )