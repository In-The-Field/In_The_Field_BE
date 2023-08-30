# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  # exit 1
end
RSpec.configure do |config|
  # config.include Capybara::DSL
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('tmdb_key') { ENV['tmdb_key'] }
  config.configure_rspec_metadata!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def base_64_image
  @image = "data:image/jpeg;base64,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"
end