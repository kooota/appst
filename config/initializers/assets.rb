# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( icomoon_style.css )

Rails.application.config.assets.precompile += %w( categories.css.scss )

Rails.application.config.assets.precompile += %w( comments.css.scss )

Rails.application.config.assets.precompile += %w( likes.css.scss )

Rails.application.config.assets.precompile += %w( posts.css.scss )

Rails.application.config.assets.precompile += %w( responsive.css.scss )

Rails.application.config.assets.precompile += %w( users.css.scss )

Rails.application.config.assets.precompile += %w( comments.css.scss )

Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")i
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
