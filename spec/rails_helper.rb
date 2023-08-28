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