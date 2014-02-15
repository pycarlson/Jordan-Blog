class Post < ActiveRecord::Base

belongs_to :user
has_and_belongs_to_many :categories
has_many :comments, :dependent => :destroy

validates_presence_of :body, :title


  def add_categories(params)
    params.each do |cat|
      self.categories << Category.find(cat.to_i)
    end
  end

end