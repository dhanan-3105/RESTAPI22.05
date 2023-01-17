# ---- use variables defined in terraform.tf vars or bash
# --profile file
variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}
#variable "AD" {}
variable "subnet_id" {}
#--- provider
provider "oci" {
region="${var.region}"
tenancy_ocid="${var.tenancy_ocid}"
user_ocid="${var.user_ocid}"
fingerprint="${var.fingerprint}"
private_key_path="${var.private_key_path}"
}


variable ssh-key-file {
default="sshpublickey.key"
}



data "oci_identity_availability_domains" "ads" {
  compartment_id = "${var.tenancy_ocid}"
}

resource "oci_core_instance" "oel_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "${var.compartment_ocid}"
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaai5knm2j3m4m5ahgcli7vagwaarvy6blh7ukn25lvhgat5o5fs7ea"
        source_type = "image"
    }

    # Optional
    display_name = "oel-dj-16"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "${var.subnet_id}"
    }
    metadata = {
        ssh_authorized_keys = file("${var.ssh-key-file}")
    }
    preserve_boot_volume = false
}

output "public-ip-for-compute-instance" {
  value= "${oci_core_instance.oel_instance.public_ip}"
}
