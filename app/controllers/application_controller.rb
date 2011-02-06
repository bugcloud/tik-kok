class ApplicationController < ActionController::Base
  protect_from_forgery

  if String.respond_to?(:trim_mail_data)
    class String
      def trim_mail_data
        s = self.index(" ", self.index(/charset=.* /))
        e = self.index(" --", self.index(/charset=.* /))
        self[s..e]
      end
    end
  end
end
