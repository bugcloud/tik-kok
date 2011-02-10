module TikkokHelper
  def mailencToUtf8(str, encoding)
    str.encode("utf-8", encoding) unless encoding == "UTF-8" || encoding == "utf-8"
  end
end
