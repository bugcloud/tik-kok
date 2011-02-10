module TikkokHelper
  def mailencToUtf8(str, encoding)
    unless encoding == "UTF-8" || encoding == "utf-8"
      str.encode("utf-8", encoding)
    else
      str
    end
  end
end
