class TodoSerializer < ActiveModel::Serializer
  attributes :id, :note, :complete

  def self.index(params)
    Task.all
  end
end
