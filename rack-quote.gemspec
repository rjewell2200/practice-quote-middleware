Gem::Specification.new do |gem|
  gem.authors       = ['Rob Jewell']
  gem.email         = ['jewell.robertp@gmail.com']
  gem.description   = %{Pass in, /quote, into the request and in the body
                      of the response a quote from Ricky Gervais will appear}
  gem.summary       = %{Enjoy a quote from Ricky Gervais}
  gem.name          = 'rack-quote'
  gem.date          = '2014-09-20'
  gem.homepage      = 'http://rubygems.org/gems/rack-quote'
  gem.license       = 'MIT'
                      
  gem.add_development_dependency("rspec")
  gem.add_development_dependency("pry")
end
