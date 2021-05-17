class User < ApplicationRecord
    def self.find_or_create_from_twitter_auth_hash(auth_hash)
        user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
        user.update(
          twitter_id: auth_hash.id,
          username: auth_hash.info.nickname,
          password: auth_hash.credentials.token,
        )
    end
end
