module TikkokHelper
  def mailencToUtf8(str)
    str.encode("utf-8", "iso-2022-jp")
  end
end
