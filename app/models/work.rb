class Work < ActiveRecord::Base

    S3_URL = 'https://s3.ap-northeast-1.amazonaws.com/twi-kaki/'

    def getImageUrlJpg
        # img_nameに".jpg"がある場合は、そのまま返す
        if self.img_name.include?('.jpg')
            return S3_URL + self.img_name
        else
            return S3_URL + self.img_name + '.jpg'
        end
    end

    def getImageUrlPng
        # img_nameに".jpg"がある場合は、pngファイルは存在しないためjpgを返す
        if self.img_name.include?('.jpg')
            return S3_URL + self.img_name
        else
            return S3_URL + self.img_name + '.png'
        end
    end
    
    def getPostUrl
        return '/w/' + self.id.to_s
    end

    def getCreatedAt
        return self.created_at.in_time_zone('Tokyo').strftime("%Y-%m-%d %H:%M")
    end
end
