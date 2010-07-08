class Slide < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :url

  has_attached_file :img,
                    :styles => {
                       :thumb => "100x100#"
                    },
                    :url => "/assets/slides/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/assets/slides/:id/:style_:basename.:extension"

  named_scope :included, :conditions => ["enabled = ? and included = ?", true, true]
  named_scope :not_included, :conditions => ["enabled = ? and included = ?", true, false]
  named_scope :order_by_pos, :order => "position"
  named_scope :localized, lambda { |locale| { :conditions => [ "locale = ? OR locale = ?", "", locale ] } }
  named_scope :in_group, lambda { |group| { :conditions => [ "groups LIKE ? OR groups IS NULL OR groups = ?", "%#{group}%", "" ] } }

end
