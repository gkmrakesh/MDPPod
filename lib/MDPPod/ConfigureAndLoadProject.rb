require_relative "ChangeFolderFileNames"
require_relative "Constants"
require "pry"

module ConfigureAndLoadProject

	@@output_project_name=Constants.class_variable_get(:@@output_project_name)

	def self.install_pods
		puts "Installing pods for project..."
		pod_install=`pod install --project-directory=#{@@output_project_name}/`
	end

	def self.open_workspace
		puts "Open workspace..."
		project_name=ChangeFolderFileNames.class_variable_get(:@@change_default_name_to)
		# binding.pry
		open_project=`open #{@@output_project_name}/#{project_name}.xcworkspace`
	end
	
end