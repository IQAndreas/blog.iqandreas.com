class FlinkTag < Liquid::Tag
	def initialize(tag_name, markup, tokens)
		super
		if markup =~ /(https?:\/\/([^\/\s]+)\/?\S*)\s+[\"\']?(.+?)[\"\']?\s*$/i
			@valid = true
			@url = $1
			sites = $2
			@title = $3
			
			# Doin this the Ruby way, bitches.
			# Also, this is a dirty, disgusting hack
			# Example input: help.github.com
			# Example output: com github_com help_github_com
			site_progress = []
			site_result = []
			sites.split('.').reverse.each { |segment| 
				site_progress.unshift(segment)
				site_result.push(site_progress.join("_"))
			}
			@site_css = site_result.join(' ')
		else
			@valid = false
			puts "[FlinkTag] Unable to parse the following line:"
			puts "[FlinkTag]  > " + markup
			puts "[FlinkTag] Use the following format:"
			puts "[FlinkTag]  > {% flink http://github.com/IQAndreas/flink \"Fork Flink on GitHub\" %}"
		end
	end
	
	def render(context)
		@valid ? "<li class=\"flink #{@site_css}\"><a href=\"#{@url}\">#{@title}</a></li>" : ""
	end
end

Liquid::Template.register_tag('flink', FlinkTag)
