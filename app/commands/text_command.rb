require_relative './base_command.rb'

class TextCommand < BaseCommand
  def self.build(class_identifier)
    @command_folder_path = 'text_command/'
    super(class_identifier)
  end
end
