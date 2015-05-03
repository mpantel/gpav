Gem::Specification.new do |s|
  s.name        = 'gpav'
  s.version     = '0.0.1'
  s.date        = '2015-05-03'
  s.summary     = "Greek Publc Administration Validators"
  s.description = "Validators for AFM, Cheque numbers, AMKA and IBAN"
  s.authors     = ["Michail Pantelelis"]
  s.email       = 'mpantel@aegean.gr'
  s.files       = ["lib/gpav.rb", "lib/validators/afm.rb", "lib/validators/amka.rb", "lib/validators/cheque.rb","lib/validators/iban.rb"]
  s.homepage    ='https://github.com/mpantel/gpav'
  s.license       = 'MIT'
end