class ManufacturerPicture < ActiveRecord::Base
  has_attached_file :picture,
  url: '/media/uploads/manufacturer_pictures/:id/:attachment/:style/:filename',
  path: ":rails_root/public/media/uploads/manufacturer_pictures/:id/:attachment/:style/:filename",
  styles: {
    preview50x50: "50x50",
    preview80x80: "80x80",
    preview100x100: "100x100",
    preview200x200: "200x200",
    preview300x300: "300x300",
    preview600x600: "600x600"
  },
  default_url: '/assets/landing_template_missing/missing_:style.png'

  def to_builder
    Jbuilder.new do |json|
      json.id id
      json.preview50x50 picture.url(:preview50x50, timestamp: false)
      json.preview80x80 picture.url(:preview80x80, timestamp: false)
      json.preview100x100 picture.url(:preview100x100, timestamp: false)
      json.preview200x200 picture.url(:preview200x200, timestamp: false)
      json.preview300x300 picture.url(:preview300x300, timestamp: false)
    end
  end

  def self.permitted_attributes
    [:manufacturer_id, :picture]
  end
end
