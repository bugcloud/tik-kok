class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay

    #debug
    @tikkoks.each {|t|
      puts "#index ===> #{t.body}"
    }

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

    #debug
    puts body

    begin
      tikkok = Tikkok.new(:title => message.subject,
                          :body => body)
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

  def truncate
    Tikkok.delete_all
    redirect_to '/'
  end
end
