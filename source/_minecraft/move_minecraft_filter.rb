
require_relative 'post_filters'
class MoveMinecraftFilter < Jekyll::PostFilter
	
	def post_write(page_or_post)
		#puts post.id + "  " + post.data['comment_count'].to_s
		#puts post.name
		
		if (page_or_post.id.start_with? '/minecraft')
			#puts "-----------------------------"
			mod = page_or_post
			name = File.basename(mod.name, '.*')
			title = mod.data['title']
			new_url = "http://minecraft.iqandreas.com/patches/minecraft-1.2.5/#{name}"
			target = "/home/andreas/temp/generated/minecraft/#{name}.html"
			
			data =  "---\n"
			data += "permalink: /minecraft/#{name}.html\n"
			data += "layout: redirect-minecraft\n"
			data += "redirect: '#{new_url}'\n"
			data += "redirect_message: 'This mod can now be found on my MineCraft site (redirecting there automatically): <li class=\"flink minecraft.iqandreas.com\"><a href=\"#{new_url}\">#{title}</a></li>'\n"
			data += "title: '#{title}'\n"
			data += "name: #{name}\n"
			data +=  "---\n"
			data +=  page_or_post.to_s()
			
			File.open(target, 'w') { |file| file.write(data) }
			puts "Generated #{target}"
		end
	end
end

class Jekyll::Page
	
	def id
		return data['id'] if self.data.key? 'id'
		slug(self.fixed_octopress_url)
	end
	
	def fixed_octopress_url
		# The preceeding "/" is because the `self.url` returned from category pages doesn't begin with a slash.
		File.join("/", @dir, self.url)
	end
	
	def slug(id)
		value = id.sub( /(\/)?(index)?\.html?$/ , "" )
		value = "/" + value if (value[0, 1] != "/")
		value
	end	
	
end

