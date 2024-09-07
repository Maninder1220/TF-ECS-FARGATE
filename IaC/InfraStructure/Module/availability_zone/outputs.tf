
output "random_az" {
  value = element(random_shuffle.az.result, 0)
}
