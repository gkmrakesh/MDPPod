require "pry"
require_relative "MDPPod/ChangeSampleProject"
require "fileutils"
require_relative "MDPPod/ChangeFolderFileNames"
require_relative "MDPPod/Constants"
require_relative "MDPPod/ConfigureAndLoadProject"

module MDPPod

  include ChangeSampleProject

  @@sample_project_name=Constants.class_variable_get(:@@sample_project_name)
  @@output_project_name=Constants.class_variable_get(:@@output_project_name)
  def self.start_process_project
  	remove_output_directory
  	move_to_output_folder
  	ChangeFolderFileNames.ask_project_name

    ##
    # HAS TO CALL TWO TIMES, FIRST TIME FOLDER STRUCTURE AND SECOND 
    # TIME FILE NAMES WOULD BE CHANGING BY SAME FUNCTION
  	ChangeFolderFileNames.rename_folder_files
    ChangeFolderFileNames.rename_folder_files

    fileChanger=FileChange.new
    fileChanger.rename_file_content_as_per_details

    ConfigureAndLoadProject.install_pods
    ConfigureAndLoadProject.open_workspace
  end

  def self.remove_output_directory
  	puts "Deleting existing project if any..."
  	if Dir.exist?(@@output_project_name) 
  		FileUtils.rm_r @@output_project_name
  	end
  end 

  def self.move_to_output_folder 
  	FileUtils.copy_entry @@sample_project_name, @@output_project_name
  end

  start_process_project

end
