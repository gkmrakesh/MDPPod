require_relative "Constants"
require "fileutils"
require "pry"

module ChangeFolderFileNames
	
	@@change_default_name_to=""
	@@file_pattren=Constants.class_variable_get(:@@output_project_name)+"/**/*"
	def self.ask_project_name 
		wrong_name=""
		loop do
			puts "#{wrong_name}Enter project name?"
			@@change_default_name_to=gets.chomp

			if @@change_default_name_to.match(/^[a-zA-Z]+[0-9a-zA-Z]*$/i)
				break
			end
			wrong_name="Wrong project name! Re"
			# binding.pry
		end
		# @@change_default_name_to="xyz"
	end

	def self.rename_folder_files
		default_project_name=Constants.class_variable_get(:@@default_project_name)
		# puts "Changing names... #{@@change_default_name_to}"
		Dir.glob(@@file_pattren).each do |file_path|
  			rename_to_name=file_path.clone
  			rename_to_name.gsub! default_project_name, @@change_default_name_to
  			if File.exist?(file_path)
  				File.rename(file_path, rename_to_name)
  			end  
		end
	end

end

# ChangeFolderFileNames.ask_project_name
# ChangeFolderFileNames.rename_folder_files