class Recommend < TextCommand
  def initialize(user_info, request_info)
    super
  end

  def call

    # title, ncode, synopsis
    admin_recommend_novels = Novel.find_admin_recommends(admin_recommend_list)
  end

  private

  # ncode の配列を引数にメッセージを作る
  def build_message_by_ncodes(ncodes)

  end

  def column_action(url)

  end

  # 作者おすすめのなろう小説一覧
  # ncode の配列
  # 最大5件まで
  def admin_recommend_list
    [
      'n2267be',
      'n9016cm',
      'n6161h',
      'n6169dz',
      'n1488bj',
    ]
  end
end