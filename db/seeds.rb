# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

third_user = User.create(name: 'LLoyd', photo: 'https://itsastampede615821596.files.wordpress.com/2020/12/how-many-dumb-and-dumber-movies-are-there.jpg', bio: 'Actor from dumb and dumber')

fourth_user = User.create(name: 'Dumbledore', photo: 'https://www.looper.com/img/gallery/the-best-dumbledore-moments-from-the-harry-potter-movies-ranked/l-intro-1639601334.jpg', bio: 'Principal of Hogwarts')

dumbledore_post = Post.create(author: third_user, title: 'Harry', text: 'We must defeat he who shall not be made')
lloyd_post = Post.create(author: fourth_user, title: 'Swanson', text: 'We need to find her')

Comment.create(post: dumbledore_post, author: third_user, text: 'Who is that' )