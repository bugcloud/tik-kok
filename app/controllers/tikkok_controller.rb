class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay(Time.now)
    if params[:format] == "json"
      @tikkoks.each {|t|
        t.body = t.body.encode("utf-8", "iso-2022-jp")
      }
      render :json => @tikkoks.to_json, :callback => params[:callback]
    end
  end

  def create
    message = Mail.new(params[:message])

    body = ""
    message.body.to_s.split("\n").each {|m|
      if m.index("Content-Type") == nil
        if m.index("Content-Transfer-Encoding") == nil
          if m.index(/\-\-[0-9a-z]*/) == nil
            body += m
          end
        end
      end
    }
    unless body.encoding.to_s == "UTF-8"
      body = body.encode("UTF-8")
    end

    begin
      tikkok = Tikkok.new(:title => message.subject,
                          #:from => message.from,
                          :body => body)
      if tikkok.save
        render :text => "ok"
      else
        render :text => "fail to save"
      end
    rescue => e
      render :text => "some error has occurred"
    end
  end

  def truncate
    Tikkok.delete_all
    redirect_to '/'
  end
end
