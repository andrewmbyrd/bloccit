class FavoriteMailer < ApplicationMailer
  default from: "andrewmbyrd@gmail.com"

  def new_comment(user, post, comment)

      @user = user
      @post = post
      @comment = comment


     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"



 # #19
     mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)

      @user = user
      @post = post

     headers["Post-ID"] = "<post/#{post.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<topic/#{post.topic.id}@your-app-name.example>"

     mail(to: user.email, subject: "New post created: #{post.title}")
  end
end
