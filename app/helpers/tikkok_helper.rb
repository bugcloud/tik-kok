module TikkokHelper
  def mailencToUtf8(str, encoding)
    if encoding.empty?
      # sorry for only japanese..
      return str.encode("utf-8", "ISO-2022-JP")
    end
    if encoding.index(/UTF\-8/i) == nil
      str.encode("utf-8", encoding)
    else
      str
    end
  end
end
