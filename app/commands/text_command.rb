require_relative './base_command.rb'

class TextCommand < BaseCommand
  def self.build(class_identifier)
    @command_folder_path = 'text_command/'
    super(class_identifier)
  end

  def initialize(request_info)
    super
    @user_send_text = @request_info.data.user_send_text
  end
end
