class InstasController < ApplicationController
    def index
        
    end

    def guest
        @user = User.find_by(email: "guess@instafriends.com")
        unless @user
            @user = User.create!(email: "guess@instafriends.com", password: "password", is_admin: false)
        end

        sign_in @user
        redirect_to root_path, notice: "Sign in successfully!"
    end

    def guest_admin
        @user = User.find_by(email: "admin_guess@instafriends.com")
        unless @user
            @user = User.create!(email: "admin_guess@instafriends.com", password: "password", is_admin: true)
        end

        sign_in @user
        redirect_to rails_admin_path
    end
    
end