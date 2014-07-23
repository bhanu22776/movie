class MovieController < ApplicationController
  def index  	
    
    # unless params[:name].blank?
    #   	@i = Imdb::Search.new(params[:name])
    #   	logger.info "fewfeeeeeeeeeeeeeee#{@i.inspect}"
    # end


    unless params[:name].blank?
        @i = Tmdb::Movie.find(params[:name])
        logger.info "fewfeeeeeeeeeeeeeee#{@i.inspect}"
    end
  
    @popular = Tmdb::Movie.popular
    
  end


  def search
    
    @search = Tmdb::Search.new
    
    @resource = @search.resource(params[:resource]) # determines type of resource

    @query = @search.query(params[:search]) # the query to search against

    @sss = @search.fetch # makes request

    logger.info "fewfeeeeeeeeeeeeeee#{params[:resource]}"
    logger.info "fewfeeeeeeeeeeeeeee#{params[:search]}"
    logger.info "fewfeeeeeeeeeeeeeee#{@search.inspect}"
    logger.info "fewfeeeeeeeeeeeeeee#{@resource.inspect}"
    logger.info "fewfeeeeeeeeeeeeeee#{@query.inspect}"
    logger.info "fewfeeeeeeeeeeeeeee#{@sss.inspect}"
    
  end

  def upcoming
  	@upcoming = Tmdb::Movie.upcoming
  end

  def now_playing
  	@now_playing = Tmdb::Movie.now_playing
  end

  def popular
  	@popular = Tmdb::Movie.popular
  end

  def top_rated
  	@top_rated = Tmdb::Movie.top_rated
  end
end
