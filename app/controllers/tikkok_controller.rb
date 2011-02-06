class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay
    render :index
  end

  def create
    message = Mail.new(params[:message])
    puts message.body.methods
    begin
      tikkok = Tikkok.new(:title => message.subject,
                          :body => message.body.to_s)
      if tikkok.save
        puts 'saved'
        render :text => "ok"
      else
        puts 'fail to save'
        render :text => "fail to save"
      end
    rescue => e
      puts "some error has occurred"
      puts e
      render :text => "some error has occurred"
    end
  end

end
