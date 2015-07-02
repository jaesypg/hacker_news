User.create(name: "abdullah", email: "abdullah@gmail.com", password: "1234")
User.create(name: "jc", email: "jc@gmail.com", password: "1234")

Post.create(title: "Trending at Instagram", url: "http://instagram-engineering.tumblr.com/post/122961624217/trending-at-instagram", user_id:1)
Post.create(title: "Who is hiring for ruby developer?", text: "Please lead with the location of the position and include the keywords REMOTE, INTERNS and/or VISA when the corresponding sort of candidate is welcome. When remote work is not an option, please include ONSITE.", user_id:2)

Comment.create(comment: "Comment 1 for Post 1", post_id:1, user_id:2)
Comment.create(comment: "Comment 1 for Post 2", post_id:2, user_id:1)

