class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay(Time.now)
    if params[:format] == "json"
      @tikkoks.each {|t|
        t.body = t.body.encode("utf-8", t.encoding)
      }
      render :json => @tikkoks.to_json, :callback => params[:callback]
    end
  end

  def create
    message = Mail.new(params[:message])

    body = ""
    encoding = ""
    has_plain_text = false;
    has_html_text = false;

    message.body.to_s.split("\n").each {|m|

      if m =~ /charset=.*/
        encoding = $&.gsub("charset=","")
      end
      unless m.index("text/plain") == nil
        has_plain_text = true
      end
      unless m.index("text/html") == nil
        has_html_text = true
      end
      #debug
      puts m

      if m.index("Content-Type") == nil
        if m.index("Content-Transfer-Encoding") == nil
          if m.index(/\-\-[0-9a-z]*/) == nil
            body += m unless has_plain_text && has_html_text
          end
        end
      end
    }
    unless body.encoding.to_s == "UTF-8"
      body = body.encode("UTF-8")
      encoding = encoding.encode("UTF-8")
    end

    begin
      tikkok = Tikkok.new(:title => message.subject,
                          #:from => message.from,
                          :body => body,
                          :encoding => encoding,
                          :created_at => Time.now.strftime("%Y-%m-%d %H:%M"))
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
