require_relative "Constants"
require_relative "ChangeFolderFileNames"
require "pry"

module ChangeSampleProject
	class FileChange
		
		def initialize
			@change_default_name_to=ChangeFolderFileNames.class_variable_get(:@@change_default_name_to)
			@output_project_name=Constants.class_variable_get(:@@output_project_name)
		end

		def loop_through_files
			default_project_name=Constants.class_variable_get(:@@default_project_name)
			puts "From #{default_project_name} - To #{@change_default_name_to}"
			Dir.glob("#{@output_project_name}/**/*").each do |file_path|
	  			if File.exist?(file_path) && File.file?(file_path)
	  				text = File.read(file_path)
					new_contents = text.gsub(default_project_name, @change_default_name_to)

					# To write changes to the file, use:
					File.open(file_path, "w") {|file| file.puts new_contents }
	  			end  
			end
		end
	end
end
