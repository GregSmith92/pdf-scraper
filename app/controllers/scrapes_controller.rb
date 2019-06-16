require 'open-uri'
class ScrapesController < ApplicationController

  def new
    @scrape = Scrape.new
  end

  def create
    @scrape = Scrape.new(scrape_params)
    if @scrape.save
      # io     = open("#{@scrape.url}")
      io = open(@scrape.url)
      reader = PDF::Reader.new(io)
      puts reader.info
  end

  def show

  end

  def destroy
  end


  private

  def scrape_params
    params.require(:scrape).permit(:url)
  end
end
