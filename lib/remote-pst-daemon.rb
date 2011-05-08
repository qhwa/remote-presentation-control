require 'remote-pst-prnt'

module RmtPst

    class Daemon

        def initialize
            @status = 'stop'
        end

        def start
            @srv_t = Thread.new(1234) do |port|
                s = TCPServer.open(port)
                while true
                    client = s.accept
                    client.puts "Welcome to Remote Presentation Server!"
                    client.close
                end
                s
            end
            sleep 0.1
            @status = 'running'
        end

        def stop
            if self.running?
                @srv_t.exit
                @srv_t = nil
                @status = 'stop'
            end
        end

        def restart
            stop if self.running?
            start
        end

        def running?
            ! @srv_t.nil?
        end

        def status
            @status
        end


        private
        def start_socket_srv
        end

        def stop_socket_srv
            
        end
    end

end


