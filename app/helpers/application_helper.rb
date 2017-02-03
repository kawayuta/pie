module ApplicationHelper

	def title(blog_title)
  content_for(:title) { blog_title }
end

end
