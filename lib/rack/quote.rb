module Rack
  class Quote
    HEADERS = {'Content-Type' => 'text/plain'}
    STATUS_CODE = 200

    def initialize(app)
      @app = app
      @request = ['/quote']
      @response = [IO.readlines('fixtures/rickygervais.txt').sample]
      @headers = HEADERS
      @status_code = STATUS_CODE
    end

    def call(env)
      if @request.include?(env['PATH_INFO'])
        [@status_code, @headers, @response]
      else
        @app.call(env)
      end
    end
  end
end
