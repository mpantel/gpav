Gem::Specification.new do |s|
  s.name        = 'gpav'
  s.version     = '0.0.3'
  s.date        = '2015-05-03'
  s.summary     = "Greek Publc Administration Validators"
  s.description = "Validators for AFM, Cheque numbers, AMKA and IBAN"
  s.authors     = ["Michail Pantelelis"]
  s.required_ruby_version = '>= 2.1'
  s.email       = 'mpantel@aegean.gr'
  s.files       = Dir['lib/**/*.rb'] #+ Dir['bin/*']
  s.files      += Dir['[A-Z]*'] + Dir['test/**/*']
  s.homepage    ='https://github.com/mpantel/gpav'
  s.license       = 'MIT'
end
