# BluefinDecryptxP2pe SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module BluefinDecryptxP2peFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinDecryptxP2peBaseFeature.new
    when "test"
      BluefinDecryptxP2peTestFeature.new
    else
      BluefinDecryptxP2peBaseFeature.new
    end
  end
end
