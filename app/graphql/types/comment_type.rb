module Types
  class CommentType < Types::BaseObject
    graphql_name "Comment"
    field :id, Int, null: false
    field :commentor, UserType, null: false, method: :user
    field :body, String, null: false
    field :post_type, String, null: false
    field :post, PostUnion, null: false, method: :post
    field :created_at, String, null: false
  end
end
