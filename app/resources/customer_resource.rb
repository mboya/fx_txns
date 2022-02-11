class CustomerResource < JSONAPI::Resource
  attributes :firstname, :lastname, :fullname

  def fullname
    "#{@model.firstname}, #{@model.lastname}"
  end
end
