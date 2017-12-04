require "pry"
require "date"
require_relative "Constants"

module ProjectConfigurationDetails
	@@default_name=Constants.class_variable_get(:@@default_name)
	@@default_email=Constants.class_variable_get(:@@default_email)
	def self.user_name
      (`git config user.name` || ENV['USER'] || @@default_name).chomp
    end

    def self.user_email
      (`git config user.email` || @@default_email).chomp
    end

    def self.current_year
      Time.now.year.to_s
    end

    def self.current_date_as_dmyyyy
      Time.now.strftime "%-d/%-m/%Y"
    end
end