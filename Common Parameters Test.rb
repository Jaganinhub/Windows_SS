name 'Common Parameters Test'
rs_ca_ver 20161221
short_description 'Package of common parameters'
package 'common/parametersj'

parameter "param_resourcegroups" do
  label "AzureRM Resource Groups"
  type "string"
  default 'None'
  description "json:{\"definition\":\"get_resourcegroup\", \"description\": \"Select your Resource Group.  If None is selected, that means that a NEW resourcegroup will be created. \"}"
  operations "launch"
end

parameter 'paramBillingIndicatorTag' do
    label 'Billing Indicator'
    type 'string'
    category 'Tags'
    default 'TAZDEVVM001'
end

parameter "paramCompanyCodeTag" do
    label "Company Code"
    type "string"
    category "Tags"
    default "555"
end

parameter 'paramEnvironmentTypeTag' do
    label 'Environment Type'
    type 'string'
    category 'Tags'
    default 'DEV'
end
