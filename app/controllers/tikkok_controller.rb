class TikkokController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def index
    @tikkoks = Tikkok.findForDay
    render :index
  end

  def create
    message = Mail.new(params[:message])

    begin
      tikkok = Tikkok.new(:title => message.subject,
                          :body => trim_mail_data(message.body.to_s.gsub(/\n/," ")))
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

  private
  def trim_mail_data(str)
    puts "str: #{str}"
    s = str.index(" ", str.index(/charset=.* /))
    e = str.index("--", str.index(/Content\-Transfer\-Encoding.*\n/))
    if e.nil? e = str.index("--", str.index(/charset=.* /))
    (s !=nil and e != nil)? str[s..e] : str
  end

end
