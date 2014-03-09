class YixinRead
  include Mongoid::Document
  field :username, type: String
  field :joke_ids, type: Array, default: []

  validates :username, presence: true, uniqueness: true

  def self.read(username, ids)
    user = get_user(username)
    user.joke_ids += ids
    user.joke_ids.uniq!
    user.save if user.changed?
  end

  def self.get_user(username)
    where(username: username).first_or_create
  end
end
