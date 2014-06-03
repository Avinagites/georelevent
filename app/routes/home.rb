module Georelevent
  module Routes
    class Home < Base
      get '/' do
        @publishers = Publisher.all
        erb :index
      end
    end
  end
end
