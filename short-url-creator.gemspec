Gem::Specification.new do |s|
  s.name = 'short-url-creator'
  s.version = '0.2.0'
  s.summary = 'short-url-creator'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/short-url-creator.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.add_dependency ('builder')
end
