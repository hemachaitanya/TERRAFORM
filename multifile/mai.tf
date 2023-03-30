provider "local" {

}
resource "local_file" "filename" {
  count    = length(var.filenames)
  content  = "to create multiple files"
  filename = "var.filenames"
  
}