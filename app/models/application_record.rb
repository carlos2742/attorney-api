class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

      def create_comment_template (params)
        comment = Comment.new
        comment.name = params[:name]
        comment.content = params[:content]
        comment.email = params[:email]
        comment.status = Comment.statuses[:pending]
        yield(comment)
        comments << comment
      end
end
