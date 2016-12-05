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

 Advertisement.create!(title:"The Fender Bender", body: "Use this to dent the heck out of all your friends' cars! Sounds like fun huh?", price:3000)
 Advertisement.create!(title:"Cards for mom", body:"You never know what to get your mom for her b-day do you? Well now, we'll generate some generic, non-personal card for her!", price: 500)

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Advertisement.count} Ads created"
 puts "#{Comment.count} comments created"
