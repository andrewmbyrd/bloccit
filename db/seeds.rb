require 'random_data'

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

Question.create!(title:"What color is sky?", body:"What color is it?", resolved: false)
Question.create!(title:"Why was I made?", body:"Who made me?", resolved:false)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Question.count} questions posed"
 puts "#{Comment.count} comments created"
