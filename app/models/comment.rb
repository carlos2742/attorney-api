class Comment < ApplicationRecord

  has_many :comments,->{ where(:reference_type=>'comment')}, :foreign_key => :reference_id

  enum status: [ :pending, :published, :rejected ]
  enum reference_type: [ :article, :comment ]

  self.per_page = 3

  def create_comment (params)
    create_comment_template(params) do |comment|
      comment.reference_type = Comment.reference_types[:comment]
    end
  end

end
