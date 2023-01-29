crumb :root do
  link "Home", root_path
end

crumb :profile do
  link t('breadcrumbs.profile'), profile_path
  parent :root
end

crumb :profile_edit do
  link t('breadcrumbs.profile_edit'), edit_profile_path
  parent :profile
end

crumb :bookmark do
  link t('breadcrumbs.bookmark')
  parent :profile
end

crumb :books do
  link t('breadcrumbs.books'), books_path
  parent :root
end

crumb :book_search do
  link t('breadcrumbs.search'), search_books_path
  parent :books
end

crumb :book_new do
  link t('breadcrumbs.new'), new_book_path
  parent :book_search
end

crumb :book_show do |book|
  link "#{book.title}", book_path(book)
  parent :books
end

crumb :book_edit do
  link "投稿編集"
  parent :book_show
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