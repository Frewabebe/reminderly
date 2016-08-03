class Todo < ActiveRecord::Base
  def full_name
    [author_first_name, author_last_name].join " "
  end

end

# the methods created in models can be used as properties of the record
