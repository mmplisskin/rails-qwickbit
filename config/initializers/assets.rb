# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'


# %w( businesses_controller categories_controller static_pages_controller ).each do |controller|
#   Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.css"]
# end

Rails.application.config.assets.precompile += %w(items.coffee static_pages.js businesses.js items.js categories.js sessions.js wallets.js)
# Rails.application.config.assets.precompile += %w( businesses.js )
# Rails.application.config.assets.precompile += %w( items.js )
#
# Rails.application.config.assets.precompile += %w( categories.js )
# Rails.application.config.assets.precompile += %w( map.js qrcode.js)

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
