require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end
  
  def test_request
    get '/'
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_version_number
    refute_nil ::Rulers::VERSION
  end
end
