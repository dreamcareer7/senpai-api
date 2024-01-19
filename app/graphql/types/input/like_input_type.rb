module Types
    module Input
      class LikeInputType < Types::BaseInputObject
        argument :user_id, Integer, required: true
        argument :like_type, String, required: true
        argument :likee_id, Integer, required: true
      end
    end
end