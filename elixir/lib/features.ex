# BluefinDecryptxP2pe SDK feature factory

defmodule BluefinDecryptxP2pe.Features do
  def make_feature(name) do
    case name do
      "test" -> BluefinDecryptxP2pe.Feature.Test.new()
      _ -> BluefinDecryptxP2pe.Feature.new()
    end
  end
end
