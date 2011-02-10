module TikkokHelper
  def mailencToUtf8(str, encoding)
    if encoding.empty?
      return str
    end
    if encoding.index(/UTF\-8/i) == nil
      str.encode("utf-8", encoding)
    else
      str
    end
  end
end
