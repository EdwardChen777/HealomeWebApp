# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( all.css )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( jk-menus.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( owl.carousel.css )
Rails.application.config.assets.precompile += %w( slick.css )
Rails.application.config.assets.precompile += %w( flaticon.css )
Rails.application.config.assets.precompile += %w( magnific-popup.css )
Rails.application.config.assets.precompile += %w( pi-animations.css )
Rails.application.config.assets.precompile += %w( aos.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( pi-spacing.css )
Rails.application.config.assets.precompile += %w( responsive.css )

#for faq
Rails.application.config.assets.precompile += %w( theme.css )
Rails.application.config.assets.precompile += %w( faq/theme.js )
Rails.application.config.assets.precompile += %w( faq/bootstrap.min.js )

Rails.application.config.assets.precompile += %w( all/jquery.min.js )
Rails.application.config.assets.precompile += %w( all/modernizr-2.8.3.min.js )
Rails.application.config.assets.precompile += %w( all/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( all/owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( all/slick.min.js )
Rails.application.config.assets.precompile += %w( all/jquery.paroller.js )
Rails.application.config.assets.precompile += %w( all/jquery.magnific-popup.min.js )
Rails.application.config.assets.precompile += %w( all/aos.js )
Rails.application.config.assets.precompile += %w( all/wow.min.js )
Rails.application.config.assets.precompile += %w( all/parallax.min.js )
Rails.application.config.assets.precompile += %w( all/jk-menus.js )
Rails.application.config.assets.precompile += %w( all/plugins.js )
Rails.application.config.assets.precompile += %w( all/main.js )


#For appland testing
# Rails.application.config.assets.precompile += %w( appland/animate.css )
# Rails.application.config.assets.precompile += %w( appland/bootstrap.min.css )
# Rails.application.config.assets.precompile += %w( appland/default.css )
# Rails.application.config.assets.precompile += %w( appland/lineicons.css )
# Rails.application.config.assets.precompile += %w( appland/magnific-popup.css )
# Rails.application.config.assets.precompile += %w( appland/slick.css )
# Rails.application.config.assets.precompile += %w( appland/style.css )
# Rails.application.config.assets.precompile += %w( appland/swiper.min.css )

# Rails.application.config.assets.precompile += %w( appland/jquery-1.12.4.min.js )
# Rails.application.config.assets.precompile += %w( appland/modernizr-3.7.1.min.js )
# Rails.application.config.assets.precompile += %w( appland/popper.min.js )
# Rails.application.config.assets.precompile += %w( appland/bootstrap.min.js )
# Rails.application.config.assets.precompile += %w( appland/slick.min.js )
# Rails.application.config.assets.precompile += %w( appland/jquery.magnific-popup.min.js )
# Rails.application.config.assets.precompile += %w( appland/wow.min.js )
# Rails.application.config.assets.precompile += %w( appland/swiper.min.js )
# Rails.application.config.assets.precompile += %w( appland/jquery.easing.min.js )
# Rails.application.config.assets.precompile += %w( appland/scrolling-nav.js )
# Rails.application.config.assets.precompile += %w( appland/main.js )