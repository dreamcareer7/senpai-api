module Mutations
    class ValidatePhone < Mutations::BaseMutation
      argument :code, Integer
      argument :user_id, ID
  
      field :user, Types::UserType, null: false
      field :token, String, null: false
      field :profile_filled, Boolean, null: false

      def resolve(code:, user_id:)
        begin
          user = User.find(user_id)

          if user.valid_password?(code)
            token = JsonWebToken.encode(user_id: user.id)
            { user: user, token: token, profile_filled: user.profile_filled? }
          else
            GraphQL::ExecutionError.new("Invalid code")
          end
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}: #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end