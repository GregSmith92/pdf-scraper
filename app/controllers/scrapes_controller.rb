require 'open-uri'
class ScrapesController < ApplicationController

  def new
    @scrape = Scrape.new
  end

  def create
    @scrape = Scrape.new(scrape_params)
    if @scrape.save
      redirect_to scrape_path(@scrape)
    else
      render "new"
    end
  end

  def show
    @scrape = Scrape.find(params[:id])
    require 'pdf/reader'
    reader = PDF::Reader.new('@scrape.pdf')

    reader.pages.each do |page|
    pattern = /[\n\r].*Cha-Cha\s*([^\n\r]*)/
    match_data = page.text.match(pattern)
    puts match_data

  end

  def destroy
  end


  private

  def scrape_params
    params.require(:scrape).permit(:url)
  end
end
