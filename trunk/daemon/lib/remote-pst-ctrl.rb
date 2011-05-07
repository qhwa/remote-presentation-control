module RmtPst

    class Ctrl

        attr_reader :page, :page_count
        
        def initialize
            @page = 0
            @page_count = 0
        end

        def self.create( &b )
            srv = new
            b.call( srv ) if b
            srv
        end

        def start
            self.page = 0
        end

        def rewind
            start
        end

        def prev
            self.page -= 1 if @page > 0
        end

        def next
            self.page += 1 if @page < @page_count - 1
        end

        def stop
            page
        end

        def resume
            page
        end

        def page=( p )
            p = p.to_i
            unless p == @page
                @page = p.to_i 
            end
        end
    
        def page_count=( cnt )
            @page_count = cnt
        end

    end

end
