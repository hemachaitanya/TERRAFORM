provider "local" {

}
resource "local_file" "chaitanya" {
    for_each = var.fileinfo
    content = each.value.content
    filename = each.value.name
  
}