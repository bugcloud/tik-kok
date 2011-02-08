module TikkokHelper
  def mailToText(str)
    s = str.index("\n", str.index("Content-Transfer-Encoding"))+1
    if s.nil?
      s = str.index(" ", str.index(/charset=.*\n/))
    end
    e = str.index("--", str.index(/charset=.*\n/))
    if s.nil? || e.nil?
      str
    else
      str[s..e]
    end
  end

  def mailencToUtf8(str)
    str.encode("utf-8", "iso-2022-jp")
  end
end
