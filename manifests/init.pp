# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include foobar
class foobar (
  $service_name,
  $service_ensure,
) {
  service { $service_name:
    ensure => $service_ensure,
  }
}
