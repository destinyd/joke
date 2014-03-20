class JokeOffer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  include Mongoid::Enum

  field :title, type: String
  field :text, type: String
  enum :status, [:pending, :approved, :declined], default: :pending
  mount_uploader :image, ImageUploader
  taggable_on :tags
  belongs_to :user
  belongs_to :joke

  validates :title, presence: true, length: { minimum: 3 }
  validates :text, presence: true, uniqueness: true, length: { minimum: 15 }

  scope :recent, desc(:created_at)

  def is_image?
    !image.blank?
  end

  def human_status
    return case status
    when :pending
      '审核中'
    when :approved
      '已审核'
    when :declined
      '已悲剧'
    end
  end

  def human_title
    title + '(' + human_status + ')'
  end

  after_update :build_joke
  def build_joke
    if !self.joke and status == :approved
      self.joke = Joke.create(title: title, text: text, joke_id: id, imgurl: image_url, name: user.try(:name), tag_list: (tags || []).push('原创', '短篇').uniq.join(','))
      save
    end
  end
end
