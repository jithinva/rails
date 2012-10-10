# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cutrack_session',
  :secret      => 'f5e58619a84f2e4c617233540a2bd7037337b34fb01a2f0cb8cc6645fe41714bf23ca849f245b6ce9167d3c7bc559150c1ed95cf7bd43e3b53453a47327bca31'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
