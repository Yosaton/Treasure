class Listing < ApplicationRecord
    belongs_to :user
    include PgSearch
    pg_search_scope :omniscope, :against => [:title, :city]
    mount_uploaders :images, ImagesUploader
    validates :title, :price, :city, :place, presence: true
    validate :description_length

private

    def description_length
        if self.description.length < 5
            errors.add(:description, "Requires 5 characters for a description")
        end
    end

end

