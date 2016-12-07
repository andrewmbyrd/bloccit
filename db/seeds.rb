require 'random_data'
#create topics
15.times do
 Topic.create!(
   name:         RandomData.random_sentence,
   description:  RandomData.random_paragraph
 )
end
my_topic = Topic.create!(name: "Gaming", description: "Pay to win!")
topics = Topic.all
 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     topic: topics.sample,
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

#create sponsored_posts
SponsoredPost.create!(title: "EA Games", body:"money first! who cares about the customer!" , price:10000, topic: my_topic)
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{SponsoredPost.count} Sponsored Posts created"
