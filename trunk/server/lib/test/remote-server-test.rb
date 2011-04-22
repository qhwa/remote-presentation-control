#/usr/bin/env ruby
require 'test/unit'

class RemoteCtrolServerTest < Test::Unit::TestCase

    def setup
        @server = RmtCtrl::Server.new
    end

    def test_start
        @server.start
        assert_equal 0, @server.page
    end

    def test_next_page
        @server.start
        assert_equal 1, @server.next
        assert_equal 1, @server.page
    end

    def test_prev_page_at_first
        @server.start
        assert_equal nil, @server.prev
        assert_equal 0, @server.page
    end

end
