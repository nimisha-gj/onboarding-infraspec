data "template_file" "user_data" {
  template = file(var.user_data_template_path)
}
