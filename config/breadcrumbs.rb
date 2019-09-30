# ルートページ
crumb :root do
  link "メルカリ", root_path
end
# マイページ
crumb :mypage do
  link 'マイページ', user_path(current_user.id)
  parent :root
end
# マイページ-プロフィール
crumb :profile do
  link 'プロフィール'
  parent :mypage
end
# マイページ-本人情報
crumb :identification do
  link '本人情報'
  parent :mypage
end
# マイページ-クレジット
crumb :credit do
  link '支払い方法', credit_items_path
  parent :mypage
end
# マイページ-ログアウト
crumb :logout do
  link 'ログアウト'
  parent :mypage
end


crumb :ship do
  link '出品した商品 - 出品中', mypage_ship_users_path
  parent :mypage
end

crumb :ship_item do
  link '出品商品画面'
  parent :ship
end

crumb :sold do
  link '出品した商品 - 売却済み'
  parent :mypage
end



# マイページ-クレジットカード情報入力
crumb :payments_new do
  link 'クレジットカード情報入力', new_payment_path
  parent :credit
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).