name 'Common Declarations Test'
rs_ca_ver 20161221
short_description 'Package of common declarations'
package 'common/declarationsj'

resource 'ubuntu_server', type: 'server' do
    name 'ubselfserv001'
    cloud 'AzureRM East US 2'
    network 'pft_arm_network'
    subnets 'default'
    security_groups 'outbound'
    server_template find('ubuntu_base', revision: 0)
    inputs do {
      'COLLECTD_SERVER' => 'env:RS_TSS',
      'ENABLE_AUTO_UPGRADE' => 'text:true',
      'MANAGED_LOGIN' => 'text:auto',
      'MONITORING_METHOD' => 'text:auto',
      'NTP_SERVERS' => 'text:time.rightscale.com',
      'RIGHTLINK_DOCKER' => 'text:all',
      'RS_INSTANCE_UUID' => 'env:RS_INSTANCE_UUID',
      'SETUP_NTP' => 'text:if_missing',
      'UPGRADES_FILE_LOCATION' => 'text:https://rightlink.rightscale.com/rightlink/upgrades',
    } end
  end
