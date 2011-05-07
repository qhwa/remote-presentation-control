require 'remote-pst-prnt'

module RmtPst

    class Daemon

        def initialize
            @status = 'stop'
        end

        def start
            @status = 'running'
        end

        def stop
            @status = 'stop'
        end

        def running?
            self.status == 'running'
        end

        def status
            @status
        end

    end

end


