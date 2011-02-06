class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay
  end

  def create
    message = Mail.new(params[:message])
    begin
      Tikkok.create(:title => message.subject.toutf8,
                    :body => message.body.to_s.toutf8)
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
