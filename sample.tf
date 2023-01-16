provider "oci" {
 tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaasg7dmeaivai6jirpcbl23ms3z4aohftxghilvru5b2eceujefw6a"
 user_ocid="ocid1.user.oc1..aaaaaaaa6u3e5g6fw367d6zgve6wxpvwfnyyj47cx7vkyhzmq5eolnf3k2wq"
 fingerprint="7e:88:af:cf:71:f1:f4:2e:e3:58:6d:21:b5:16:63:e1"
 private_key_path="~/.oci/apiprivatekey.pem"
 region="eu-frankfurt-1"
}


data "oci_identity_availability_domains" "test_availability_domains" {
    #Required
    compartment_id ="ocid1.tenancy.oc1..aaaaaaaasg7dmeaivai6jirpcbl23ms3z4aohftxghilvru5b2eceujefw6a"
}


output all_domains {
 value= "${data.oci_identity_availability_domains.test_availability_domains.availability_domains}"
}
