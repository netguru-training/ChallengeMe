$ -> 
	$(".user-email").on "click", (e)->
		e.preventDefault()
		debugger
		user = e.target.text
		gravatar = $(e.target).parent().find('img').attr(src: "http://www.gravatar.com/avatar/" + $.md5(user))
		
