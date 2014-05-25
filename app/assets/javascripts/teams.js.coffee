$ -> 
	$(".user-email").on "click", (e)->
		e.preventDefault()
		user = e.target.text
		gravatar = $(e.target).parent().find('img').attr(src: "http://www.gravatar.com/avatar/" + $.md5(user))
		
