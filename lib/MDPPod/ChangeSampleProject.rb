require_relative "Constants"
require_relative "ChangeFolderFileNames"
require "pry"
require_relative "ProjectConfigurationDetails"

module ChangeSampleProject
	class FileChange
		
		def initialize
			@change_default_name_to=ChangeFolderFileNames.class_variable_get(:@@change_default_name_to)
			@output_project_name=Constants.class_variable_get(:@@output_project_name)
			@default_project_name=Constants.class_variable_get(:@@default_project_name)
			@swift_file_extension=Constants.class_variable_get(:@@swift_file_extension)
			@default_name_placeholder=Constants.class_variable_get(:@@default_name_placeholder)
			@default_date_placeholder=Constants.class_variable_get(:@@default_date_placeholder)
			@default_year_placeholder=Constants.class_variable_get(:@@default_year_placeholder)
		end

		def rename_file_content_as_per_details
			puts "From #{@default_project_name} - To #{@change_default_name_to}"
			Dir.glob("#{@output_project_name}/**/*").each do |file_path|
	  			change_file_content(file_path)
			end
		end

		private
		def change_file_content(file_path)
			if File.exist?(file_path) && File.file?(file_path)
  				update_details(file_path)
	  		end
		end

		def update_details(file_path)
			text = File.read(file_path)

			new_contents = replace_project_name(text)
			new_contents = replace_name(file_path, new_contents)
			new_contents = replace_date(file_path, new_contents)
			new_contents = replace_year(file_path, new_contents)

			# To write changes to the file, use:
			File.open(file_path, "w") {|file| file.puts new_contents }
		end

		def replace_project_name(contents)
			new_contents = contents.gsub(@default_project_name, @change_default_name_to)
		end

		def replace_name(file_path, new_contents)
			if file_path.include?(@swift_file_extension)
				new_contents = new_contents.gsub(@default_name_placeholder, ProjectConfigurationDetails.user_name)
			end
			new_contents
		end

		def replace_date(file_path, new_contents)
			if file_path.include?(@swift_file_extension)
				new_contents = new_contents.gsub(@default_date_placeholder, ProjectConfigurationDetails.current_date_as_dmyyyy)
			end
			new_contents
		end

		def replace_year(file_path, new_contents)
			if file_path.include?(@swift_file_extension)
				new_contents = new_contents.gsub(@default_year_placeholder, ProjectConfigurationDetails.current_year)
			end
			new_contents
		end
	end
end
