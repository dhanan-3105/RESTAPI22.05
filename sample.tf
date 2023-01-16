provider "oci" {
 tenancy_ocid="a"
 user_ocid=""
 fingerprint=
 private_key_path=
 region="eu-frankfurt-1"
}


data "oci_identity_availability_domains" "test_availability_domains" {
    #Required
    compartment_id =""
}


output all_domains {
 value= "${data.oci_identity_availability_domains.test_availability_domains.availability_domains}"
}
