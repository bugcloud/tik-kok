module TikkokHelper
  def mailencToUtf8(str, encoding)
    str.encode("utf-8", encoding)
  end
end
