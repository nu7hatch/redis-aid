class Redis
  module Aid

    module Version
      MAJOR  = 0
      MINOR  = 0
      PATCH  = 3
      STRING = [MAJOR, MINOR, PATCH].join('.')
    end # Version

    def self.version
      Version::STRING
    end

  end # Aid
end # Redis
