#/usr/bin/env ruby
require 'test/unit'
require '../remote-pst-ctrl'

class RemoteCtrolServerTest < Test::Unit::TestCase

    def setup
        @server = RmtCtrl::Server.new
        @server.page_count = 10
        @server.start
    end

    def test_create
        assert_equal 0, @server.page

        assert RmtCtrl::Server.create
        RmtCtrl::Server.create do |srv| 
            assert_equal 0, srv.page 
        end
    end

    def test_next_page
        assert_equal 1, @server.next
        assert_equal 1, @server.page
    end

    def test_prev_page_at_first
        assert_equal nil, @server.prev
        assert_equal 0, @server.page
    end

    def test_prev_page_at_middle
        @server.next
        assert_equal 0, @server.prev
        @server.page = 5
        assert_equal 4, @server.prev
    end

    def test_next_page_at_middle
        assert_equal 1, @server.next
        assert_equal 2, @server.next
    end

    def test_next_page_at_last
        @server.page = @server.page_count - 1
        assert_equal nil, @server.next
        assert_equal @server.page_count-1, @server.page
    end

    def test_rewind
        @server.next
        @server.rewind
        assert_equal 0, @server.page
    end

    def test_resume
        @server.next
        @server.stop
        assert_equal 1, @server.resume
    end
    


end
