class ApiKey < ApplicationRecord

    before_create :generate_access_token
    before_create :set_expiration
    belongs_to :member
  
    def expired?
      DateTime.now.utc >= self.expires_at
    end
  
    def expired
      self.expires_at = DateTime.now.utc
    end
  
    private
  
    def generate_access_token
      begin
        self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: access_token)
    end
  
    def set_expiration
      self.expires_at = DateTime.now.utc + 30.minutes
    end
end
