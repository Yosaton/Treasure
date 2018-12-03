class Listing < ApplicationRecord
    belongs_to :user
    include PgSearch
    pg_search_scope :omniscope, :against => [:title, :city]
    mount_uploaders :images, ImagesUploader
end
