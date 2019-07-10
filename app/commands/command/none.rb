class None < TextCommand
  def initialize(user_info, request_info)
    super
  end

  def call
    @message = reply_none
    @success = true
  end

  def reply_none
    <<~MES.chomp
      【案内】

      入力された内容では何もすることができません。
      操作に困ったら「ヘルプ」を入力してください。
    MES
  end
end