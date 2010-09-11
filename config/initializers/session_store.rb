# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_capistrano_session',
  :secret      => '6e6616922cc55b51ff4fed0ce223c9ac89798ad47d2789482ea5f1ff1a425bef5a58608bde46588d165440ab0045750de220527c30ef56d451ea55ee0bcd0392'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
