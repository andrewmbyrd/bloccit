[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mindex 1c07694..c2cdb17 100644[m
[1m--- a/app/controllers/application_controller.rb[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -1,3 +1,4 @@[m
 class ApplicationController < ActionController::Base[m
   protect_from_forgery with: :exception[m
[32m+[m
 end[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 6c2b132..d1c3bf9 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -5,6 +5,8 @@[m [mRails.application.routes.draw do[m
 [m
   resources :users, only: [:new, :create][m
 [m
[32m+[m[41m  [m
[32m+[m
   #we can refactor all of the GET methods for Post with the below[m
   #get 'post/index'[m
   #get 'post/show'[m
[1mdiff --git a/spec/controllers/users_controller_spec.rb b/spec/controllers/users_controller_spec.rb[m
[1mindex 51ec022..0d487af 100644[m
[1m--- a/spec/controllers/users_controller_spec.rb[m
[1m+++ b/spec/controllers/users_controller_spec.rb[m
[36m@@ -53,11 +53,13 @@[m [mRSpec.describe UsersController, type: :controller do[m
        expect(assigns(:user).password).to eq new_user_attributes[:password][m
      end[m
 [m
[31m- [m
[32m+[m
      it "sets user password_confirmation properly" do[m
        post :create, user: new_user_attributes[m
        expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation][m
      end[m
[32m+[m
[32m+[m[41m     [m
    end[m
 [m
 [m
