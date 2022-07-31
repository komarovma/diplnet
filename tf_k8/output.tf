output "netology-vm-cp_external_ip" {
  value       = yandex_compute_instance.netology-vm-cp.network_interface.0.nat_ip_address
 }
output "netology-vm-cp_internal_ip" {
  value       = yandex_compute_instance.netology-vm-cp.network_interface.0.ip_address
 }


output "netology-vm-n1_external_ip" {
  value       = yandex_compute_instance.netology-vm-n1.network_interface.0.nat_ip_address
 }
output "netology-vm-n1_internal_ip" {
  value       = yandex_compute_instance.netology-vm-n1.network_interface.0.ip_address
 }


output "netology-vm-n2_external_ip" {
  value       = yandex_compute_instance.netology-vm-n2.network_interface.0.nat_ip_address
 }
output "netology-vm-n2_internal_ip" {
  value       = yandex_compute_instance.netology-vm-n2.network_interface.0.ip_address
 }
 output "netology-vm-n3_external_ip" {
  value       = yandex_compute_instance.netology-vm-n3.network_interface.0.nat_ip_address
 }
output "netology-vm-n3_internal_ip" {
  value       = yandex_compute_instance.netology-vm-n3.network_interface.0.ip_address
 }