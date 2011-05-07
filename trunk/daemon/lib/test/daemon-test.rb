#/usr/bin/env ruby
require "#{File.dirname(File.expand_path(__FILE__))}/remote-pst-test.rb"
require 'socket'

class RmtPstDaemonTest < RmtPstTest
    
    def setup
        @daemon = RmtPst::Daemon.new
    end

    def test_start
        assert @daemon.start
        assert_equal true, @daemon.running?
        assert_equal 'running', @daemon.status
    end

    def test_stop
        assert_equal false, @daemon.running?
        assert_equal 'stop', @daemon.status
        self.test_start
        @daemon.stop
        assert_equal false, @daemon.running?
        assert_equal 'stop', @daemon.status
    end

    def test_connect_with_right_phrase
        test_start
        TCPSocket.open( 'localhost', 1234 ) do |s|
            assert s
        end
    end

    def test_connect_with_wrong_phrase
        test_start
    end

    def test_disconnect
        test_start
    end
end
