name 'Common Definitions Test'
rs_ca_ver 20161221
short_description 'Package of common definitions'
package 'common/definitionsj'

define tag_resource(@server,$tags) return @server do
    rs_cm.tags.multi_add(resource_hrefs: @server.current_instance().href[], tags: [$tags])
end

define launch(@server) return @server do
    provision(@server)
end
