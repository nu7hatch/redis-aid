class Redis
  module Aid

    module Version
      MAJOR  = 0
      MINOR  = 1
      PATCH  = 0
      STRING = [MAJOR, MINOR, PATCH].join('.')
    end # Version

    def self.version
      Version::STRING
    end

  end # Aid
end # Redis
