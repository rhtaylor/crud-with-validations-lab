class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end
    def show 
        @song = Song.find(params[:id])
    end 
    def edit 
        @song = Song.find(params[:id])
    end 
    def update
        @song = Song.find(params[:id])  
        @song.update(safe_params(:title, :artist_name, :release_year, :released, :genre))
        if @song.valid? 
            @song.save 
            redirect_to song_path(@song)
        else 
            render :edit
        end
    end 

    def new 
        @song = Song.new
    end
    def create 
        
        @song = Song.new(safe_params(:title, :artist_name, :release_year, :released, :genre))
        if @song.valid? 
            @song.save
        redirect_to song_path(@song)
        else 
            render :new
        end
    end

    def destroy 
        @songs = Song.all
        @song = Song.find(params[:id])
        @song.destroy 
        redirect_to songs_path
    end

    private 

    def safe_params(*args)
    params.require(:song).permit(*args) 
    end
end
