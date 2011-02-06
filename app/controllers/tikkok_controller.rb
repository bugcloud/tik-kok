class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay
    render :index
  end

  def create
    message = Mail.new(params[:message])
    puts message.body.methods.to_s
    begin
      Tikkok.create(:title => message.subject,
                    :body => message.body.decoded)
      if Tikkok.save
        render :text => "ok"
      else
        render :text => "fail to save"
      end
    rescue
      render :text => "some error has occurred"
    end
  end

end
