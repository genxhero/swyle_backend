module Mutations
    class CreateFunny < BaseMutation    
        argument :post_type, String, required: true
        argument :user_id, Integer, required: true
        argument :post_id, Integer, required: true
        type Types::FunnyType
        def resolve(user_id: nil, post_id: nil, post_type: nil)
            funny = Funny.new
            funny.user_id = user_id
            funny.post_id = post_id
            funny.post_type = post_type
            funny.save
            if post_type === "Article"
                article = Article.find(post_id.to_i)
                # SwyleSchema.subscriptions.trigger("articleLiked", {}, article)
            end
            if post_type === "ImagePost"
                image = ImagePost.find(post_id.to_i)
                # SwyleSchema.subscriptions.trigger("imageLiked", {}, image)
            end
            funny
        end
    end
  end