class FlinkTag < Liquid::Tag
	def initialize(tag_name, markup, tokens)
		super
		if markup =~ /(https?:\/\/([^\/\s]+)\/?\S*)\s+[\"\']?(.+?)[\"\']?\s*$/i
			@valid = true
			@url = $1
			@site = $2
			@title = $3
		else
			@valid = false
			puts "[FlinkTag] Unable to parse the following line:"
			puts "[FlinkTag]  > " + markup
			puts "[FlinkTag] Use the following format:"
			puts "[FlinkTag]  > {% flink http://github.com/IQAndreas/flink \"Fork Flink on GitHub\" %}"
		end
	end
	
	def render(context)
		@valid ? "<li class=\"flink #{@site}\"><a href=\"#{@url}\">#{@title}</a></li>" : ""
	end
end

Liquid::Template.register_tag('flink', FlinkTag)
