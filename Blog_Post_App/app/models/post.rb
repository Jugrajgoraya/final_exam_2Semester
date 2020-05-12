class Post < ApplicationRecord

    belongs_to :user

    validates(:author,
        presence: true,
        uniqueness: true,
        length: { minimum: 3 }
      )
    validates(
        :body,
        presence: { message: "must exist" },
        length: { minimum: 20 }
    )

end
