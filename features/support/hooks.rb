require_relative 'helper.rb'

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  scenario_name = scenario.name.delete(',', '')
  scenario_name = scenario.name.delete('(', '')
  scenario_name = scenario.name.delete(')', '')
  scenario_name = scenario.name.delete('{', '')
  scenario_name = scenario.name.delete('}', '')
  scenario_name = scenario.name.delete('#', '')

  if scenario.failed?
    tira_foto(scenario_name.downcase!, 'failed')
  else
    tira_foto(scenario_name.downcase!, 'passed')
  end
end
