# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Brazil2014::Application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || '68f5fdc039e0bbef219621791404dbd26bdc864a80a923385def0e9b10e45080bedd2e934e727258c5f640530735305ad8e0b7c8f0deac42a26fd038a00d70cb'
