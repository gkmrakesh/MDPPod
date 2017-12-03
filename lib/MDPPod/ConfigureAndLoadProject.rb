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

	def self.run_workspace
		puts "Running project..."
		project_name=ChangeFolderFileNames.class_variable_get(:@@change_default_name_to)
		build_project=`xcodebuild -workspace '#{@@output_project_name}/#{project_name}.xcworkspace' -scheme #{project_name}Example -sdk iphonesimulator11.0 -configuration Debug -derivedDataPath build`
		# run_project=`ios-sim launch --devicetypeid 'iPhone-6, 11.0' build/Build/Products/Debug-iphonesimulator/#{project_name}.app`
	end
end