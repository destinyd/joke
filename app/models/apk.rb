class Apk
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :version, type: String, default: '1.01'
  field :update_info, type: String, default: ''
  mount_uploader :apk, ApkUploader

  validates :apk, presence: true

  scope :recent, desc(:created_at)
  scope :download, desc(:order).desc(:created_at)

  def updated_version
    Apk.new name: self.name, english_name: self.english_name, version: (self.version.to_f + 0.01).to_s, update_info: self.update_info, order: self.order
  end
end
