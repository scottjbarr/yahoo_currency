# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yahoo_currency}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Barr"]
  s.date = %q{2009-03-07}
  s.description = %q{Fetch currency exchange rates from Yahoo! Finance}
  s.email = %q{scottb@globalitcreations.com}
  s.extra_rdoc_files = ["lib/yahoo_currency/exchange_rate.rb", "lib/yahoo_currency/yahoo_currency.rb", "lib/yahoo_currency.rb", "README.rdoc"]
  s.files = ["config.yml", "init.rb", "lib/yahoo_currency/exchange_rate.rb", "lib/yahoo_currency/yahoo_currency.rb", "lib/yahoo_currency.rb", "Manifest", "Rakefile", "README.rdoc", "test/docs/FAKE-FAKE.csv", "test/docs/JPY-USD.csv", "test/docs/USD-CAD.csv", "test/integration/yahoo_currency_test.rb", "test/mocks/yahoo_currency_mock.rb", "test/test_helper.rb", "test/unit/yahoo_currency_test.rb", "yahoo_currency.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/scottbarr/yahoo_currency/tree/master}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Yahoo_currency", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{yahoo_currency}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Fetch currency exchange rates from Yahoo! Finance}
  s.test_files = ["test/integration/yahoo_currency_test.rb", "test/test_helper.rb", "test/unit/yahoo_currency_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
