class Label
  attr_accessor :position, :name, :address1, :address2, :zipcode, :city, :state

  def initialize(position, name, address1, address2, zipcode, city, state)
    @position, @name, @address1, @address2, @zipcode, @city, @state = position, name, address1, address2, zipcode, city, state
  end

end
