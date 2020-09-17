module MemosHelper

	def render_with_tags(body)
		body.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|| link_to word, "/memo/tag/#{hashname.delete('#')}"}.html_safe
	end
end
