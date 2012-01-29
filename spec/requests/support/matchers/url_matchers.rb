module Educon
  module UrlMatchers
    RSpec::Matchers.define :be_equal_ignore_params do |expected|
      match do |actual|
        extracted = extract_url_without_params actual
        extracted.should == expected
      end

      failure_message_for_should do |actual|
        "#{actual} should be equal to #{expected} , if the http params are ignored"
      end

      failure_message_for_should_not do |actual|
        "#{actual} should not be equal to #{expected} , if the http params are ignored"
      end

      description do
        "be equal to #{expected} , if the http params are ignored"
      end

      def extract_url_without_params(url)
        url.scan(/(.*)\?.*/).first.first
      end
    end
  end
end