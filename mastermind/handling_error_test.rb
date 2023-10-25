class MyError < StandardError
  def initialize(msg = 'A custom error ocurred')
    super
  end
end

class IndexError
  def error_detected(message)
    raise IndexError, "¡An error ocurred! #{message}"
  end
end
# The IndexError class is used to handle errors related to indexing, often encountered with arrays or data structures.
