class User < ActiveRecord::Base
    #引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
    def self.find_or_create_from_auth_hash(auth_hash)
        #OmniAuthで取得した各データを代入していく
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        nickname = auth_hash[:info][:nickname]
        image_url = auth_hash[:info][:image]
        secret = auth_hash[:credentials][:secret]
        token = auth_hash[:credentials][:token]
    
        user = User.find_or_create_by(provider: provider, uid: uid) do |user|
            user.nickname = nickname
            user.image_url = image_url
            user.secret = secret
            user.token = token
        end
        user.nickname = nickname
        user.image_url = image_url
        user.secret = secret
        user.token = token
        user.save
        return user
    end

    def getUserIcon
        return image_url.gsub(/http:/, 'https:')
    end
end
