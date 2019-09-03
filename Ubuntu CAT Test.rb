name 'Ubuntu CAT Test'
rs_ca_ver 20160622
short_description "![Logo](https://itcawsteam.s3-eu-west-1.amazonaws.com/ubuntu_orange_hex_su.jpg)\n"
import 'common/parametersj'
import 'common/definitionsj'
import 'common/declarationsj'

## PARAMETERS
parameter 'param_resourcegroups' do
   like $parametersj.param_resourcegroups
end

parameter "paramCompanyCodeTag" do
  like $parametersj.paramCompanyCodeTag
end

parameter 'paramBillingIndicatorTag' do
  like $parametersj.paramBillingIndicatorTag
end

parameter 'paramEnvironmentTypeTag' do
  like $parametersj.paramEnvironmentTypeTag
end

## RESOURCES
resource "server", type: "server" do
  like @declarationsj.ubuntu_server
end

## OPERATIONS
operation 'launch' do
  definition 'launch'
end

## DEFINITIONS
define launch(@server,$paramBillingIndicatorTag,$paramCompanyCodeTag,$paramEnvironmentTypeTag) return @server do
  $tags = [
    "azure:BillingIndicator=" + $paramBillingIndicatorTag,
    "azure:CompanyCode=" + $paramCompanyCodeTag,
    "azure:EnvironmentType=" + $paramEnvironmentTypeTag
  ]
  call definitionsj.launch(@server) retrieve @server
  call definitionsj.tag_resource(@server,$tags)
end

# Returns the resource_groups that are currently available.
define get_resourcegroup() return $values do
  $values = []
  # Note, that the cloud HREF is specific to AzureRM US East.  If you want another AzureRM region,
  # you will have to find it's href
  #$myresource_groups=rs_cm.resource_groups.index(filter: ["cloud_href==/api/clouds/3524"])
  $myresource_groups=rs_cm.resource_groups.index(filter: ["cloud_href==/api/clouds/3531"])
  $rg1 = []

  foreach $rg in $myresource_groups do
    if size($rg) > 0
      $rg1 = $rg
    end
  end

  foreach $resourcegroup in $rg1 do
    $values << $resourcegroup["name"]
  end
end
