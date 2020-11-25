# frozen_string_literal: true

# Ascending sequence member interface
module Member
  def value
    raise 'Not implemented!'
  end

  def next
    raise 'Not implemented!'
  end

  def ==(other)
    raise 'Not implemented!'
  end
end