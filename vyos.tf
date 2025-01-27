# This dynamically gets the Oracle Linux 8.4 images, the first result in the images 
# list (index 0) is the latest patched version.  Filter to specific display name 
# pattern to include the aarch64 images

data "oci_core_images" "vyos-130epa3-aarch64" {
  compartment_id = var.tenancy_ocid

  operating_system         = "VyOS"
  operating_system_version = "1.3.0-epa3"

  # include Aarch64 specific images
  filter {
    name   = "display_name"
     values = ["^.*-aarch64-.*$"]
    regex  = true
  }
}

output "vyos-aarch64-latest-name" {
  value = data.oci_core_images.vyos-130epa3-aarch64.images.0.display_name
}

output "vyos-aarch64-latest_ocid" {
  value = data.oci_core_images.vyos-130epa3-aarch64.images.0.id
}
