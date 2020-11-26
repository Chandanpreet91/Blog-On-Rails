# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.delete_all
Post.delete_all
User.delete_all

NUM_OF_POSTS = 100
NUM_USERS = 10
PASSWORD = 'supersecret'


super_user = User.create(
    first_name: 'Jon',
    last_name: 'Snow',
    email: 'js@winterfell.gov',
    password: PASSWORD
)

NUM_USERS.times do 
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        User.create(
            first_name: first_name,
            last_name: last_name,
            email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
            password: PASSWORD
        )
end

users = User.all 

NUM_OF_POSTS.times do 
    p = Post.create(
       title: Faker::Job.position,
       body: Faker::ChuckNorris.fact,
       user: users.sample
    )
    if p.valid?
        p.comments = rand(0..15).times.map do 
            Comment.new(
                body: Faker::GreekPhilosophers.quote,
                user: users.sample
                )
        end
    end
end

posts = Post.all 
comments = Comment.all 
puts Cowsay.say("Generated #{posts.count} posts", :stegosaurus)
puts Cowsay.say("Generated #{comments.count} comments", :tux)
puts Cowsay.say("Generated #{users.count} users", :frogs)

puts "Login with #{super_user.email} and password: #{PASSWORD}"