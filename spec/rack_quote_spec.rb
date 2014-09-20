require 'spec_helper'

describe Rack::Quote do
  describe '#call' do
    let(:app) {double('Rack::Middleware', call: true)}
    let(:response) {Rack::Quote.new(app)}

    describe 'when receiving a request with, /quote, in the url' do
      let(:gervais_quotes) {IO.readlines('fixtures/rickygervais.txt')}
      let(:env) {{'PATH_INFO' => '/quote'}}

      it 'returns a random quote in the body of the response' do
        expect(gervais_quotes.include?(response.call(env).last.pop)).to eq(true)
      end

      it 'returns a status code of 200' do
        expect(response.call(env).first).to eq(200)
      end

      it 'returns headers with, content-type text/plain' do
        expect(response.call(env)[1]).to eq({'Content-Type' => 'text/plain'})
      end

    end

    describe 'when receiving, /QUOTE, in the request' do
      let(:gervais_quotes) {['this is a gervais quote']}
      let(:env) {{'PATH_INFO' => '/QUOTE'}}

      it '/QUOTE, does not return a random quote in the body of the response' do
        expect(response.call(env)).to_not match_array([200, {'PATH_INFO' => '/quote'}, ['this is a gervais quote']])
      end
    end

    describe 'when not receiving a request with, /quote, in the url' do
      let(:env) {{'PATH_INFO' => '/'}}
      it 'forwards the call onto the next middleware' do
        expect(response.call(env)).to eq(app.call(env))
      end
    end
  end
end
